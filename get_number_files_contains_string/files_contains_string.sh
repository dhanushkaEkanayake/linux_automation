#!/bin/bash

DIR_PATH="/home/maindir" #--> Replace with absolute path of your main directory. 


echo -e "\nTotal number of files contain keyword: "$(grep -s -rl "$Actions" $DIR_PATH | wc -l)" " #--> Prints Total number of files which contain the keyword within main directory recursively.

echo -e "Total number of files not contain keyword: "$(grep -s -rL "$Actions" $DIR_PATH | wc -l)" " #--> Prints Total number of files which not contain the keyword within the main directory recursively.

find $DIR_PATH -nowarn -type d -maxdepth 1 -mindepth 1 -exec basename {} \; > subdirectorynames.txt #--> Get the list of subdirectories within the main directory. Only applicable for 1 level of sub directories. If you wish to go below levels also, change the maxdepth value. And store in a temporary file.

readarray -t subdirectories < subdirectorynames.txt #--> Store the list of subdirectories in an array.

echo -e "\nSub Directories: "$(cat subdirectorynames.txt),"" 


for (( c=0; c<${#subdirectories[@]}; c++ )) #--> Go through subdirectories one by one
        do
                echo -e "\nSub Directory name: "${subdirectories[c]}""

                echo "Files contain keyword: "$(grep -s -r -l "$Actions" $DIR_PATH/${subdirectories[c]} | wc -l)" " #--> Prints Total number of files which contain the keyword within particular sub directory only.
          
                echo -e "Files not contain keyword: "$(grep -s -r -L "$Actions" $DIR_PATH/${subdirectories[c]} | wc -l)"\n " #--> Prints Total number of files which not contain the keyword within particular sub directory only.
                
        done

rm -f subdirectorynames.txt #--> Remove the dump file.
