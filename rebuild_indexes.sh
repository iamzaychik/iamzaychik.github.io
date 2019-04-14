#!/bin/bash

find _posts/ -name "index.md" -type f -exec rm {} \;

find _posts/ -type f | sed 's/\_posts\///g' | sort > files

input="files"
while IFS= read -r var
do
   DIR=`echo $var | cut -d "/" -f1`
   FILE_WITH_EXT=`echo $var | cut -d "/" -f2`
   FILENAME=`echo $FILE_WITH_EXT | cut -d "." -f1 | sed 's/\_/ /g'`
   echo "* [$FILENAME]($FILE_WITH_EXT)" >> _posts/$DIR/index.md
done < "$input"

rm files