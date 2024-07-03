#!/bin/bash

for i in 3 4 5 6
do
 
#first one was done manually
 macros_dir="./HMMs_gaussians/${i}st"
 hmmdefs_dir="./HMMs_gaussians/${i}st"
 output_dir="./HMMs_gaussians/${i}st"
 classes_file="./classes.txt"
 addgaussians_file="./addGaussians${i}st.txt"

 for g in 1 2 3 4 5 6 7 8 
 do
  groundtruth_file="./groundtruth${g}.txt"
  group_file="./group${g}.txt"
  macros_subdir="$macros_dir/G$g"
  hmmdefs_subdir="$hmmdefs_dir/G$g"
  output_subdir="$output_dir/G$g"
  for ga in 2 3 4 5 6 7 8 9 10
    do

    for gauss in 1 2 3 4 5 6 7 8 9 10
    do
     input1="${hmmdefs_subdir}/${gauss}GMM_1/${i}stG${g}hmmdefs.txt"
     input2="${macros_subdir}/${gauss}GMM_1/macros${i}st_${g}"
     echo "modelo ${i}st"
     echo "grupo G$g"
     echo "add $gauss"
     for it in 2 3
     do   
      output_subdir="${output_dir}/G${g}/${gauss}GMM_${it}"
      
      echo "$it"
      mkdir -p "$output_subdir"
      echo "HERest"
      HERest -T 1 -I "$groundtruth_file" -S "$group_file" -H "$input1" -H "$input2" -M "$output_subdir" "$classes_file"   
      input1="${hmmdefs_subdir}/${gauss}GMM_${it}/${i}stG${g}hmmdefs.txt"
      input2="${macros_subdir}/${gauss}GMM_${it}/macros${i}st_${g}"
 
     done
    inputg="${hmmdefs_subdir}/${gauss}GMM_3/${i}stG${g}hmmdefs.txt"
    inputg="${macros_subdir}/${gauss}GMM_3/macros${i}st_${g}"
   
    outputga="${output_dir}/G${g}/${ga}GMM_1"
    mkdir -p "$outputga"
    echo "HHEd"
    HHEd -T 1 -H "$inputg" -H "$inputg" -M "$outputga" "$addgaussians_file" "$classes_file" 
    
   done
  done
 done
done
  
