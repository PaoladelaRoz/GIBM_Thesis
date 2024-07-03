#!/bin/bash

group_file="./grouptrainfinal.txt"
groundtruth="./groundtruth_HERest/groundtruthtest.txt"
directory="./OptimalModel"
hmmdefs="./OptimalModel/hmmdefs"
macros="./OptimalModel/macros"
classes_file="./classes.txt"

mkdir -p "$directory"

#1. HCompv:executed on console
#HCompV -f 0.01 -m -S "${group_file}" -M "${directory}" "${prototype}"
#hmmdefs and macros computed with the output s7prototype and VFloors of HCompV command

#2. HERest 3 iterations
output1="./OptimalModel/gaussian"
mkdir -p "$output1"

for i in 1 2 3
do
 mkdir -p "$output1/GMM_${i}"
 echo "$output1/GMM_${i}"
 HERest -T 1 -I "${groundtruth}" -S "${group_file}" -H "${macros}" -H "${hmmdefs}" -M "${output1}/GMM_${i}" "${classes_file}" >> "${output1}/GMM_${i}/output.txt"
 macros="${output1}/GMM_${i}/macros"
 hmmdefs="${output1}/GMM_${i}/hmmdefs"
done
#3. Add gaussians with HHEd and HERest
hmmdefs2="${output1}/GMM_3/hmmdefs"
macros2="${output1}/GMM_3/macros"
addgaussians_file="./addGaussians7st.txt"
for g in 1 2 3 4 5 6 7 8 9 10
do
 outputdir="${directory}/${g}gaussian"
 mkdir -p "${outputdir}"
 echo "${outputdir}"
 HHEd -T 1 -H "${hmmdefs2}" -H "${macros2}" -M "${outputdir}" "${addgaussians_file}" "${classes_file}"
 macrosnew="${directory}/${g}gaussian/macros"
 hmmdefsnew="${directory}/${g}gaussian/hmmdefs"
 
 for l in 1 2 3
 do
  mkdir -p "${outputdir}/${g}GMM_${l}"
  echo "${outputdir}/${g}GMM_${l}"
  HERest -T 1 -I "${groundtruth}" -S "${group_file}" -H "${macrosnew}" -H "${hmmdefsnew}" -M "${outputdir}/${g}GMM_${l}" "${classes_file}" >> "${outputdir}/${g}GMM_${l}/output.txt"
  macrosnew="${directory}/${g}gaussian/${g}GMM_${l}/macros"
  hmmdefsnew="${directory}/${g}gaussian/${g}GMM_${l}/hmmdefs"
 done
 hmmdefs2="${outputdir}/${g}GMM_3/hmmdefs"
 macros2="${outputdir}/${g}GMM_3/macros"


done

