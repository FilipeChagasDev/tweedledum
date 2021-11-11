/*------------------------------------------------------------------------------
| Part of Tweedledum Project.  This file is distributed under the MIT License.
| See accompanying file /LICENSE for details.
*-----------------------------------------------------------------------------*/
#include "tweedledum/Synthesis/sat_linear_synth.h"
#include "tweedledum/Operators/Standard/X.h"

#include <bill/sat/cardinality.hpp>
#include <bill/sat/solver.hpp>
#include <vector>

namespace tweedledum {

namespace {

template<typename Solver>
class CXSwapEncoder {
    using LBool = bill::lbool_type;
    using Lit = bill::lit_type;
    using Var = bill::var_type;

public:
    CXSwapEncoder(
      Device const& device, BMatrix const& transform, Solver& solver)
        : device_(&device)
        , transform_(transform)
        , use_symmetry_break_(true)
        , num_moments_(0)
        , offset_(num_matrix_vars() + num_ct_vars())
        , solver_(solver)
    {
        assert(device_->num_qubits() == transform_.rows());
    }

    CXSwapEncoder(BMatrix const& transform, Solver& solver)
        : device_(nullptr)
        , transform_(transform)
        , use_symmetry_break_(true)
        , num_moments_(0)
        , offset_(num_matrix_vars() + num_ct_vars())
        , solver_(solver)
    {}

    void encode()
    {
        // Create matrix variables
        solver_.add_variables(transform_.rows() * transform_.cols());

        // Encode initial states
        for (uint32_t row = 0u; row < transform_.rows(); ++row) {
            for (uint32_t column = 0u; column < transform_.cols(); ++column) {
                const auto polarity = (row == column) ? bill::positive_polarity
                                                      : bill::negative_polarity;
                Lit lit(matrix_var(0, row, column), polarity);
                solver_.add_clause(lit);
            }
        }
        // if (use_symmetry_break_) {
        //     symmetry_break_matrix(num_moments_);
        // }
        ++num_moments_;
    }

    std::vector<Lit> encode_assumptions() const
    {
        std::vector<Lit> assumptions;
        for (uint32_t row = 0u; row < num_qubits(); ++row) {
            for (uint32_t column = 0u; column < num_qubits(); ++column) {
                const auto polarity = transform_(row, column)
                                      ? bill::positive_polarity
                                      : bill::negative_polarity;
                assumptions.emplace_back(
                  matrix_var(num_moments_ - 1, row, column), polarity);
            }
        }
        return assumptions;
    }

    void encode_new_moment()
    {
        encode_cx_gates(num_moments_ - 1);
        assert((offset_ * num_moments_) == solver_.num_variables());

        encode_transition(num_moments_);
        if (use_symmetry_break_) {
            symmetry_break_matrix(num_moments_);
            if (num_moments_ >= 2) {
                symmetry_break_transition(num_moments_ - 1);
            }
        }
        ++num_moments_;
    }

    void decode(Circuit& circuit, std::vector<LBool> const& model)
    {
        for (uint32_t moment = 0u; moment < (num_moments_ - 1); ++moment) {
            uint32_t control = 0u;
            uint32_t target = 0u;
            for (uint32_t row = 0u; row < num_qubits(); ++row) {
                if (model.at(control_var(moment, row)) == LBool::true_) {
                    control = row;
                    assert(model.at(target_var(moment, row)) == LBool::false_);
                } else if (model.at(target_var(moment, row)) == LBool::true_) {
                    target = row;
                    assert(model.at(control_var(moment, row)) == LBool::false_);
                }
            }
            circuit.apply_operator(Op::X(), {Qubit(control), Qubit(target)});
        }
    }

    void decode(Circuit& circuit, std::vector<Qubit> const& qubits,
      std::vector<LBool> const& model)
    {
        for (uint32_t moment = 0u; moment < (num_moments_ - 1); ++moment) {
            uint32_t control = 0u;
            uint32_t target = 0u;
            for (uint32_t row = 0u; row < num_qubits(); ++row) {
                if (model.at(control_var(moment, row)) == LBool::true_) {
                    control = row;
                    assert(model.at(target_var(moment, row)) == LBool::false_);
                } else if (model.at(target_var(moment, row)) == LBool::true_) {
                    target = row;
                    assert(model.at(control_var(moment, row)) == LBool::false_);
                }
            }
            circuit.apply_operator(
              Op::X(), {qubits.at(control), qubits.at(target)});
        }
    }

private:
    uint32_t num_matrix_vars() const
    {
        return transform_.rows() * transform_.rows();
    }

    // Number of control/target variables
    uint32_t num_ct_vars() const
    {
        // Every qubit can be either a control or a target
        return 2 * num_qubits();
    }

    uint32_t num_qubits() const
    {
        return transform_.rows();
    }

    void encode_cx_gates(uint32_t moment)
    {
        std::vector<Var> control;
        std::vector<Var> target;

        // Create control and target variables
        solver_.add_variables(2 * num_qubits());

        for (uint32_t row = 0u; row < num_qubits(); ++row) {
            control.emplace_back(control_var(moment, row));
            target.emplace_back(target_var(moment, row));
        }
        bill::at_least_one(control, solver_);
        bill::at_most_one_pairwise(control, solver_);
        bill::at_least_one(target, solver_);
        bill::at_most_one_pairwise(target, solver_);

        std::vector<Lit> clause;
        for (uint32_t row = 0u; row < num_qubits(); ++row) {
            clause.emplace_back(
              control_var(moment, row), bill::negative_polarity);
            clause.emplace_back(
              target_var(moment, row), bill::negative_polarity);
            solver_.add_clause(clause);
            for (uint32_t column = 0u; device_ && column < num_qubits(); ++column) {
                if (device_->are_connected(row, column)) {
                    continue;
                }
                clause.back() =
                  Lit(target_var(moment, column), bill::negative_polarity);
                solver_.add_clause(clause);
            }
            clause.clear();
        }
    }

    void encode_transition(uint32_t moment)
    {
        // Create matrix variables for new moment
        solver_.add_variables(transform_.rows() * transform_.cols());

        std::vector<Lit> clause;
        for (uint32_t row = 0u; row < num_qubits(); ++row) {
            for (uint32_t column = 0u; column < num_qubits(); ++column) {
                clause.emplace_back(
                  target_var(moment - 1, row), bill::positive_polarity);
                clause.emplace_back(
                  matrix_var(moment - 1, row, column), bill::negative_polarity);
                clause.emplace_back(
                  matrix_var(moment, row, column), bill::positive_polarity);
                solver_.add_clause(clause);

                clause.at(1) = Lit(
                  matrix_var(moment - 1, row, column), bill::positive_polarity);
                clause.at(2) =
                  Lit(matrix_var(moment, row, column), bill::negative_polarity);
                solver_.add_clause(clause);

                encode_more_dependencies(moment, row, column);
                clause.clear();
            }
        }
    }

    void encode_more_dependencies(
      uint32_t moment, uint32_t row, uint32_t column)
    {
        for (uint32_t other_row = 0u; other_row < num_qubits(); ++other_row) {
            if (other_row == row) {
                continue;
            }
            std::vector<Lit> clause;
            clause.emplace_back(
              target_var(moment - 1, row), bill::negative_polarity);
            clause.emplace_back(
              control_var(moment - 1, other_row), bill::negative_polarity);

            clause.emplace_back(
              matrix_var(moment - 1, row, column), bill::negative_polarity);
            clause.emplace_back(matrix_var(moment - 1, other_row, column),
              bill::negative_polarity);
            clause.emplace_back(
              matrix_var(moment, row, column), bill::negative_polarity);
            solver_.add_clause(clause);

            clause.at(3).complement();
            clause.at(4).complement();
            solver_.add_clause(clause);

            clause.at(2).complement();
            clause.at(3).complement();
            solver_.add_clause(clause);

            clause.at(3).complement();
            clause.at(4).complement();
            solver_.add_clause(clause);
        }
    }

    void symmetry_break_matrix(uint32_t moment)
    {
        std::vector<Lit> clause;
        /* there cannot be a row with all zeroes */
        for (uint32_t row = 0u; row < num_qubits(); ++row) {
            for (uint32_t column = 0u; column < num_qubits(); ++column) {
                clause.emplace_back(
                  matrix_var(moment, row, column), bill::positive_polarity);
            }
            solver_.add_clause(clause);
        }
        clause.clear();

        /* there cannot be a column with all zeroes */
        for (uint32_t column = 0u; column < num_qubits(); ++column) {
            for (uint32_t row = 0u; row < num_qubits(); ++row) {
                clause.emplace_back(
                  matrix_var(moment, row, column), bill::positive_polarity);
            }
            solver_.add_clause(clause);
        }
    }

    void symmetry_break_transition(uint32_t moment)
    {
        std::vector<Lit> clause;

        /* same control, first target must be smaller than others */
        for (uint32_t control0 = 0u; control0 < num_qubits(); ++control0) {
            for (uint32_t target0 = 1u; target0 < num_qubits(); ++target0) {
                if (control0 == target0) {
                    continue;
                }
                for (uint32_t target1 = 0u; target1 < target0; ++target1) {
                    if (control0 == target1) {
                        continue;
                    }
                    clause.emplace_back(control_var(moment - 1, control0),
                      bill::negative_polarity);
                    clause.emplace_back(
                      control_var(moment, control0), bill::negative_polarity);
                    clause.emplace_back(
                      target_var(moment - 1, target0), bill::negative_polarity);
                    clause.emplace_back(
                      target_var(moment, target1), bill::negative_polarity);
                    solver_.add_clause(clause);
                    clause.clear();
                }
            }
        }
    }

    Var matrix_var(uint32_t moment, uint32_t row, uint32_t column) const
    {
        Var var = (moment * offset_) + (row * num_qubits()) + column;
        assert(var < Var(solver_.num_variables()));
        return var;
    }

    Var control_var(uint32_t moment, uint32_t row) const
    {
        Var var = moment * offset_ + num_matrix_vars() + row;
        assert(var < Var(solver_.num_variables()));
        return var;
    }

    Var target_var(uint32_t moment, uint32_t row) const
    {
        Var var = moment * offset_ + num_matrix_vars() + num_qubits() + row;
        assert(var < Var(solver_.num_variables()));
        return var;
    }

    Device const* device_;
    BMatrix const& transform_;

    // Parameters
    bool use_symmetry_break_;

    // Encoded problem
    uint32_t num_moments_;
    uint32_t offset_;
    Solver& solver_;
};

} // namespace

void sat_linear_synth(Circuit& circuit, std::vector<Qubit> const& qubits,
  std::vector<Cbit> const& cbits, BMatrix const& transform,
  [[maybe_unused]] nlohmann::json const& config)
{
    bill::solver solver;
    CXSwapEncoder encoder(transform, solver);
    encoder.encode();
    do {
        std::vector<bill::lit_type> assumptions = encoder.encode_assumptions();
        solver.solve(assumptions);
        bill::result result = solver.get_result();
        if (result) {
            encoder.decode(circuit, qubits, result.model());
            return;
        }
        encoder.encode_new_moment();
    } while (1);
}

Circuit sat_linear_synth(BMatrix const& transform, nlohmann::json const& config)
{
    Circuit circuit;
    std::vector<Qubit> qubits;
    qubits.reserve(transform.rows());
    for (uint32_t i = 0u; i < transform.rows(); ++i) {
        qubits.emplace_back(circuit.create_qubit());
    }
    sat_linear_synth(circuit, qubits, {}, transform, config);
    return circuit;
}

void sat_linear_synth(Device const& device, Circuit& circuit,
  BMatrix const& transform, [[maybe_unused]] nlohmann::json const& config)
{
    assert(transform.rows() <= 32);

    bill::solver solver;
    CXSwapEncoder encoder(device, transform, solver);
    encoder.encode();
    do {
        std::vector<bill::lit_type> assumptions = encoder.encode_assumptions();
        solver.solve(assumptions);
        bill::result result = solver.get_result();
        if (result) {
            encoder.decode(circuit, result.model());
            return;
        }
        encoder.encode_new_moment();
    } while (1);
}

Circuit sat_linear_synth(
  Device const& device, BMatrix const& transform, nlohmann::json const& config)
{
    Circuit circuit;
    std::vector<Qubit> qubits;
    qubits.reserve(transform.rows());
    for (uint32_t i = 0u; i < transform.rows(); ++i) {
        qubits.emplace_back(circuit.create_qubit());
    }
    sat_linear_synth(device, circuit, transform, config);
    return circuit;
}

} // namespace tweedledum