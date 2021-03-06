set term gif animate delay 1
set output "velocity.gif"
n=100 #number of intervals
max=1e-2 #max value
min=0 #min value
width=(max-min)/n #interval width
set xrange [0:1e-2]
set yrange [0:100]
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9

stats 'box.dat' nooutput
do for [i=1:int(STATS_blocks)] {
   set label 1 "T=%d" at 0,10
   plot "box.dat" index (i-1) u (hist($6,width)):(1.0) smooth freq w boxes  title sprintf("t=%i",i)
}
