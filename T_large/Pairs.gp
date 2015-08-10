set term pdfcairo
set output "PairTime.pdf"
n=800 #number of intervals
min=0.0 #min value
max=21.0 #max value
width=(max-min)/n #interval width
set xrange [0:max]
set yrange [0:30] #N*N or lower...
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.99
set key left samplen -0.1 width 0

set multiplot
set size   0.363,0.53
set origin -0.010, 0.48
set yrange [1:200] #N*N or lower...
set ylabel "g(r)"
set xtics ('' 4, '' 8,'' 12, '' 16)
set xrange [0:max-4]
unset xlabel
plot "pair_20.dat" index (0) u (hist($2,width)):(0.2) smooth freq w boxes title "T=20"

set size   0.408,0.55
set origin 0.290, 0.46
unset ylabel
set xrange [0:max]
set yrange [0.1:90] #N*N or lower...
plot "pair_120.dat" index (0) u (hist($2,width)):(0.2) smooth freq w boxes title "T=120"

set size   0.400,0.55
set origin 0.615, 0.46
set ytics ('' 10, '' 20,'' 30, '' 4, '' 50, '' 60, '' 70,'' 80,'' 90)
#set yrange [0:90] #N*N or lower...
plot "pair_220.dat" index (0) u (hist($2,width)):(0.2) smooth freq w boxes title "T=220"

set size   0.413,0.59
set origin 0.000, 0.0
set yrange [0:90] #N*N or lower...
set ylabel "g(r)"
set xlabel "r"
set xtics 4
set ytics 10
plot "pair_320.dat" index (0) u (hist($2,width)):(0.2) smooth freq w boxes title "T=320"

set size   0.363,0.59
set origin 0.334, 0.0
unset ylabel
#set yrange [0:90] #N*N or lower...
set yrange [0.1:90] #N*N or lower...
set xrange [0.1:max]
set ytics ('' 10, '' 20,'' 30, '' 4, '' 50, '' 60, '' 70,'' 80,'' 90)
plot "pair_420.dat" index (0) u (hist($2,width)):(0.2) smooth freq w boxes title "T=420"

set size   0.400,0.59
set origin 0.615, 0.0
#set yrange [0:90] #N*N or lower...
plot "pair_520.dat" index (0) u (hist($2,width)):(0.2) smooth freq w boxes title "T=520"
