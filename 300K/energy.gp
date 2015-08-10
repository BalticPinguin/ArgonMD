#set term postscript enhanced color
#set output "energy.ps"
set term pdfcairo
set output "energy.pdf"

#set palette defined(1 "#FFFFFF", 2 "#0000FF", 4 "#00FFFF", 8 "#FFFF00", 16 "#ADD8E6", 32 "#FF0000")
set colorbox vertical user origin .88, 0.077 size 0.04, 0.915
set logscale cb
set cbrange [0.1:102.4]

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

set size   0.8803,0.57
set origin 0.0297, 0.47
set yrange [50:230]
set ylabel "T [K]"
unset xtics
plot "energy_1024.dat" u 1:( $4  ):(102.4) w l palette lw 2,\
     "energy_512.dat"  u 1:( $4  ):(51.2 ) w l palette lw 2,\
     "energy_64.dat"   u 1:( $4  ):(6.4  ) w l palette lw 2,\
         "energy_8.dat"  u 1:( $4  ):(0.8 ) w l palette lw 2,\
         "energy_1.dat"  u 1:( $4  ):(0.1 ) w l palette lw 2

#plot "energy_1024.dat" u 1:( $4  ):(1024) w l palette lw 2,\
#     "energy_512.dat"  u 1:( $4  ):(512 ) w l palette lw 2,\
#  #   "energy_256.dat"  u 1:( $4  ):(256 ) w l palette lw 2,\
#  #   "energy_128.dat"  u 1:( $4  ):(128 ) w l palette lw 2,\
#     "energy_64.dat"   u 1:( $4  ):(64  ) w l palette lw 2,\
#  #       "energy_32.dat" u 1:( $4  ):(32) w l palette lw 2,\
#  #       "energy_16.dat" u 1:( $4  ):(16) w l palette lw 2,\
#         "energy_8.dat"  u 1:( $4  ):(8 ) w l palette lw 2,\
#       #  "energy_4.dat"  u 1:( $4  ):(4 ) w l palette lw 2,\
#         "energy_2.dat"  u 1:( $4  ):(2 ) w l palette lw 2,\
#         "energy_1.dat"  u 1:( $4  ):(1 ) w l palette lw 2

set size 0.91,0.57
set origin 0.0,-0.01
set yrange [1e-3:250]
set logscale y
set xtics 1000
set ylabel "|E(t)-E(0)| [mJ]" # check unit!!
plot "energy_1024.dat" u 1:(1e7*abs($2+$3-E1024)):(102.4) w l palette lw 2,\
     "energy_512.dat"  u 1:(1e7*abs($2+$3-E512 )):(51.2 ) w l palette lw 2,\
     "energy_64.dat"   u 1:(1e7*abs($2+$3-E64  )):(6.4  ) w l palette lw 2,\
           "energy_8.dat"  u 1:(1e7*abs($2+$3-E8 )):(0.8 ) w l palette lw 2,\
           "energy_1.dat"  u 1:(1e7*abs($2+$3-E1 )):(0.1 ) w l palette lw 2
#plot "energy_1024.dat" u 1:(1e7*abs($2+$3-E1024)):(1024) w l palette lw 2,\
#     "energy_512.dat"  u 1:(1e7*abs($2+$3-E512 )):(512 ) w l palette lw 2,\
#     "energy_256.dat"  u 1:(1e7*abs($2+$3-E256 )):(256 ) w l palette lw 2,\
#     "energy_128.dat"  u 1:(1e7*abs($2+$3-E128 )):(128 ) w l palette lw 2,\
#     "energy_64.dat"   u 1:(1e7*abs($2+$3-E64  )):(64  ) w l palette lw 2,\
#           "energy_32.dat" u 1:(1e7*abs($2+$3-E32)):(32) w l palette lw 2,\
#           "energy_16.dat" u 1:(1e7*abs($2+$3-E16)):(16) w l palette lw 2,\
#           "energy_8.dat"  u 1:(1e7*abs($2+$3-E8 )):(8 ) w l palette lw 2,\
#           "energy_4.dat"  u 1:(1e7*abs($2+$3-E4 )):(4 ) w l palette lw 2,\
#           "energy_2.dat"  u 1:(1e7*abs($2+$3-E2 )):(2 ) w l palette lw 2,\
#           "energy_1.dat"  u 1:(1e7*abs($2+$3-E1 )):(1 ) w l palette lw 2
