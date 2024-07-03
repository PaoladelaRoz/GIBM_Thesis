#!/bin/bash

for i in 7 8 9 10 11 12
do
 

  macros_dir="./HMMs_amp_gaussians/${i}st"
  hmmdefs_dir="./HMMs_amp_gaussians/${i}st"
  output_dir="./HMMs_amp_gaussians/${i}st"
  addgaussians_file="./addGaussians${i}st.txt"
  classes_file="./classes.txt"
 for g in 1 2 3 4 5 6 7 8 
 do
  echo "modelo ${i}st"
  echo "grupo G$g"
  macros_subdir="$macros_dir/G$g"
  hmmdefs_subdir="$hmmdefs_dir/G$g"
  output_subdir="$output_dir/G$g"

  input1="${macros_subdir}/4GMM_3/${i}stG${g}hmmdefs"
  input2="${hmmdefs_subdir}/4GMM_3/macros${i}st_${g}"
  output_subdir="${output_dir}/G${g}/5GMM_1"

  mkdir -p "$output_subdir"

  HHEd -T 1 -H "$input1" -H "$input2" -M "$output_subdir" "$addgaussians_file" "$classes_file"
 
 
 done
done
