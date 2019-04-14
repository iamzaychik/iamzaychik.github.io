#!/bin/bash

find posts/ -name "index.md" -type f -exec rm {} \;

find posts/ -type f | sed 's/posts\///g' > files

input="files"
while IFS= read -r var
do
   DIR=`echo $var | cut -d "/" -f1`
   FILE_WITH_EXT=`echo $var | cut -d "/" -f2`
   FILENAME=`echo $FILE_WITH_EXT | cut -d "." -f1 | sed 's/\_/ /g'`
   echo "* [$FILENAME]($FILE_WITH_EXT)" >> posts/$DIR/index.md
done < "$input"

rm files