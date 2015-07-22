set term gif animate delay 2
set output "movie2.gif"
set title "unboxed evolution"
set xlabel "x"
set ylabel "y"
set xrange[0:10]
set yrange[0:10]
set zrange[0:10]
#set hidden3d
#set isosamples 80
stats 'box.dat' nooutput

do for [i=1:int(STATS_blocks)] {
   splot "box.dat" index (i-1) u 3:4:5:5 ps 3 title sprintf("t=%i",i)
}
