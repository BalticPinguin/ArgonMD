set term pdfcairo
set output "thermodyn.pdf"

#plot fluctuations of temperature:
# T(t) +error-bars

set colorbox vertical user origin .88, 0.077 size 0.04, 0.91
set logscale cb
set cbrange [1.1:101.1] 

set multiplot
set nokey
set nologscale y
set ylabel "T [K]" #check units!
set yrange [160:600]
unset xtics

set size   0.8800,0.57
set origin 0.0300, 0.47
plot "energy_100.dat"u 1:($4):(100+1.1) w l palette lw 2,\
     "energy_50.dat" u 1:($4):(50+1.1 ) w l palette lw 2,\
     "energy_20.dat" u 1:($4):(20+1.1 ) w l palette lw 2,\
     "energy_10.dat" u 1:($4):(10+1.1 ) w l palette lw 2,\
     "energy_5.dat"  u 1:($4):(5+1.1  ) w l palette lw 2,\
     "energy_2.dat"  u 1:($4):(2+1.1  ) w l palette lw 2,\
     "energy_1.dat"  u 1:($4):(1+1.1  ) w l palette lw 2,\
     "energy_0.dat"  u 1:($4):(0+1.1  ) w l palette lw 2


f100(x)=500+b_100*exp(-gamma_100*x)
f50(x)=500+b_50*exp(-gamma_50*x)
f20(x)=500+b_20*exp(-gamma_20*x)
f10(x)=500+b_10*exp(-gamma_10*x)
f5(x)=500+b_5*exp(-gamma_5*x)
f2(x)=500+b_2*exp(-gamma_2*x)
f1(x)=500+b_1*exp(-gamma_1*x)
f0(x)=500+b_0
b_100    = -300.000477409  #   +/- 8.289e-05    (17.36%)
gamma_100= 3.00004       #   +/- 1.835e+11    (6.116e+12%)
b_50     = -300.000661847  #   +/- 3.1e-05      (4.683%)
gamma_50 = 0.0117303     #   +/- 0.0008383    (7.147%)
b_20     = -300.00056822   #   +/- 2.069e-05    (3.641%)
gamma_20 = 0.00983187    #   +/- 0.0005432    (5.525%)
b_10     = -300.00053343   #   +/- 1.27e-05     (2.382%)
gamma_10 = 0.00662175    #   +/- 0.0002384    (3.6%)
b_5      = -300.000420707  #   +/- 5.101e-06    (1.213%)
gamma_5  = 0.00313259    #   +/- 5.908e-05    (1.886%)
b_2      = -300.000489232  #   +/- 2.253e-06    (0.4606%)
gamma_2  = 0.000885506   #   +/- 9.594e-06    (1.083%)
b_1      = -300.000734194  #   +/- 9.604e-07    (0.1308%)
gamma_1  = 0.000359676   #   +/- 1.25e-06     (0.3474%)
b_0      = -320.9435      #   +/- 1.274e+07    (3.869e+07%)

fit f100(x) "energy_100.dat" u 1:4 via b_100, gamma_100
fit  f50(x)  "energy_50.dat" u 1:4 via b_50 , gamma_50
fit  f20(x)  "energy_20.dat" u 1:4 via b_20, gamma_20
fit  f10(x)  "energy_10.dat" u 1:4 via b_10, gamma_10
fit  f5(x)   "energy_5.dat"  u 1:4 via  b_5,  gamma_5
fit  f2(x)   "energy_2.dat"  u 1:4 via  b_2,  gamma_2
fit  f1(x)   "energy_1.dat"  u 1:4 via  b_1,  gamma_1
fit  f0(x)   "energy_0.dat"  u 1:4 via  b_0

set size 0.91,0.57
set origin 0.0,-0.01
#set logscale y
set yrange [0:100]
set xtics 1000
set ylabel "|T(t)-<T>| [K]" #check units!

plot "energy_100.dat"u 1:(abs($4-f100($1))):(100+1.1) w l palette lw 2,\
     "energy_50.dat" u 1:(abs($4- f50($1))):(50+1.1 ) w l palette lw 2,\
     "energy_20.dat" u 1:(abs($4- f20($1))):(20+1.1 ) w l palette lw 2,\
     "energy_10.dat" u 1:(abs($4- f10($1))):(10+1.1 ) w l palette lw 2,\
     "energy_5.dat"  u 1:(abs($4-  f5($1))):(5+1.1  ) w l palette lw 2,\
     "energy_2.dat"  u 1:(abs($4-  f2($1))):(2+1.1  ) w l palette lw 2,\
     "energy_1.dat"  u 1:(abs($4-  f1($1))):(1+1.1  ) w l palette lw 2,\
     "energy_0.dat"  u 1:(abs($4-  f0($1))):(0+1.1  ) w l palette lw 2
