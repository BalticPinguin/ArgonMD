set term pdfcairo
set output "distTime.pdf"
n=800 #number of intervals
min=0.0 #min value
max=3.9 #max value
width=(max-min)/n #interval width
set xrange [min:max]
set xtics 1
set key samplen -0.1 left
set yrange [0:9.5] #N*N or lower...
set ytics 2

#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.99
mod(x,y)= (x-y)*(x-y)<(x-y-21)*(x-y-21) && (x-y)*(x-y)<(x-y+21)*(x-y+21) ? (x-y)*(x-y) :(x-y-21)*(x-y-21)<(x-y+21)*(x-y+21) ? (x-y-21)*(x-y-21) : (x-y+21)*(x-y+21)

set multiplot
set size   0.410,0.55
set origin -0.005, 0.46
set ylabel "# particles"
set xtics ('' 0, '' 1,'' 2, '' 3, '' 4)
plot "dist_20.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):(1.0) smooth freq w boxes title "T=20"

set size   0.387,0.55
set origin 0.326, 0.46
set ylabel ""
set ytics ('' 0, '' 2,'' 4, '' 6, '' 8,'' 10)
plot "dist_120.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):(1.0) smooth freq w boxes title "T=120"

set size   0.394,0.55
set origin 0.636, 0.46
plot "dist_220.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):(1.0) smooth freq w boxes title "T=220"

set size   0.410,0.53
set origin -0.005, 0.06
set ylabel "# particles"
set ytics 2
set xtics 1
plot "dist_320.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):(1.0) smooth freq w boxes title "T=320"

set size   0.387,0.585
set origin 0.326, 0.008
set ytics ('' 0, '' 2,'' 4, '' 6, '' 8, '' 10)
set xlabel "|Δr|"
set ylabel ""
plot "dist_340.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):(1.0) smooth freq w boxes title "T=360"

set size   0.396,0.53
set origin 0.636, 0.06
set xlabel ""
#plot "dist_520.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):(1.0) smooth freq w boxes title "T=520"
plot "dist_420.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):(1.0) smooth freq w boxes title "T=420"
