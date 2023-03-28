#!/bin/bash

set -e

#Variables fixes



#Code

if [ "$#" -eq 1 ] ; then

  fichier=~/$1

  while read -r line
  do
    echo "$line"
    done < "$fichier"
    exit 0

else

  echo "Syntaxe : ./crsamba2.sh argument1(texte)"
  exit 1

fi

