#!/bin/bash

set -e

#Variables

fichier=./users.txt

#Code

while read -r line
do
  echo "$line"

done < $fichier
exit 0
