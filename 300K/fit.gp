set term pdfcairo
set output "errors.pdf"
unset key
e1(x)=E1
e2(x)=E2
e4(x)=E4
e8(x)=E8
e16(x)=E16
e32(x)=E32
e64(x)=E64
e128(x)=E128
e256(x)=E256
e512(x)=E512
e1024(x)=E1024
e2048(x)=E2048

E1    = -0.000305515  #   +/- 2.269e-10    (7.425e-05%)
E2    = -0.000326501  #   +/- 3.085e-10    (9.449e-05%)
E4    = -0.000344096  #   +/- 5.428e-10    (0.0001578%)
E8    = -0.000311367  #   +/- 8.924e-10    (0.0002866%)
E16   = -0.000318248  #   +/- 1.314e-09    (0.0004128%)
E32   = -0.000300954  #   +/- 1.674e-09    (0.0005561%)
E64   = -0.000347626  #   +/- 2.987e-09    (0.0008594%)
E128  = -0.000347996  #   +/- 2.16e-08     (0.006207%)
E256  = -0.000281425  #   +/- 5.345e-08    (0.01899%)
E512  = -0.000255485  #   +/- 1.767e-06    (0.6918%)
E1024 = 3.71666e+40   #   +/- 1.92e+39     (5.165%)
E2048 = 5.28375e+27   #   +/- 1.83e+27     (34.64%)

fit e1(x)    "energy_1.dat"    u 1:($2+$3) via E1
fit e2(x)    "energy_2.dat"    u 1:($2+$3) via E2
fit e4(x)    "energy_4.dat"    u 1:($2+$3) via E4
fit e8(x)    "energy_8.dat"    u 1:($2+$3) via E8
fit e16(x)   "energy_16.dat"   u 1:($2+$3) via E16
fit e32(x)   "energy_32.dat"   u 1:($2+$3) via E32
fit e64(x)   "energy_64.dat"   u 1:($2+$3) via E64
fit e128(x)  "energy_128.dat"  u 1:($2+$3) via E128
fit e256(x)  "energy_256.dat"  u 1:($2+$3) via E256
fit e512(x)  "energy_512.dat"  u 1:($2+$3) via E512
fit e1024(x) "energy_1024.dat" u 1:($2+$3) via E1024
fit e2048(x) "energy_2048.dat" u 1:($2+$3) via E2048
set xlabel "time step"
set ylabel "Delta E(dt)"
#set xrange[0:2050]
set xrange[1:520]
set logscale y
set logscale x
plot "energy_1.dat"    u (  1):(2.269e-10) pt 7 lc "#0000FF",\
     "energy_2.dat"    u (  2):(3.085e-10) pt 7 lc "#0000FF",\
     "energy_4.dat"    u (  4):(5.428e-10) pt 7 lc "#0000FF",\
     "energy_8.dat"    u (  8):(8.924e-10) pt 7 lc "#0000FF",\
     "energy_16.dat"   u ( 16):(1.314e-09) pt 7 lc "#0000FF",\
     "energy_32.dat"   u ( 32):(1.674e-09) pt 7 lc "#0000FF",\
     "energy_64.dat"   u ( 64):(2.987e-09) pt 7 lc "#0000FF",\
     "energy_128.dat"  u (128):(2.160e-08) pt 7 lc "#0000FF",\
     "energy_256.dat"  u (256):(5.345e-08) pt 7 lc "#0000FF",\
     "energy_512.dat"  u (512):(1.767e-06) pt 7 lc "#0000FF"
