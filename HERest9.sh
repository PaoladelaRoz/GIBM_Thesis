#!/bin/bash

for i in 3 4 5 6
do
 

  macros_dir="./HMMs_gaussians/${i}st"
  hmmdefs_dir="./HMMs_gaussians/${i}st"
  output_dir="./HMMs_gaussians/${i}st"
  classes_file="./classes.txt"
  

 for g in 1 2 3 4 5 6 7 8 
 do
  echo "modelo ${i}st"
  echo "grupo G$g"
 
  groundtruth_file="./groundtruth${g}.txt"
  group_file="./group${g}.txt"
  macros_subdir="$macros_dir/G$g"
  hmmdefs_subdir="$hmmdefs_dir/G$g"
  output_subdir="$output_dir/G$g"

  input1="${macros_subdir}/9GMM_1/${i}stG${g}hmmdefs.txt"
  input2="${hmmdefs_subdir}/9GMM_1/macros${i}st_${g}"
  output_subdir="${output_dir}/G${g}/9GMM_2"


  mkdir -p "$output_subdir"

  HERest -T 1 -I "$groundtruth_file" -S "$group_file" -H "$input1" -H "$input2" -M "$output_subdir" "$classes_file" >> "${output_subdir}/avglogperframe${it}.txt"
 

  input1="${macros_subdir}/9GMM_2/${i}stG${g}hmmdefs.txt"
  input2="${hmmdefs_subdir}/9GMM_2/macros${i}st_${g}"
  output_subdir="${output_dir}/G${g}/9GMM_3"


  mkdir -p "$output_subdir"

  HERest -T 1 -I "$groundtruth_file" -S "$group_file" -H "$input1" -H "$input2" -M "$output_subdir" "$classes_file" >> "${output_subdir}/avglogperframe${it}.txt"
  

 
 
 done
done
