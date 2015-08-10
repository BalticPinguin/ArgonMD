set term pdfcairo
set output "test.pdf"

set colorbox vertical user origin .88, 0.0 size 0.04, 1.00
set logscale cb
set cbrange [1:2048] 

unset key
set multiplot

set size   .91,0.4
set origin 0.0, 0.63
set yrange [1e-3:3]
set logscale y
set xtics 1000
unset xtics

f=1.01
set ylabel "1.01"

E1=0.000144300006951*f-0.000541820143333 
E2=0.000184112786753*f-0.000541820143333 
E4=0.000270437707541*f-0.000541820143333 
E8=0.000303077681528*f-0.000541820143333 
E16=0.000257281530591*f-0.000541820143333 
E32=0.000188952716706*f-0.000541820143333 
E64=0.000307200591867*f-0.000541820143333 
E128=0.000182938500819*f-0.000541820143333 
E256=0.000253264205783*f-0.000541820143333 
E512=0.000189732212238*f-0.000541820143333 
E1024=0.000332104202566*f-0.000541820143333 
E2048=0.000226557994788*f-0.000541820143333 

plot "noCutPrinc/energy_2048.dat" u 1:(1e6*abs($2*f+$3-E2048)):(1024) w l palette lw 2,\
     "noCutPrinc/energy_1024.dat" u 1:(1e6*abs($2*f+$3-E1024)):(1024) w l palette lw 2,\
     "noCutPrinc/energy_512.dat"  u 1:(1e6*abs($2*f+$3-E512 )):(512 ) w l palette lw 2,\
     "noCutPrinc/energy_256.dat"  u 1:(1e6*abs($2*f+$3-E256 )):(256 ) w l palette lw 2,\
     "noCutPrinc/energy_128.dat"  u 1:(1e6*abs($2*f+$3-E128 )):(128 ) w l palette lw 2,\
     "noCutPrinc/energy_64.dat"   u 1:(1e6*abs($2*f+$3-E64  )):(64  ) w l palette lw 2,\
           "noCutPrinc/energy_32.dat" u 1:(1e6*abs($2*f+$3-E32)):(32) w l palette lw 2,\
           "noCutPrinc/energy_16.dat" u 1:(1e6*abs($2*f+$3-E16)):(16) w l palette lw 2,\
           "noCutPrinc/energy_8.dat"  u 1:(1e6*abs($2*f+$3-E8 )):(8 ) w l palette lw 2,\
           "noCutPrinc/energy_4.dat"  u 1:(1e6*abs($2*f+$3-E4 )):(4 ) w l palette lw 2,\
           "noCutPrinc/energy_2.dat"  u 1:(1e6*abs($2*f+$3-E2 )):(2 ) w l palette lw 2,\
           "noCutPrinc/energy_1.dat"  u 1:(1e6*abs($2*f+$3-E1 )):(1 ) w l palette lw 2

set size   .91,0.4
set origin 0.0, 0.315

f=1.00
set ylabel "1.00"
E1=0.000144300006951*f-0.000541820143333 
E2=0.000184112786753*f-0.000541820143333 
E4=0.000270437707541*f-0.000541820143333 
E8=0.000303077681528*f-0.000541820143333 
E16=0.000257281530591*f-0.000541820143333 
E32=0.000188952716706*f-0.000541820143333 
E64=0.000307200591867*f-0.000541820143333 
E128=0.000182938500819*f-0.000541820143333 
E256=0.000253264205783*f-0.000541820143333 
E512=0.000189732212238*f-0.000541820143333 
E1024=0.000332104202566*f-0.000541820143333 
E2048=0.000226557994788*f-0.000541820143333 

plot "noCutPrinc/energy_2048.dat" u 1:(1e6*abs($2*f+$3-E2048)):(1024) w l palette lw 2,\
     "noCutPrinc/energy_1024.dat" u 1:(1e6*abs($2*f+$3-E1024)):(1024) w l palette lw 2,\
     "noCutPrinc/energy_512.dat"  u 1:(1e6*abs($2*f+$3-E512 )):(512 ) w l palette lw 2,\
     "noCutPrinc/energy_256.dat"  u 1:(1e6*abs($2*f+$3-E256 )):(256 ) w l palette lw 2,\
     "noCutPrinc/energy_128.dat"  u 1:(1e6*abs($2*f+$3-E128 )):(128 ) w l palette lw 2,\
     "noCutPrinc/energy_64.dat"   u 1:(1e6*abs($2*f+$3-E64  )):(64  ) w l palette lw 2,\
           "noCutPrinc/energy_32.dat" u 1:(1e6*abs($2*f+$3-E32)):(32) w l palette lw 2,\
           "noCutPrinc/energy_16.dat" u 1:(1e6*abs($2*f+$3-E16)):(16) w l palette lw 2,\
           "noCutPrinc/energy_8.dat"  u 1:(1e6*abs($2*f+$3-E8 )):(8 ) w l palette lw 2,\
           "noCutPrinc/energy_4.dat"  u 1:(1e6*abs($2*f+$3-E4 )):(4 ) w l palette lw 2,\
           "noCutPrinc/energy_2.dat"  u 1:(1e6*abs($2*f+$3-E2 )):(2 ) w l palette lw 2,\
           "noCutPrinc/energy_1.dat"  u 1:(1e6*abs($2*f+$3-E1 )):(1 ) w l palette lw 2

set size   .91,0.4
set origin 0.0, -0.02

f=0.99
set ylabel "0.99"

E1=0.000144300006951*f-0.000541820143333 
E2=0.000184112786753*f-0.000541820143333 
E4=0.000270437707541*f-0.000541820143333 
E8=0.000303077681528*f-0.000541820143333 
E16=0.000257281530591*f-0.000541820143333 
E32=0.000188952716706*f-0.000541820143333 
E64=0.000307200591867*f-0.000541820143333 
E128=0.000182938500819*f-0.000541820143333 
E256=0.000253264205783*f-0.000541820143333 
E512=0.000189732212238*f-0.000541820143333 
E1024=0.000332104202566*f-0.000541820143333 
E2048=0.000226557994788*f-0.000541820143333 

plot "noCutPrinc/energy_2048.dat" u 1:(1e6*abs($2*f+$3-E2048)):(1024) w l palette lw 2,\
     "noCutPrinc/energy_1024.dat" u 1:(1e6*abs($2*f+$3-E1024)):(1024) w l palette lw 2,\
     "noCutPrinc/energy_512.dat"  u 1:(1e6*abs($2*f+$3-E512 )):(512 ) w l palette lw 2,\
     "noCutPrinc/energy_256.dat"  u 1:(1e6*abs($2*f+$3-E256 )):(256 ) w l palette lw 2,\
     "noCutPrinc/energy_128.dat"  u 1:(1e6*abs($2*f+$3-E128 )):(128 ) w l palette lw 2,\
     "noCutPrinc/energy_64.dat"   u 1:(1e6*abs($2*f+$3-E64  )):(64  ) w l palette lw 2,\
           "noCutPrinc/energy_32.dat" u 1:(1e6*abs($2*f+$3-E32)):(32) w l palette lw 2,\
           "noCutPrinc/energy_16.dat" u 1:(1e6*abs($2*f+$3-E16)):(16) w l palette lw 2,\
           "noCutPrinc/energy_8.dat"  u 1:(1e6*abs($2*f+$3-E8 )):(8 ) w l palette lw 2,\
           "noCutPrinc/energy_4.dat"  u 1:(1e6*abs($2*f+$3-E4 )):(4 ) w l palette lw 2,\
           "noCutPrinc/energy_2.dat"  u 1:(1e6*abs($2*f+$3-E2 )):(2 ) w l palette lw 2,\
           "noCutPrinc/energy_1.dat"  u 1:(1e6*abs($2*f+$3-E1 )):(1 ) w l palette lw 2

