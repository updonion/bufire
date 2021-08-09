#!/bin/bash

read -p "Folder with text files: " folder
cd "$folder"
sum=""

for file in *.txt
do
# echo "$file"
# echo ${#file}
sum=$(sha256sum "$file")
# echo ${sum:0:10}
newfile="[${sum:0:10}]-$file"
if [[ "$file" == *"[${sum:0:10}]-"* ]]; then
  echo -e "\e[1;31mFile $file exists\e[0m"
else
  echo -e "\e[1;34mCreated $newfile\e[0m"
  cp "$file" "$newfile"
  rm "$file"
fi

done
