set term pdfcairo size 30,15 font ',18'
set output "changeTime.pdf"
#set xrange [-20:20]
#set yrange [-20:20]
#set zrange [-20:20]

set multiplot
set size   0.333,0.5
set origin 0.000, 0.5
splot "dist_20.dat" u ($1-$6):($2-$7):($3-$8) pt 7 title "T=20"

set size   0.333,0.5
set origin 0.333, 0.5
splot "dist_120.dat" u ($1-$6):($2-$7):($3-$8) pt 7 title "T=120"

set size   0.333,0.5
set origin 0.665, 0.5
splot "dist_220.dat" u ($1-$6):($2-$7):($3-$8) pt 7 title "T=220"

set size   0.333,0.5
set origin 0.000, 0.0
splot "dist_320.dat" u ($1-$6):($2-$7):($3-$8) pt 7 title "T=320"

set size   0.333,0.5
set origin 0.333, 0.0
splot "dist_420.dat" u ($1-$6):($2-$7):($3-$8) pt 7 title "T=420"

set size   0.333,0.5
set origin 0.665, 0.0
splot "dist_520.dat" u ($1-$6):($2-$7):($3-$8) pt 7 title "T=520"

unset multiplot
reset

set term pdfcairo
set output "distTime.pdf"
n=800 #number of intervals
min=0 #min value
max=30.5 #max value
width=(max-min)/n #interval width
set xrange [min:max]
set yrange [0:30] #N*N or lower...
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.99
mod(x,y)= (x-y)*(x-y)<(x-y-20)*(x-y-20) && (x-y)*(x-y)<(x-y+20)*(x-y+20) ? (x-y)*(x-y) :(x-y-20)*(x-y-20)<(x-y+20)*(x-y+20) ? (x-y-20)*(x-y-20) : (x-y+20)*(x-y+20)

set multiplot
set size   0.333,0.5
set origin 0.000, 0.5
plot "pair_20.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):1.0 smooth freq w boxes title "T=20"

set size   0.333,0.5
set origin 0.333, 0.5
#plot "pair_120.dat" u (hist(($1-$6)*($1-$6)+($2-$7)*($2-$7)+($3-$8)*($3-$8),width)):(1.0) smooth freq w boxes title "T=120"
#plot "pair_120.dat" u (hist((($1-$6)%10)*(($1-$6)%10)+(($2-$7)%10)*(($2-$7)%10)+(($3-$8)%10)*(($3-$8)%10),width)):1.0 smooth freq w boxes title "T=120"
plot "pair_120.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):1.0 smooth freq w boxes title "T=120"

set size   0.333,0.5
set origin 0.665, 0.5
#plot "pair_220.dat" u (hist(($1-$6)*($1-$6)+($2-$7)*($2-$7)+($3-$8)*($3-$8),width)):(1.0) smooth freq w boxes title "T=220"
#plot "pair_220.dat" u (hist((($1-$6)%10.0)*(($1-$6)%10.0)+(($2-$7)%10.0)*(($2-$7)%10.0)+(($3-$8)%10.0)*(($3-$8)%10.0),width)):1.0 smooth freq w boxes title "T=220"
plot "pair_220.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):1.0 smooth freq w boxes title "T=220"

set size   0.333,0.5
set origin 0.000, 0.0
#plot "pair_320.dat" u (hist(($1-$6)*($1-$6)+($2-$7)*($2-$7)+($3-$8)*($3-$8),width)):(1.0) smooth freq w boxes title "T=320"
#plot "pair_320.dat" u (hist((($1-$6)%10)*(($1-$6)%10)+(($2-$7)%10)*(($2-$7)%10)+(($3-$8)%10)*(($3-$8)%10),width)):1.0 smooth freq w boxes title "T=320"
plot "pair_320.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):1.0 smooth freq w boxes title "T=320"

set size   0.333,0.5
set origin 0.333, 0.0
#plot "pair_420.dat" u (hist(($1-$6)*($1-$6)+($2-$7)*($2-$7)+($3-$8)*($3-$8),width)):(1.0) smooth freq w boxes title "T=420"
#plot "pair_420.dat" u (hist((($1-$6)%10)*(($1-$6)%10)+(($2-$7)%10)*(($2-$7)%10)+(($3-$8)%10)*(($3-$8)%10),width)):1.0 smooth freq w boxes title "T=420"
plot "pair_420.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):1.0 smooth freq w boxes title "T=420"

set size   0.333,0.5
set origin 0.665, 0.0
#plot "pair_520.dat" u (hist(($1-$6)*($1-$6)+($2-$7)*($2-$7)+($3-$8)*($3-$8),width)):(1.0) smooth freq w boxes title "T=520"
#plot "pair_520.dat" u (hist((($1-$6)%10)*(($1-$6)%10)+(($2-$7)%10)*(($2-$7)%10)+(($3-$8)%10)*(($3-$8)%10),width)):1.0 smooth freq w boxes title "T=520"
plot "pair_520.dat" u (hist(sqrt(mod($1,$6)+mod($2,$7)+mod($3,$8)),width)):1.0 smooth freq w boxes title "T=520"
