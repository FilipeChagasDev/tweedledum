OPENQASM 2.0;
include "qelib1.inc";
qreg q[13];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
rz(-0.29999999999999999) q[0];
rz(0.29999999999999999) q[1];
rz(-1.19999999999999996) q[1];
cx q[0], q[1];
rz(0.59999999999999998) q[1];
cx q[0], q[1];
rz(-0.35999999999999999) q[2];
rz(0.35999999999999999) q[3];
rz(-1.43999999999999995) q[3];
cx q[2], q[3];
rz(0.71999999999999997) q[3];
cx q[2], q[3];
rz(-0.12000000000000000) q[4];
rz(0.12000000000000000) q[5];
rz(-0.47999999999999998) q[5];
cx q[4], q[5];
rz(0.23999999999999999) q[5];
cx q[4], q[5];
rz(0.22000000000000000) q[6];
rz(-0.22000000000000000) q[7];
rz(0.88000000000000000) q[7];
cx q[6], q[7];
rz(-0.44000000000000000) q[7];
cx q[6], q[7];
rz(0.08000000000000000) q[8];
rz(-0.08000000000000000) q[9];
rz(0.32000000000000001) q[9];
cx q[8], q[9];
rz(-0.16000000000000000) q[9];
cx q[8], q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[11];
cx q[10], q[11];
rz(-1.00000000000000000) q[11];
cx q[10], q[11];
rz(0.26000000000000001) q[1];
rz(-0.26000000000000001) q[2];
rz(1.04000000000000004) q[2];
cx q[1], q[2];
rz(-0.52000000000000002) q[2];
cx q[1], q[2];
rz(-0.26000000000000001) q[3];
rz(0.26000000000000001) q[4];
rz(-1.04000000000000004) q[4];
cx q[3], q[4];
rz(0.52000000000000002) q[4];
cx q[3], q[4];
rz(0.38000000000000000) q[5];
rz(-0.38000000000000000) q[6];
rz(1.52000000000000002) q[6];
cx q[5], q[6];
rz(-0.76000000000000001) q[6];
cx q[5], q[6];
rz(-0.26000000000000001) q[7];
rz(0.26000000000000001) q[8];
rz(-1.04000000000000004) q[8];
cx q[7], q[8];
rz(0.52000000000000002) q[8];
cx q[7], q[8];
rz(-1.00000000000000000) q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[10];
cx q[9], q[10];
rz(-1.00000000000000000) q[10];
cx q[9], q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[12];
rz(-1.00000000000000000) q[12];
cx q[11], q[12];
rz(-1.00000000000000000) q[12];
cx q[11], q[12];
h q[0];
rz(-1.91999999999999993) q[0];
h q[0];
h q[1];
rz(-1.91999999999999993) q[1];
h q[1];
h q[2];
rz(-1.91999999999999993) q[2];
h q[2];
h q[3];
rz(-1.91999999999999993) q[3];
h q[3];
h q[4];
rz(-1.91999999999999993) q[4];
h q[4];
h q[5];
rz(-1.91999999999999993) q[5];
h q[5];
h q[6];
rz(-1.91999999999999993) q[6];
h q[6];
h q[7];
rz(-1.91999999999999993) q[7];
h q[7];
h q[8];
rz(-1.91999999999999993) q[8];
h q[8];
h q[9];
rz(-1.91999999999999993) q[9];
h q[9];
h q[10];
rz(-1.91999999999999993) q[10];
h q[10];
h q[11];
rz(-1.91999999999999993) q[11];
h q[11];
h q[12];
rz(-1.91999999999999993) q[12];
h q[12];
rz(-0.28799999999999998) q[0];
rz(0.86399999999999999) q[1];
rz(1.15199999999999991) q[2];
rz(-1.05600000000000005) q[3];
rz(-1.43999999999999995) q[4];
rz(-0.57599999999999996) q[5];
rz(1.53600000000000003) q[6];
rz(-0.28799999999999998) q[7];
rz(1.24800000000000000) q[8];
rz(-1.82400000000000007) q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[12];
rz(-0.90000000000000002) q[0];
rz(0.90000000000000002) q[1];
rz(-3.60000000000000009) q[1];
cx q[0], q[1];
rz(1.80000000000000004) q[1];
cx q[0], q[1];
rz(-1.08000000000000007) q[2];
rz(1.08000000000000007) q[3];
rz(-4.32000000000000028) q[3];
cx q[2], q[3];
rz(2.16000000000000014) q[3];
cx q[2], q[3];
rz(-0.35999999999999999) q[4];
rz(0.35999999999999999) q[5];
rz(-1.43999999999999995) q[5];
cx q[4], q[5];
rz(0.71999999999999997) q[5];
cx q[4], q[5];
rz(0.66000000000000003) q[6];
rz(-0.66000000000000003) q[7];
rz(2.64000000000000012) q[7];
cx q[6], q[7];
rz(-1.32000000000000006) q[7];
cx q[6], q[7];
rz(0.23999999999999999) q[8];
rz(-0.23999999999999999) q[9];
rz(0.95999999999999996) q[9];
cx q[8], q[9];
rz(-0.47999999999999998) q[9];
cx q[8], q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[11];
cx q[10], q[11];
rz(-1.00000000000000000) q[11];
cx q[10], q[11];
rz(0.78000000000000003) q[1];
rz(-0.78000000000000003) q[2];
rz(3.12000000000000011) q[2];
cx q[1], q[2];
rz(-1.56000000000000005) q[2];
cx q[1], q[2];
rz(-0.78000000000000003) q[3];
rz(0.78000000000000003) q[4];
rz(-3.12000000000000011) q[4];
cx q[3], q[4];
rz(1.56000000000000005) q[4];
cx q[3], q[4];
rz(1.13999999999999990) q[5];
rz(-1.13999999999999990) q[6];
rz(4.55999999999999961) q[6];
cx q[5], q[6];
rz(-2.27999999999999980) q[6];
cx q[5], q[6];
rz(-0.78000000000000003) q[7];
rz(0.78000000000000003) q[8];
rz(-3.12000000000000011) q[8];
cx q[7], q[8];
rz(1.56000000000000005) q[8];
cx q[7], q[8];
rz(-1.00000000000000000) q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[10];
cx q[9], q[10];
rz(-1.00000000000000000) q[10];
cx q[9], q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[12];
rz(-1.00000000000000000) q[12];
cx q[11], q[12];
rz(-1.00000000000000000) q[12];
cx q[11], q[12];
h q[0];
rz(-0.95999999999999996) q[0];
h q[0];
h q[1];
rz(-0.95999999999999996) q[1];
h q[1];
h q[2];
rz(-0.95999999999999996) q[2];
h q[2];
h q[3];
rz(-0.95999999999999996) q[3];
h q[3];
h q[4];
rz(-0.95999999999999996) q[4];
h q[4];
h q[5];
rz(-0.95999999999999996) q[5];
h q[5];
h q[6];
rz(-0.95999999999999996) q[6];
h q[6];
h q[7];
rz(-0.95999999999999996) q[7];
h q[7];
h q[8];
rz(-0.95999999999999996) q[8];
h q[8];
h q[9];
rz(-0.95999999999999996) q[9];
h q[9];
h q[10];
rz(-0.95999999999999996) q[10];
h q[10];
h q[11];
rz(-0.95999999999999996) q[11];
h q[11];
h q[12];
rz(-0.95999999999999996) q[12];
h q[12];
rz(-0.14399999999999999) q[0];
rz(0.43200000000000000) q[1];
rz(0.57599999999999996) q[2];
rz(-0.52800000000000002) q[3];
rz(-0.71999999999999997) q[4];
rz(-0.28799999999999998) q[5];
rz(0.76800000000000002) q[6];
rz(-0.14399999999999999) q[7];
rz(0.62400000000000000) q[8];
rz(-0.91200000000000003) q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[12];
rz(-1.50000000000000000) q[0];
rz(1.50000000000000000) q[1];
rz(-6.00000000000000000) q[1];
cx q[0], q[1];
rz(3.00000000000000000) q[1];
cx q[0], q[1];
rz(-1.80000000000000004) q[2];
rz(1.80000000000000004) q[3];
rz(-7.20000000000000018) q[3];
cx q[2], q[3];
rz(3.60000000000000009) q[3];
cx q[2], q[3];
rz(-0.59999999999999998) q[4];
rz(0.59999999999999998) q[5];
rz(-2.39999999999999991) q[5];
cx q[4], q[5];
rz(1.19999999999999996) q[5];
cx q[4], q[5];
rz(1.10000000000000009) q[6];
rz(-1.10000000000000009) q[7];
rz(4.40000000000000036) q[7];
cx q[6], q[7];
rz(-2.20000000000000018) q[7];
cx q[6], q[7];
rz(0.40000000000000002) q[8];
rz(-0.40000000000000002) q[9];
rz(1.60000000000000009) q[9];
cx q[8], q[9];
rz(-0.80000000000000004) q[9];
cx q[8], q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[11];
cx q[10], q[11];
rz(-1.00000000000000000) q[11];
cx q[10], q[11];
rz(1.30000000000000004) q[1];
rz(-1.30000000000000004) q[2];
rz(5.20000000000000018) q[2];
cx q[1], q[2];
rz(-2.60000000000000009) q[2];
cx q[1], q[2];
rz(-1.30000000000000004) q[3];
rz(1.30000000000000004) q[4];
rz(-5.20000000000000018) q[4];
cx q[3], q[4];
rz(2.60000000000000009) q[4];
cx q[3], q[4];
rz(1.89999999999999991) q[5];
rz(-1.89999999999999991) q[6];
rz(7.59999999999999964) q[6];
cx q[5], q[6];
rz(-3.79999999999999982) q[6];
cx q[5], q[6];
rz(-1.30000000000000004) q[7];
rz(1.30000000000000004) q[8];
rz(-5.20000000000000018) q[8];
cx q[7], q[8];
rz(2.60000000000000009) q[8];
cx q[7], q[8];
rz(-1.00000000000000000) q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[10];
cx q[9], q[10];
rz(-1.00000000000000000) q[10];
cx q[9], q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[12];
rz(-1.00000000000000000) q[12];
cx q[11], q[12];
rz(-1.00000000000000000) q[12];
cx q[11], q[12];
h q[0];
rz(-0.00000000000000000) q[0];
h q[0];
h q[1];
rz(-0.00000000000000000) q[1];
h q[1];
h q[2];
rz(-0.00000000000000000) q[2];
h q[2];
h q[3];
rz(-0.00000000000000000) q[3];
h q[3];
h q[4];
rz(-0.00000000000000000) q[4];
h q[4];
h q[5];
rz(-0.00000000000000000) q[5];
h q[5];
h q[6];
rz(-0.00000000000000000) q[6];
h q[6];
h q[7];
rz(-0.00000000000000000) q[7];
h q[7];
h q[8];
rz(-0.00000000000000000) q[8];
h q[8];
h q[9];
rz(-0.00000000000000000) q[9];
h q[9];
h q[10];
rz(-0.00000000000000000) q[10];
h q[10];
h q[11];
rz(-0.00000000000000000) q[11];
h q[11];
h q[12];
rz(-0.00000000000000000) q[12];
h q[12];
rz(-0.00000000000000000) q[0];
rz(0.00000000000000000) q[1];
rz(0.00000000000000000) q[2];
rz(-0.00000000000000000) q[3];
rz(-0.00000000000000000) q[4];
rz(-0.00000000000000000) q[5];
rz(0.00000000000000000) q[6];
rz(-0.00000000000000000) q[7];
rz(0.00000000000000000) q[8];
rz(-0.00000000000000000) q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[12];
rz(-2.10000000000000009) q[0];
rz(2.10000000000000009) q[1];
rz(-8.40000000000000036) q[1];
cx q[0], q[1];
rz(4.20000000000000018) q[1];
cx q[0], q[1];
rz(-2.52000000000000002) q[2];
rz(2.52000000000000002) q[3];
rz(-10.08000000000000007) q[3];
cx q[2], q[3];
rz(5.04000000000000004) q[3];
cx q[2], q[3];
rz(-0.83999999999999997) q[4];
rz(0.83999999999999997) q[5];
rz(-3.35999999999999988) q[5];
cx q[4], q[5];
rz(1.67999999999999994) q[5];
cx q[4], q[5];
rz(1.54000000000000004) q[6];
rz(-1.54000000000000004) q[7];
rz(6.16000000000000014) q[7];
cx q[6], q[7];
rz(-3.08000000000000007) q[7];
cx q[6], q[7];
rz(0.56000000000000005) q[8];
rz(-0.56000000000000005) q[9];
rz(2.24000000000000021) q[9];
cx q[8], q[9];
rz(-1.12000000000000011) q[9];
cx q[8], q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[11];
cx q[10], q[11];
rz(-1.00000000000000000) q[11];
cx q[10], q[11];
rz(1.82000000000000006) q[1];
rz(-1.82000000000000006) q[2];
rz(7.28000000000000025) q[2];
cx q[1], q[2];
rz(-3.64000000000000012) q[2];
cx q[1], q[2];
rz(-1.82000000000000006) q[3];
rz(1.82000000000000006) q[4];
rz(-7.28000000000000025) q[4];
cx q[3], q[4];
rz(3.64000000000000012) q[4];
cx q[3], q[4];
rz(2.66000000000000014) q[5];
rz(-2.66000000000000014) q[6];
rz(10.64000000000000057) q[6];
cx q[5], q[6];
rz(-5.32000000000000028) q[6];
cx q[5], q[6];
rz(-1.82000000000000006) q[7];
rz(1.82000000000000006) q[8];
rz(-7.28000000000000025) q[8];
cx q[7], q[8];
rz(3.64000000000000012) q[8];
cx q[7], q[8];
rz(-1.00000000000000000) q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[10];
cx q[9], q[10];
rz(-1.00000000000000000) q[10];
cx q[9], q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[12];
rz(-1.00000000000000000) q[12];
cx q[11], q[12];
rz(-1.00000000000000000) q[12];
cx q[11], q[12];
h q[0];
rz(0.95999999999999996) q[0];
h q[0];
h q[1];
rz(0.95999999999999996) q[1];
h q[1];
h q[2];
rz(0.95999999999999996) q[2];
h q[2];
h q[3];
rz(0.95999999999999996) q[3];
h q[3];
h q[4];
rz(0.95999999999999996) q[4];
h q[4];
h q[5];
rz(0.95999999999999996) q[5];
h q[5];
h q[6];
rz(0.95999999999999996) q[6];
h q[6];
h q[7];
rz(0.95999999999999996) q[7];
h q[7];
h q[8];
rz(0.95999999999999996) q[8];
h q[8];
h q[9];
rz(0.95999999999999996) q[9];
h q[9];
h q[10];
rz(0.95999999999999996) q[10];
h q[10];
h q[11];
rz(0.95999999999999996) q[11];
h q[11];
h q[12];
rz(0.95999999999999996) q[12];
h q[12];
rz(0.14399999999999999) q[0];
rz(-0.43200000000000000) q[1];
rz(-0.57599999999999996) q[2];
rz(0.52800000000000002) q[3];
rz(0.71999999999999997) q[4];
rz(0.28799999999999998) q[5];
rz(-0.76800000000000002) q[6];
rz(0.14399999999999999) q[7];
rz(-0.62400000000000000) q[8];
rz(0.91200000000000003) q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[12];
rz(-2.70000000000000018) q[0];
rz(2.70000000000000018) q[1];
rz(-10.80000000000000071) q[1];
cx q[0], q[1];
rz(5.40000000000000036) q[1];
cx q[0], q[1];
rz(-3.24000000000000021) q[2];
rz(3.24000000000000021) q[3];
rz(-12.96000000000000085) q[3];
cx q[2], q[3];
rz(6.48000000000000043) q[3];
cx q[2], q[3];
rz(-1.08000000000000007) q[4];
rz(1.08000000000000007) q[5];
rz(-4.32000000000000028) q[5];
cx q[4], q[5];
rz(2.16000000000000014) q[5];
cx q[4], q[5];
rz(1.97999999999999998) q[6];
rz(-1.97999999999999998) q[7];
rz(7.91999999999999993) q[7];
cx q[6], q[7];
rz(-3.95999999999999996) q[7];
cx q[6], q[7];
rz(0.71999999999999997) q[8];
rz(-0.71999999999999997) q[9];
rz(2.87999999999999989) q[9];
cx q[8], q[9];
rz(-1.43999999999999995) q[9];
cx q[8], q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[11];
cx q[10], q[11];
rz(-1.00000000000000000) q[11];
cx q[10], q[11];
rz(2.33999999999999986) q[1];
rz(-2.33999999999999986) q[2];
rz(9.35999999999999943) q[2];
cx q[1], q[2];
rz(-4.67999999999999972) q[2];
cx q[1], q[2];
rz(-2.33999999999999986) q[3];
rz(2.33999999999999986) q[4];
rz(-9.35999999999999943) q[4];
cx q[3], q[4];
rz(4.67999999999999972) q[4];
cx q[3], q[4];
rz(3.41999999999999993) q[5];
rz(-3.41999999999999993) q[6];
rz(13.67999999999999972) q[6];
cx q[5], q[6];
rz(-6.83999999999999986) q[6];
cx q[5], q[6];
rz(-2.33999999999999986) q[7];
rz(2.33999999999999986) q[8];
rz(-9.35999999999999943) q[8];
cx q[7], q[8];
rz(4.67999999999999972) q[8];
cx q[7], q[8];
rz(-1.00000000000000000) q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[10];
cx q[9], q[10];
rz(-1.00000000000000000) q[10];
cx q[9], q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[12];
rz(-1.00000000000000000) q[12];
cx q[11], q[12];
rz(-1.00000000000000000) q[12];
cx q[11], q[12];
h q[0];
rz(1.91999999999999993) q[0];
h q[0];
h q[1];
rz(1.91999999999999993) q[1];
h q[1];
h q[2];
rz(1.91999999999999993) q[2];
h q[2];
h q[3];
rz(1.91999999999999993) q[3];
h q[3];
h q[4];
rz(1.91999999999999993) q[4];
h q[4];
h q[5];
rz(1.91999999999999993) q[5];
h q[5];
h q[6];
rz(1.91999999999999993) q[6];
h q[6];
h q[7];
rz(1.91999999999999993) q[7];
h q[7];
h q[8];
rz(1.91999999999999993) q[8];
h q[8];
h q[9];
rz(1.91999999999999993) q[9];
h q[9];
h q[10];
rz(1.91999999999999993) q[10];
h q[10];
h q[11];
rz(1.91999999999999993) q[11];
h q[11];
h q[12];
rz(1.91999999999999993) q[12];
h q[12];
rz(0.28799999999999998) q[0];
rz(-0.86399999999999999) q[1];
rz(-1.15199999999999991) q[2];
rz(1.05600000000000005) q[3];
rz(1.43999999999999995) q[4];
rz(0.57599999999999996) q[5];
rz(-1.53600000000000003) q[6];
rz(0.28799999999999998) q[7];
rz(-1.24800000000000000) q[8];
rz(1.82400000000000007) q[9];
rz(-1.00000000000000000) q[10];
rz(-1.00000000000000000) q[11];
rz(-1.00000000000000000) q[12];