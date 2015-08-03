
#!/bin/bash

alpha=0
T=1
factor=2
for nothing in {1..6..1}
do
   ./main.py $T 0 >foo
   #gnuplot movie.gp
   #gnuplot velocity.gp
   #gnuplot pairdist.gp
   #mv movie.gif movie_$T\.gif
   #mv velocity.gif velocity_$T\.gif
   #mv pairdist.gif pairdist_$T\.gif
   mv foo energy_$T\.dat
   mv box.dat box_$T\.dat
   mv pairDist.dat paird_$T\.dat
   T=$(( $factor*$T ))
done
