#!/bin/bash

for i in 7 8 9 10 11 12
do
 

  macros_dir="./HMMs_amp_gaussians/${i}st"
  hmmdefs_dir="./HMMs_amp_gaussians/${i}st"
  output_dir="./Recognition_amp/${i}st"
  classes_file="./classes.txt"
  wdnet_file="./wdnet.txt"
  dict_file="./dict.txt"

  macros1dir="./HMMs_amp/${i}st"
  hmmdefs1dir="./HMMs_amp/${i}st"



 for g in 1 2 3 4 5 6 7 8
 do
  echo "model ${i}st"
  echo "group G$g"
  group_file="./group${g}test.txt"
  macros_subdir="$macros_dir/G$g"
  hmmdefs_subdir="$hmmdefs_dir/G$g"
  output_subdir="$output_dir/G$g"

  
  macros1="${macros1dir}/G${g}/${g}GMM_3/${i}stG${g}hmmdefs"
  hmmdefs1="${hmmdefs1dir}/G${g}/${g}GMM_3/macros${i}st_${g}"
  
  for p in 0 4 8 12
  do
   echo "gaussian"
  #For the file with one gaussian
   output1="${output_subdir}/gaussian"
   mkdir -p "$output1"
   echo "HVite -H "$macros1" -H "$hmmdefs1" -S "$group_file" -l '*' -i "${output1}/recout${p}.txt" -s 0 -p ${p} -w "$wdnet_file" "$dict_file" "$classes_file""

   HVite -H "$macros1" -H "$hmmdefs1" -S "$group_file" -l '*' -i "${output1}/recout${p}.txt" -s 0 -p ${p} -w "$wdnet_file" "$dict_file" "$classes_file"

#For the rest 
#To iterate in the gaussians
   for s in 1 2 3 4 5 6 7 8 9 10
    do 
    
     echo "gaussian+ ${s}"
     input1="${macros_subdir}/${s}GMM_3/${i}stG${g}hmmdefs"
     input2="${hmmdefs_subdir}/${s}GMM_3/macros${i}st_${g}"
     output_subsubdir="${output_subdir}/${s}gaussian"


     mkdir -p "$output_subsubdir"
     echo "HVite -H "$input1" -H "$input2" -S "$group_file" -l '*' -i "${output_subsubdir}/${s}recout${p}.txt" -s 0 -p ${p} -w "$wdnet_file" "$dict_file" "$classes_file" "

     HVite -H "$input1" -H "$input2" -S "$group_file" -l '*' -i "${output_subsubdir}/${s}recout${p}.txt" -s 0 -p ${p} -w "$wdnet_file" "$dict_file" "$classes_file" 
  

   done
  done
 done
done
