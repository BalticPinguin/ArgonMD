#set term postscript enhanced color
#set output "energy.ps"
set term pdfcairo
set output "energy.pdf"

#set palette defined(1 "#FFFFFF", 2 "#0000FF", 4 "#00FFFF", 8 "#FFFF00", 16 "#ADD8E6", 32 "#FF0000")
set colorbox vertical user origin .88, 0.077 size 0.04, 0.915
set cbrange [20:520] 

unset key
set multiplot
set size   0.8500,0.57
set origin 0.0600, 0.47
#set yrange [20:130]
set ylabel "T [K]"
unset xtics

plot "energy_520.dat"  u 1:($4):(520) w l palette lw 2,\
     "energy_420.dat"  u 1:($4):(420) w l palette lw 2,\
     "energy_400.dat"  u 1:($4):(400) w l palette lw 2,\
     "energy_380.dat"  u 1:($4):(380) w l palette lw 2,\
     "energy_360.dat"  u 1:($4):(360) w l palette lw 2,\
     "energy_340.dat"  u 1:($4):(340) w l palette lw 2,\
     "energy_320.dat"  u 1:($4):(320) w l palette lw 2,\
     "energy_300.dat"  u 1:($4):(300) w l palette lw 2,\
     "energy_220.dat"  u 1:($4):(220) w l palette lw 2,\
     "energy_120.dat"  u 1:($4):(120) w l palette lw 2,\
     "energy_20.dat"   u 1:($4):(20 ) w l palette lw 2

set size 0.91,0.57
set origin 0.0,-0.01
#set yrange [-0.0005:-0.00026]
set nologscale y
set xtics 1000
set ylabel "E(t) [K]" # check unit!!

plot "energy_520.dat"  u 1:($2+$3):(520) w l palette lw 2,\
     "energy_420.dat"  u 1:($2+$3):(420) w l palette lw 2,\
     "energy_400.dat"  u 1:($2+$3):(400) w l palette lw 2,\
     "energy_380.dat"  u 1:($2+$3):(380) w l palette lw 2,\
     "energy_360.dat"  u 1:($2+$3):(360) w l palette lw 2,\
     "energy_340.dat"  u 1:($2+$3):(340) w l palette lw 2,\
     "energy_320.dat"  u 1:($2+$3):(320) w l palette lw 2,\
     "energy_300.dat"  u 1:($2+$3):(300) w l palette lw 2,\
     "energy_220.dat"  u 1:($2+$3):(220) w l palette lw 2,\
     "energy_120.dat"  u 1:($2+$3):(120) w l palette lw 2,\
     "energy_20.dat"   u 1:($2+$3):(20 ) w l palette lw 2
