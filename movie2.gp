set term gif animate delay 2
set output "movie2.gif"
set title "evolution"
set xlabel "x"
set ylabel "y"
set xrange[0:10]
set yrange[0:10]
set zrange[0:10]
#set hidden3d
#set isosamples 80
stats 'box.dat' nooutput

do for [i=1:int(STATS_blocks)] {
   splot "box.dat" index (i-1) u 3:4:5:5 w p palette ps 3 title sprintf("t=%i",i)
}

set output "movie3.gif"
set title "evolution"
do for [i=1:int(STATS_blocks)] {
   splot "box.dat" index (i-1) u 3:4:5:6 w p palette ps 3 title sprintf("t=%i",i)
}
