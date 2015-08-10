set term pdfcairo
set output "CE.pdf"

#set palette defined(1 "#FFFFFF", 2 "#0000FF", 4 "#00FFFF", 8 "#FFFF00", 16 "#ADD8E6", 32 "#FF0000")
set colorbox vertical user origin .88, 0.0 size 0.04, 1.00
set logscale cb
set cbrange [1:2048] 

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

set size   .91,0.4
set origin 0.0, 0.63
set yrange [1e-3:3]
set ylabel "T [K]"
set logscale y
set xtics 1000
unset xtics

set ylabel "|E(t)-E(0)| [GK]" # check unit!!
plot "energy_2048.dat" u 1:(1e6*abs($2+$3-E2048)):(1024) w l palette lw 2,\
     "energy_1024.dat" u 1:(1e6*abs($2+$3-E1024)):(1024) w l palette lw 2,\
     "energy_512.dat"  u 1:(1e6*abs($2+$3-E512 )):(512 ) w l palette lw 2,\
     "energy_256.dat"  u 1:(1e6*abs($2+$3-E256 )):(256 ) w l palette lw 2,\
     "energy_128.dat"  u 1:(1e6*abs($2+$3-E128 )):(128 ) w l palette lw 2,\
     "energy_64.dat"   u 1:(1e6*abs($2+$3-E64  )):(64  ) w l palette lw 2,\
           "energy_32.dat" u 1:(1e6*abs($2+$3-E32)):(32) w l palette lw 2,\
           "energy_16.dat" u 1:(1e6*abs($2+$3-E16)):(16) w l palette lw 2,\
           "energy_8.dat"  u 1:(1e6*abs($2+$3-E8 )):(8 ) w l palette lw 2,\
           "energy_4.dat"  u 1:(1e6*abs($2+$3-E4 )):(4 ) w l palette lw 2,\
           "energy_2.dat"  u 1:(1e6*abs($2+$3-E2 )):(2 ) w l palette lw 2,\
           "energy_1.dat"  u 1:(1e6*abs($2+$3-E1 )):(1 ) w l palette lw 2


set size   .91,0.4
set origin 0.0, 0.315

E1=0.000144300006951 -0.000541820143333 
E2=0.000184112786753 -0.000541820143333 
E4=0.000270437707541 -0.000541820143333 
E8=0.000303077681528 -0.000541820143333 
E16=0.000257281530591 -0.000541820143333 
E32=0.000188952716706 -0.000541820143333 
E64=0.000307200591867 -0.000541820143333 
E128=0.000182938500819 -0.000541820143333 
E256=0.000253264205783 -0.000541820143333 
E512=0.000189732212238 -0.000541820143333 
E1024=0.000332104202566 -0.000541820143333 
E2048=0.000226557994788 -0.000541820143333 

plot "noCutPrinc/energy_2048.dat" u 1:(1e6*abs($2+$3-E2048)):(1024) w l palette lw 2,\
     "noCutPrinc/energy_1024.dat" u 1:(1e6*abs($2+$3-E1024)):(1024) w l palette lw 2,\
     "noCutPrinc/energy_512.dat"  u 1:(1e6*abs($2+$3-E512 )):(512 ) w l palette lw 2,\
     "noCutPrinc/energy_256.dat"  u 1:(1e6*abs($2+$3-E256 )):(256 ) w l palette lw 2,\
     "noCutPrinc/energy_128.dat"  u 1:(1e6*abs($2+$3-E128 )):(128 ) w l palette lw 2,\
     "noCutPrinc/energy_64.dat"   u 1:(1e6*abs($2+$3-E64  )):(64  ) w l palette lw 2,\
           "noCutPrinc/energy_32.dat" u 1:(1e6*abs($2+$3-E32)):(32) w l palette lw 2,\
           "noCutPrinc/energy_16.dat" u 1:(1e6*abs($2+$3-E16)):(16) w l palette lw 2,\
           "noCutPrinc/energy_8.dat"  u 1:(1e6*abs($2+$3-E8 )):(8 ) w l palette lw 2,\
           "noCutPrinc/energy_4.dat"  u 1:(1e6*abs($2+$3-E4 )):(4 ) w l palette lw 2,\
           "noCutPrinc/energy_2.dat"  u 1:(1e6*abs($2+$3-E2 )):(2 ) w l palette lw 2,\
           "noCutPrinc/energy_1.dat"  u 1:(1e6*abs($2+$3-E1 )):(1 ) w l palette lw 2

set size   .91,0.4
set origin 0.0, -0.02

E1=0.000190112785513 -0.000541820143333 
E2=0.000185146711305 -0.000541820143333 
E4=0.000177797594307 -0.000541820143333 
E8=0.000280892056034 -0.000541820143333 
E16=0.00026736256522 -0.000541820143333 
E32=0.000199874660279 -0.000541820143333 
E64=0.000177390721654 -0.000541820143333 
E128=0.000262514196542 -0.000541820143333 
E256=0.0003324577649 -0.000541820143333 
E512=0.000131465822932 -0.000541820143333 
E1024=0.00023400032923 -0.000541820143333 
E2048=0.000237048530278 -0.000541820143333 

plot "noCutAll/energy_2048.dat" u 1:(1e6*abs($2+$3-E2048)):(1024) w l palette lw 2,\
     "noCutAll/energy_1024.dat" u 1:(1e6*abs($2+$3-E1024)):(1024) w l palette lw 2,\
     "noCutAll/energy_512.dat"  u 1:(1e6*abs($2+$3-E512 )):(512 ) w l palette lw 2,\
     "noCutAll/energy_256.dat"  u 1:(1e6*abs($2+$3-E256 )):(256 ) w l palette lw 2,\
     "noCutAll/energy_128.dat"  u 1:(1e6*abs($2+$3-E128 )):(128 ) w l palette lw 2,\
     "noCutAll/energy_64.dat"   u 1:(1e6*abs($2+$3-E64  )):(64  ) w l palette lw 2,\
           "noCutAll/energy_32.dat" u 1:(1e6*abs($2+$3-E32)):(32) w l palette lw 2,\
           "noCutAll/energy_16.dat" u 1:(1e6*abs($2+$3-E16)):(16) w l palette lw 2,\
           "noCutAll/energy_8.dat"  u 1:(1e6*abs($2+$3-E8 )):(8 ) w l palette lw 2,\
           "noCutAll/energy_4.dat"  u 1:(1e6*abs($2+$3-E4 )):(4 ) w l palette lw 2,\
           "noCutAll/energy_2.dat"  u 1:(1e6*abs($2+$3-E2 )):(2 ) w l palette lw 2,\
           "noCutAll/energy_1.dat"  u 1:(1e6*abs($2+$3-E1 )):(1 ) w l palette lw 2

