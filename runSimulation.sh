#!/bin/bash
rm box.dat
rm pairDist.dat
./main.py 70 >foo
gnuplot movie.gp
gnuplot velocity.gp
gnuplot pairdist.gp
gnuplot movie2.gp
