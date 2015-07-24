set term gif animate delay 1
set output "pairdist.gif"
n=100 #number of intervals
max=10 #max value
min=0 #min value
width=(max-min)/n #interval width
set xrange [0:10]
#set yrange [0:30] #N*N or lower...
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9

stats 'box.dat' nooutput
do for [i=1:int(STATS_blocks)] {
   plot "pairDist.dat" index (i-1) u (hist($2,width)):(1.0) smooth freq w boxes  title sprintf("t=%i",i)
}
