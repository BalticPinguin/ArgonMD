set term pdfcairo size 30,15 font ',28'
set output "distTime.pdf"
n=800 #number of intervals
min=0 #min value
max=2.0 #max value
width=(max-min)/n #interval width
set xrange [min:max]
set yrange [0:10] #N*N or lower...
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.99

set multiplot
set size   0.333,0.5
set origin 0.000, 0.5
plot "dist_20.dat" u (hist(sqrt(($1-$6)*($1-$6)+($2-$7)*($2-$7)+($3-$8)*($3-$8)),width)):(1.0) smooth freq w boxes title "T=20"

set size   0.333,0.5
set origin 0.333, 0.5
plot "dist_120.dat" u (hist(sqrt(($1-$6)*($1-$6)+($2-$7)*($2-$7)+($3-$8)*($3-$8)),width)):(1.0) smooth freq w boxes title "T=120"

set size   0.333,0.5
set origin 0.665, 0.5
plot "dist_220.dat" u (hist(sqrt(($1-$6)*($1-$6)+($2-$7)*($2-$7)+($3-$8)*($3-$8)),width)):(1.0) smooth freq w boxes title "T=220"

min=0 #min value
max=30.5 #max value
width=(max-min)/n #interval width
set xrange [min:max]
set yrange [0:20] #N*N or lower...

set size   0.333,0.5
set origin 0.000, 0.0
plot "dist_320.dat" u (hist(sqrt(($1-$6)*($1-$6)+($2-$7)*($2-$7)+($3-$8)*($3-$8)),width)):(1.0) smooth freq w boxes title "T=320"

set size   0.333,0.5
set origin 0.333, 0.0
plot "dist_420.dat" u (hist(sqrt(($1-$6)*($1-$6)+($2-$7)*($2-$7)+($3-$8)*($3-$8)),width)):(1.0) smooth freq w boxes title "T=420"

set size   0.333,0.5
set origin 0.665, 0.0
plot "dist_520.dat" u (hist(sqrt(($1-$6)*($1-$6)+($2-$7)*($2-$7)+($3-$8)*($3-$8)),width)):(1.0) smooth freq w boxes title "T=520"
