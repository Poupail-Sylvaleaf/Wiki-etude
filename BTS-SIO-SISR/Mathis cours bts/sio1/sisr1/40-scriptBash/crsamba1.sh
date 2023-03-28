#!/bin/bash
set -e
set -u

#Variable chemin

fichier=/root/users.txt

#Code

while read ligne
do
	echo $ligne
done < $fichier
