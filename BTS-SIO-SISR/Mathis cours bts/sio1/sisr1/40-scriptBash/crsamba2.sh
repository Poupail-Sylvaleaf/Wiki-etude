#!/bin/bash
set -e
set -u

#Code

if [[ $# -ne 1 ]] ; then
  echo "usage : $0 <fichier>"
  exit  1
fi



fichier=$1

while read ligne
do
	echo $ligne
done < $fichier
