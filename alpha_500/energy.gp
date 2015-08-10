#set term postscript enhanced color
#set output "energy.ps"
set term pdfcairo
set output "energy.pdf"

#set palette defined(1 "#FFFFFF", 2 "#0000FF", 4 "#00FFFF", 8 "#FFFF00", 16 "#ADD8E6", 32 "#FF0000")
set colorbox vertical user origin .860, 0.127 size 0.04, 0.858
set cbrange [0.002:1] 
set logscale cb

unset key
set multiplot
set size   0.900,0.525
set origin -0.010, 0.51
set yrange [160:600]
set ylabel "T [K]"
unset xtics
plot "energy_0.dat"  u 1:($4):(0.00) w l palette lw 2,\
     "energy_1.dat"  u 1:($4):(0.01) w l palette lw 2,\
     "energy_10.dat" u 1:($4):(0.10) w l palette lw 2,\
     "energy_100.dat"u 1:($4):(1.00) w l palette lw 2

#plot "energy_0.dat"  u 1:($4):(0.00) w l palette lw 2,\
#     "energy_1.dat"  u 1:($4):(0.01) w l palette lw 2,\
#     "energy_2.dat"  u 1:($4):(0.02) w l palette lw 2,\
#     "energy_3.dat"  u 1:($4):(0.03) w l palette lw 2,\
#     "energy_4.dat"  u 1:($4):(0.04) w l palette lw 2,\
#     "energy_5.dat"  u 1:($4):(0.05) w l palette lw 2,\
#     "energy_6.dat"  u 1:($4):(0.06) w l palette lw 2,\
#     "energy_7.dat"  u 1:($4):(0.07) w l palette lw 2,\
#     "energy_8.dat"  u 1:($4):(0.08) w l palette lw 2,\
#     "energy_9.dat"  u 1:($4):(0.09) w l palette lw 2,\
#     "energy_10.dat" u 1:($4):(0.10) w l palette lw 2,\
#     "energy_20.dat" u 1:($4):(0.20) w l palette lw 2,\
#     "energy_30.dat" u 1:($4):(0.30) w l palette lw 2,\
#     "energy_40.dat" u 1:($4):(0.40) w l palette lw 2,\
#     "energy_50.dat" u 1:($4):(0.50) w l palette lw 2,\
#     "energy_60.dat" u 1:($4):(0.60) w l palette lw 2,\
#     "energy_70.dat" u 1:($4):(0.70) w l palette lw 2,\
#     "energy_80.dat" u 1:($4):(0.80) w l palette lw 2,\
#     "energy_90.dat" u 1:($4):(0.90) w l palette lw 2,\
#     "energy_100.dat"u 1:($4):(100 ) w l palette lw 2

set size 0.875,0.60
set origin 0.015,-0.01
set yrange [-3:7]
set nologscale y
set xtics 1000
set ylabel "E(t) [J]" # check unit!!
set xlabel "t [ps]"

#plot "energy_100.dat"u 1:(($2+$3)*1e4):(1.00) w l palette lw 2,\
#     "energy_90.dat" u 1:(($2+$3)*1e4):(0.90) w l palette lw 2,\
#     "energy_80.dat" u 1:(($2+$3)*1e4):(0.80) w l palette lw 2,\
#     "energy_70.dat" u 1:(($2+$3)*1e4):(0.70) w l palette lw 2,\
#     "energy_60.dat" u 1:(($2+$3)*1e4):(0.60) w l palette lw 2,\
#     "energy_50.dat" u 1:(($2+$3)*1e4):(0.50) w l palette lw 2,\
#     "energy_40.dat" u 1:(($2+$3)*1e4):(0.40) w l palette lw 2,\
#     "energy_30.dat" u 1:(($2+$3)*1e4):(0.30) w l palette lw 2,\
#     "energy_20.dat" u 1:(($2+$3)*1e4):(0.20) w l palette lw 2,\
#     "energy_10.dat" u 1:(($2+$3)*1e4):(0.10) w l palette lw 2,\
#     "energy_9.dat"  u 1:(($2+$3)*1e4):(0.09) w l palette lw 2,\
#     "energy_8.dat"  u 1:(($2+$3)*1e4):(0.08) w l palette lw 2,\
#     "energy_7.dat"  u 1:(($2+$3)*1e4):(0.07) w l palette lw 2,\
#     "energy_6.dat"  u 1:(($2+$3)*1e4):(0.06) w l palette lw 2,\
#     "energy_5.dat"  u 1:(($2+$3)*1e4):(0.05) w l palette lw 2,\
#     "energy_4.dat"  u 1:(($2+$3)*1e4):(0.04) w l palette lw 2,\
#     "energy_3.dat"  u 1:(($2+$3)*1e4):(0.03) w l palette lw 2,\
#     "energy_2.dat"  u 1:(($2+$3)*1e4):(0.02) w l palette lw 2,\
#     "energy_1.dat"  u 1:(($2+$3)*1e4):(0.01) w l palette lw 2,\
#     "energy_0.dat"  u 1:(($2+$3)*1e4):(0.00) w l palette lw 2
plot "energy_100.dat"u 1:(($2+$3)*1e4):(1.00) w l palette lw 2,\
     "energy_10.dat" u 1:(($2+$3)*1e4):(0.10) w l palette lw 2,\
     "energy_1.dat"  u 1:(($2+$3)*1e4):(0.01) w l palette lw 2,\
     "energy_0.dat"  u 1:(($2+$3)*1e4):(0.0 ) w l palette lw 2
