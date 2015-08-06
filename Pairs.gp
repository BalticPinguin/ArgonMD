set term pdfcairo
set output "PairTime.pdf"
n=800 #number of intervals
min=0 #min value
max=11.5 #max value
width=(max-min)/n #interval width
set xrange [0:max]
set yrange [0:30] #N*N or lower...
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.99

set multiplot
set size   0.333,0.5
set origin 0.000, 0.5
set yrange [0:290] #N*N or lower...
plot "paird_20.dat" index (0) u (hist($2,width)):(1.0) smooth freq w boxes title "t=0"

set size   0.333,0.5
set origin 0.333, 0.5
set yrange [0:80] #N*N or lower...
plot "paird_20.dat" index (10) u (hist($2,width)):(1.0) smooth freq w boxes title "t=10"

set size   0.333,0.5
set origin 0.665, 0.5
set yrange [0:40] #N*N or lower...
plot "paird_20.dat" index (100) u (hist($2,width)):(1.0) smooth freq w boxes title "t=100"

set size   1,0.5
set origin 0.0, 0.0
plot "average.dat" u (hist($2,width)):(0.001) smooth freq w boxes notitle #, "paird_20.dat" index (200) u (hist($2,width)):(1.0) smooth freq w boxes title "t=200"

#set size   0.333,0.5
#set origin 0.000, 0.0
#set yrange [0:90] #N*N or lower...
#plot "paird_20.dat" index (200) u (hist($2,width)):(1.0) smooth freq w boxes title "t=200"

#set size   0.333,0.5
#set origin 0.333, 0.0
#set yrange [0:40] #N*N or lower...
#plot "paird_20.dat" index (500) u (hist($2,width)):(1.0) smooth freq w boxes title "t=500"

#set size   0.333,0.5
#set origin 0.665, 0.0
#set yrange [0:20] #N*N or lower...
#plot "paird_20.dat" index (1000) u (hist($2,width)):(1.0) smooth freq w boxes title "t=1000"
