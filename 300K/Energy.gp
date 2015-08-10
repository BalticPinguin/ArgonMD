set term pdfcairo
set output "energy.pdf"

set colorbox vertical user origin .88, 0.077 size 0.04, 0.915
set logscale cb
set cbrange [1:2048] 

A=800;  # This is where the break point is located  
B=3000; # This is how much is cut out of the graph 
C=0;    # The lower limit of the graph 
D=5000; # The upper limit (with the cut-out) of the graph 
eps2=0.015*(D-B-C)

 
f(x) = (x<A-eps2?1:1/0)
g(x) = (x>A+eps2?1:1/0)
h(x) = (x<A?x:x+B)
#set xtics 0, 2, A

set xtics 0, 200, A
set xtics add (gprintf("%.0f", 0+B+A) 0+A)
set xtics add (gprintf("%.0f", 200+B+A) 200+A)
set xtics add (gprintf("%.0f", 400+B+A) 400+A)
set xtics add (gprintf("%.0f", 800+B+A) 800+A)

unset key
set multiplot
E1=0.00023593891524702191 -0.00054138513148360517 
E2=0.00021498840194270215 -0.00054138513148360517 
E4=0.00019741582463584295 -0.00054138513148360517 
E8=0.00023020415193644018 -0.00054138513148360517 
E16=0.00022332941267083075 -0.00054138513148360517 
E32=0.0002405400744929571 -0.00054138513148360517 
E64=0.0001942335729682277 -0.00054138513148360517 
E128=0.00019429182090183989 -0.00054138513148360517 
E256=0.00025926510596021706 -0.00054138513148360517 
E512=0.00025095690607191003 -0.00054138513148360517 
E1024=0.00034088059880415378 -0.00054138513148360517 
E2048=0.00023214215081584938 -0.00054138513148360517 

set size   0.8803,0.57
set origin 0.0297, 0.47
set ylabel "T [K]"
unset xtics

E1=50;         # The min of the y range
E2=200;           # The max of the y range
eps=0.05*(E2-E1)

set yrange [E1:E2]
set arrow 1 from A-eps2, E1 to A+eps2, E1 nohead lc rgb "#ffffff" front
set arrow 2 from A-eps2, E2 to A+eps2, E2 nohead lc rgb "#ffffff" front
set arrow 3 from A-eps-eps2, E1-eps to A+eps-eps2, E1+eps nohead front
set arrow 4 from A-eps+eps2, E1-eps to A+eps+eps2, E1+eps nohead front
set arrow 5 from A-eps-eps2, E2-eps to A+eps-eps2, E2+eps nohead front
set arrow 6 from A-eps+eps2, E2-eps to A+eps+eps2, E2+eps nohead front

plot "energy_2048.dat" u 1:(f($1)*$4):(1024) w l palette lw 2,\
     "energy_1024.dat" u 1:(f($1)*$4):(1024) w l palette lw 2,\
     "energy_512.dat"  u 1:(f($1)*$4):(512 ) w l palette lw 2,\
     "energy_256.dat"  u 1:(f($1)*$4):(256 ) w l palette lw 2,\
     "energy_128.dat"  u 1:(f($1)*$4):(128 ) w l palette lw 2,\
     "energy_64.dat"   u 1:(f($1)*$4):(64  ) w l palette lw 2,\
      "energy_32.dat"  u 1:(f($1)*$4):(32) w l palette lw 2,\
      "energy_16.dat"  u 1:(f($1)*$4):(16) w l palette lw 2,\
      "energy_8.dat"   u 1:(f($1)*$4):(8 ) w l palette lw 2,\
      "energy_4.dat"   u 1:(f($1)*$4):(4 ) w l palette lw 2,\
      "energy_2.dat"   u 1:(f($1)*$4):(2 ) w l palette lw 2,\
      "energy_1.dat"   u 1:(f($1)*$4):(1 ) w l palette lw 2,\
     "energy_2048.dat" u 1:(g($1)*h($4)):(1024) w l palette lw 2,\
     "energy_1024.dat" u 1:(g($1)*h($4)):(1024) w l palette lw 2,\
     "energy_512.dat"  u 1:(g($1)*h($4)):(512 ) w l palette lw 2,\
     "energy_256.dat"  u 1:(g($1)*h($4)):(256 ) w l palette lw 2,\
     "energy_128.dat"  u 1:(g($1)*h($4)):(128 ) w l palette lw 2,\
     "energy_64.dat"   u 1:(g($1)*h($4)):(64  ) w l palette lw 2,\
      "energy_32.dat"  u 1:(g($1)*h($4)):(32) w l palette lw 2,\
      "energy_16.dat"  u 1:(g($1)*h($4)):(16) w l palette lw 2,\
      "energy_8.dat"   u 1:(g($1)*h($4)):(8 ) w l palette lw 2,\
      "energy_4.dat"   u 1:(g($1)*h($4)):(4 ) w l palette lw 2,\
      "energy_2.dat"   u 1:(g($1)*h($4)):(2 ) w l palette lw 2,\
      "energy_1.dat"   u 1:(g($1)*h($4)):(1 ) w l palette lw 2

set size 0.91,0.57
set origin 0.0,-0.01
#set yrange [1e-3:3]
set logscale y
set xtics 1000

E1=1e-3;         # The min of the y range
E2=3;           # The max of the y range
eps=0.05*(E2-E1)

set xtics add (gprintf("%.0f", 6+B) 6)
set xtics add (gprintf("%.0f", 8+B) 8)
set xtics add (gprintf("%.0f", 200+B) 200)

set yrange [E1:E2]
set arrow 1 from A-eps2, E1 to A+eps2, E1 nohead lc rgb "#ffffff" front
set arrow 2 from A-eps2, E2 to A+eps2, E2 nohead lc rgb "#ffffff" front
#set arrow 5 from A-eps-eps2, E2-eps to A+eps-eps2, E2+eps nohead front
#set arrow 6 from A-eps+eps2, E2-eps to A+eps+eps2, E2+eps nohead front

set ylabel "|E(t)-E(0)| [10 mJ]" 
plot "energy_2048.dat" u 1:(f($1)*1e6*abs($2+$3-E2048)):(1024) w l palette lw 2,\
     "energy_1024.dat" u 1:(f($1)*1e6*abs($2+$3-E1024)):(1024) w l palette lw 2,\
     "energy_512.dat"  u 1:(f($1)*1e6*abs($2+$3-E512 )):(512 ) w l palette lw 2,\
     "energy_256.dat"  u 1:(f($1)*1e6*abs($2+$3-E256 )):(256 ) w l palette lw 2,\
     "energy_128.dat"  u 1:(f($1)*1e6*abs($2+$3-E128 )):(128 ) w l palette lw 2,\
     "energy_64.dat"   u 1:(f($1)*1e6*abs($2+$3-E64  )):(64  ) w l palette lw 2,\
     "energy_32.dat"   u 1:(f($1)*1e6*abs($2+$3-E32  )):(32) w l palette lw 2,\
     "energy_16.dat"   u 1:(f($1)*1e6*abs($2+$3-E16  )):(16) w l palette lw 2,\
     "energy_8.dat"    u 1:(f($1)*1e6*abs($2+$3-E8   )):(8 ) w l palette lw 2,\
     "energy_4.dat"    u 1:(f($1)*1e6*abs($2+$3-E4   )):(4 ) w l palette lw 2,\
     "energy_2.dat"    u 1:(f($1)*1e6*abs($2+$3-E2   )):(2 ) w l palette lw 2,\
     "energy_1.dat"    u 1:(f($1)*1e6*abs($2+$3-E1   )):(1 ) w l palette lw 2,\
     "energy_2048.dat" u 1:(g($1)*h(1e6*abs($2+$3-E2048))):(1024) w l palette lw 2,\
     "energy_1024.dat" u 1:(g($1)*h(1e6*abs($2+$3-E1024))):(1024) w l palette lw 2,\
     "energy_512.dat"  u 1:(g($1)*h(1e6*abs($2+$3-E512 ))):(512 ) w l palette lw 2,\
     "energy_256.dat"  u 1:(g($1)*h(1e6*abs($2+$3-E256 ))):(256 ) w l palette lw 2,\
     "energy_128.dat"  u 1:(g($1)*h(1e6*abs($2+$3-E128 ))):(128 ) w l palette lw 2,\
     "energy_64.dat"   u 1:(g($1)*h(1e6*abs($2+$3-E64  ))):(64  ) w l palette lw 2,\
     "energy_32.dat"   u 1:(g($1)*h(1e6*abs($2+$3-E32  ))):(32) w l palette lw 2,\
     "energy_16.dat"   u 1:(g($1)*h(1e6*abs($2+$3-E16  ))):(16) w l palette lw 2,\
     "energy_8.dat"    u 1:(g($1)*h(1e6*abs($2+$3-E8   ))):(8 ) w l palette lw 2,\
     "energy_4.dat"    u 1:(g($1)*h(1e6*abs($2+$3-E4   ))):(4 ) w l palette lw 2,\
     "energy_2.dat"    u 1:(g($1)*h(1e6*abs($2+$3-E2   ))):(2 ) w l palette lw 2,\
     "energy_1.dat"    u 1:(g($1)*h(1e6*abs($2+$3-E1   ))):(1 ) w l palette lw 2

