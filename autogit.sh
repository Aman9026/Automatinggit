#This script should recursively traverse through the directories and commit every file

#!/bin/bash
if [ -z "$1" ]; then #This is to check that the argument is provided or not
echo "No file provided" >&2
exit 1
fi

function func()
{
file_name=$1 
if [ -d `realpath $file_name` ]; then

cd `realpath $file_name`

array=(`ls | uniq `)

len=${#array[*]}
i=0
while [ $i -lt $len ]; do

echo "${array[$i]}"

func ${array[$i]}


let i++
done

fi



if [ -f `realpath $file_name` ]; then
test= git add $file_name
git commit -m "Automating commit"
echo -e "\n#this was automatically comitted" >> $file_name
git add $file_name
git commit -m "Automated comment addition"

if [ "$test" == "1" ]; then
echo "Not executed properly" >&2
exit 1
fi


}

func $1
