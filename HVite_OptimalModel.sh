#!/bin/bash

group_file="./grouptestfinal.txt"
classes_file="./classes.txt"
wdnet_file="./wdnet.txt"
dict_file="./dict.txt"
p=12

dir="./OptimalModel/10gaussian"
macros="${dir}/10GMM_3/macros"
hmmdefs="${dir}/10GMM_3/hmmdefs"
  
 HVite -H "$macros" -H "$hmmdefs" -S "$group_file" -l '*' -i "${dir}/recout${p}.txt" -s 0 -p ${p} -w "$wdnet_file" "$dict_file" "$classes_file"
 


