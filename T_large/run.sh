#!/bin/bash
for T in {220..230..100}
do
   ./main.py $T > foo
   mv foo energy_$T\.dat
   mv pairDist.dat pair_$T\.dat
   mv box.dat box_$T\.dat
done

#for T in {300..400..20}
#do
#   ./main.py $T > foo
#   mv foo energy_$T\.dat
#   mv pairDist.dat pair_$T\.dat
#   mv box.dat box_$T\.dat
#done
