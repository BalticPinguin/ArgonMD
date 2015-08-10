#set term postscript enhanced color
#set output "energy.ps"
set term pdfcairo size 15, 6
set output "CompSyst.pdf"

#set palette defined(1 "#FFFFFF", 2 "#0000FF", 4 "#00FFFF", 8 "#FFFF00", 16 "#ADD8E6", 32 "#FF0000")
set colorbox vertical user origin .88, 0.077 size 0.04, 0.915
set cbrange [0:100] 
set xrange [0:5000]

unset key
set multiplot
set size   0.3,0.45
set origin 0.033, 0.5
set yrange [160:600]
set ylabel "T [K]"
unset xtics
plot "energy_0.dat"  u 1:($4):(0  ) w l palette lw 2,\
     "energy_1.dat"  u 1:($4):(1  ) w l palette lw 2,\
     "energy_2.dat"  u 1:($4):(2  ) w l palette lw 2,\
     "energy_3.dat"  u 1:($4):(3  ) w l palette lw 2,\
     "energy_4.dat"  u 1:($4):(4  ) w l palette lw 2,\
     "energy_5.dat"  u 1:($4):(5  ) w l palette lw 2,\
     "energy_6.dat"  u 1:($4):(6  ) w l palette lw 2,\
     "energy_7.dat"  u 1:($4):(7  ) w l palette lw 2,\
     "energy_8.dat"  u 1:($4):(8  ) w l palette lw 2,\
     "energy_9.dat"  u 1:($4):(9  ) w l palette lw 2,\
     "energy_10.dat" u 1:($4):(10 ) w l palette lw 2,\
     "energy_20.dat" u 1:($4):(20 ) w l palette lw 2,\
     "energy_30.dat" u 1:($4):(30 ) w l palette lw 2,\
     "energy_40.dat" u 1:($4):(40 ) w l palette lw 2,\
     "energy_50.dat" u 1:($4):(50 ) w l palette lw 2,\
     "energy_60.dat" u 1:($4):(60 ) w l palette lw 2,\
     "energy_70.dat" u 1:($4):(70 ) w l palette lw 2,\
     "energy_80.dat" u 1:($4):(80 ) w l palette lw 2,\
     "energy_90.dat" u 1:($4):(90 ) w l palette lw 2,\
     "energy_100.dat"u 1:($4):(100) w l palette lw 2

set size 0.3, 0.5
set origin 0.033,-0.00
set yrange [-0.0003:0.0007]
set nologscale y
set xtics 1000
set ylabel "E(t) [K]" # check unit!!

plot "energy_100.dat"u 1:($2+$3):(100) w l palette lw 2,\
     "energy_90.dat" u 1:($2+$3):(90 ) w l palette lw 2,\
     "energy_80.dat" u 1:($2+$3):(80 ) w l palette lw 2,\
     "energy_70.dat" u 1:($2+$3):(70 ) w l palette lw 2,\
     "energy_60.dat" u 1:($2+$3):(60 ) w l palette lw 2,\
     "energy_50.dat" u 1:($2+$3):(50 ) w l palette lw 2,\
     "energy_40.dat" u 1:($2+$3):(40 ) w l palette lw 2,\
     "energy_30.dat" u 1:($2+$3):(30 ) w l palette lw 2,\
     "energy_20.dat" u 1:($2+$3):(20 ) w l palette lw 2,\
     "energy_10.dat" u 1:($2+$3):(10 ) w l palette lw 2,\
     "energy_9.dat"  u 1:($2+$3):(9  ) w l palette lw 2,\
     "energy_8.dat"  u 1:($2+$3):(8  ) w l palette lw 2,\
     "energy_7.dat"  u 1:($2+$3):(7  ) w l palette lw 2,\
     "energy_6.dat"  u 1:($2+$3):(6  ) w l palette lw 2,\
     "energy_5.dat"  u 1:($2+$3):(5  ) w l palette lw 2,\
     "energy_4.dat"  u 1:($2+$3):(4  ) w l palette lw 2,\
     "energy_3.dat"  u 1:($2+$3):(3  ) w l palette lw 2,\
     "energy_2.dat"  u 1:($2+$3):(2  ) w l palette lw 2,\
     "energy_1.dat"  u 1:($2+$3):(1  ) w l palette lw 2,\
     "energy_0.dat"  u 1:($2+$3):(0  ) w l palette lw 2

set size   0.3333,0.5
set origin 0.333, 0.5
set yrange [400:700]
unset ylabel
unset xtics
plot "longrun/energy_1.dat"  u 1:($4):(1  ) w l palette lw 2,\
     "longrun/energy_2.dat"  u 1:($4):(2  ) w l palette lw 2,\
     "longrun/energy_3.dat"  u 1:($4):(3  ) w l palette lw 2,\
     "longrun/energy_4.dat"  u 1:($4):(4  ) w l palette lw 2,\
     "longrun/energy_5.dat"  u 1:($4):(5  ) w l palette lw 2,\
     "longrun/energy_6.dat"  u 1:($4):(6  ) w l palette lw 2,\
     "longrun/energy_7.dat"  u 1:($4):(7  ) w l palette lw 2,\
     "longrun/energy_8.dat"  u 1:($4):(8  ) w l palette lw 2,\
     "longrun/energy_9.dat"  u 1:($4):(9  ) w l palette lw 2,\
     "longrun/energy_20.dat" u 1:($4):(20 ) w l palette lw 2,\
     "longrun/energy_30.dat" u 1:($4):(30 ) w l palette lw 2,\
     "longrun/energy_40.dat" u 1:($4):(40 ) w l palette lw 2,\
     "longrun/energy_50.dat" u 1:($4):(50 ) w l palette lw 2,\
     "longrun/energy_60.dat" u 1:($4):(60 ) w l palette lw 2,\
     "longrun/energy_70.dat" u 1:($4):(70 ) w l palette lw 2,\
     "longrun/energy_80.dat" u 1:($4):(80 ) w l palette lw 2,\
     "longrun/energy_90.dat" u 1:($4):(90 ) w l palette lw 2,\
     "longrun/energy_100.dat"u 1:($4):(100) w l palette lw 2

set size 0.3333, 0.5
set origin 0.333,-0.00
set yrange [0.0000:0.0007]
set nologscale y
set xtics 1000

plot "longrun/energy_100.dat" u 1:($2+$3):(100) w l palette lw 2,\
     "longrun/energy_90.dat" u 1:($2+$3):(90 ) w l palette lw 2,\
     "longrun/energy_80.dat" u 1:($2+$3):(80 ) w l palette lw 2,\
     "longrun/energy_70.dat" u 1:($2+$3):(70 ) w l palette lw 2,\
     "longrun/energy_60.dat" u 1:($2+$3):(60 ) w l palette lw 2,\
     "longrun/energy_50.dat" u 1:($2+$3):(50 ) w l palette lw 2,\
     "longrun/energy_40.dat" u 1:($2+$3):(40 ) w l palette lw 2,\
     "longrun/energy_30.dat" u 1:($2+$3):(30 ) w l palette lw 2,\
     "longrun/energy_20.dat" u 1:($2+$3):(20 ) w l palette lw 2,\
     "longrun/energy_9.dat"  u 1:($2+$3):(9  ) w l palette lw 2,\
     "longrun/energy_8.dat"  u 1:($2+$3):(8  ) w l palette lw 2,\
     "longrun/energy_7.dat"  u 1:($2+$3):(7  ) w l palette lw 2,\
     "longrun/energy_6.dat"  u 1:($2+$3):(6  ) w l palette lw 2,\
     "longrun/energy_5.dat"  u 1:($2+$3):(5  ) w l palette lw 2,\
     "longrun/energy_4.dat"  u 1:($2+$3):(4  ) w l palette lw 2,\
     "longrun/energy_3.dat"  u 1:($2+$3):(3  ) w l palette lw 2,\
     "longrun/energy_2.dat"  u 1:($2+$3):(2  ) w l palette lw 2,\
     "longrun/energy_1.dat"  u 1:($2+$3):(1  ) w l palette lw 2

set size   0.3333,0.5
set origin 0.666, 0.5
set yrange [400:700]
unset ylabel
unset xtics
plot "largebox/energy_10.dat" u 1:($4):(10 ) w l palette lw 2,\
     "largebox/energy_20.dat" u 1:($4):(20 ) w l palette lw 2,\
     "largebox/energy_30.dat" u 1:($4):(30 ) w l palette lw 2

set size 0.3333, 0.5
set origin 0.666,-0.00
set yrange [0.0000:0.0028]
set nologscale y
set xtics 1000

plot "largebox/energy_10.dat" u 1:($2+$3):(30 ) w l palette lw 2,\
     "largebox/energy_20.dat" u 1:($2+$3):(20 ) w l palette lw 2,\
     "largebox/energy_30.dat" u 1:($2+$3):(10 ) w l palette lw 2
