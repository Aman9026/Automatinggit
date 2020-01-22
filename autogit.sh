#This script should recursively traverse through the directories and commit every file

#!/bin/bash

[ $# -eq 1 ] && start=$1

if [ ! -d $start ]
then 
echo "$start not a directory"
exit 1
fi
dr=`pwd`
Dir=$(find "$start" -type d)
echo $Dir

for d in $Dir
do

cd $dr/$d

arry=(`ls -p | grep -v / `)
len=${#arry[*]}
i=0
while [ $i -lt $len ]; do

git add ${arry[$i]}
git commit -m "${arry[$i]} is Automatically committed"



let i++
done

done
