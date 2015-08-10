set term pdfcairo
set output "velocity.pdf"
n=200 #number of intervals
max=0.0145 #max value
min=0.00 #min value
width=(max-min)/n #interval width
set xrange [0:max]
set yrange [0:100]
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9
set xtics 0.005

k=2.078616e-8
f(x)=b/sqrt(2*pi*k*T)*4*pi*x*x*exp(-x*x/(2*k*T))

set multiplot
#set nokey
set size 0.56,0.6
set origin 0.0,-0.0
set yrange [0:290]
T=500
b=18007
set xlabel "v [A/ps]"
set ylabel "# atoms"
plot "vdist_100.dat" u (hist($6,width)):(1.0) smooth freq w boxes title "a=1", f(x) notitle lw 2

set size 0.56,0.51
set origin 0.0,0.505
set yrange [0:290]
T=500
b=19007
set xlabel ""
unset xtics
plot "vdist_10.dat" u (hist($6,width)):(1.0) smooth freq w boxes title "a=0.1", f(x) notitle lw 2

set size 0.5,0.6
set origin 0.5,0.0
set yrange [0:290]
#fit f(x) "vdist_1.dat" u (hist($6,width)):(1.0) via T,b
T=380
b=25007
set xlabel "v [A/ps]"
set xtics 0.005
set ylabel ""
unset ytics
plot "vdist_1.dat"u (hist($6,width)):(1.0) smooth freq w boxes title "a=0.01", f(x) notitle lw 2

set size 0.5,0.51
set origin 0.5,0.505
set yrange [0:390]
T=200
b=45007
set xlabel ""
unset xtics
set ylabel ""
unset ytics
plot "vdist_0.dat"u (hist($6,width)):(1.0) smooth freq w boxes title "a=0.00", f(x) notitle lw 2
