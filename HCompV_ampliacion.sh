#!/bin/bash



for i in 7 8 9 10 11 12
do 
 prototype="./s${i}prototype.txt"
 for g in 1 2 3 4 5 6 7 8
 do
  group_file="./group${g}.txt"
  output_filepath="./HMMs_amp/${i}st/G${g}"
 
   mkdir -p "$output_filepath"
   HCompV -f 0.01 -m -S "$group_file" -M "$output_filepath" "$prototype"
 done
done
