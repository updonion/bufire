#!/bin/bash

read -p "Folder with text files: " folder
cd "$folder"

for file in *.txt
do

sum=$(md5sum "$file")
newfile="[${sum:0:32}]-$file"

if [[ "$file" == *"[${sum:0:32}]-"* ]]; then
  echo -e "\e[1;31mFile $file exists\e[0m"
else
  echo -e "\e[1;34mCreated $newfile\e[0m"
  cp "$file" "$newfile"
  rm "$file"
fi

done
