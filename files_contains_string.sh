#!/bin/bash

DIR_PATH="/home/maindir"

echo -e "\nTotal number of files contain keyword: "$(grep -s -rl "$Actions" $DIR_PATH | wc -l)" "

echo -e "Total number of files not contain keyword: "$(grep -s -rL "$Actions" $DIR_PATH | wc -l)" "

find $DIR_PATH -nowarn -type d -maxdepth 1 -mindepth 1 -exec basename {} \; > subdirectorynames.txt

readarray -t subdirectories < subdirectorynames.txt

echo -e "\nSub Directories: "$(cat subdirectorynames.txt),""


for (( c=0; c<${#subdirectories[@]}; c++ ))
        do
                echo -e "\nSub Directory name: "${subdirectories[c]}""

                echo "Files contain keyword: "$(grep -s -r -l "$Actions" $DIR_PATH/${subdirectories[c]} | wc -l)" "
          
                echo -e "Files not contain keyword: "$(grep -s -r -L "$Actions" $DIR_PATH/${subdirectories[c]} | wc -l)"\n " 
                
        done

rm -f subdirectorynames.txt 
