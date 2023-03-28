#!/bin/bash

set -e

#Variables fixes



#Code

if [ "$#" -eq 1 ] ; then

  fichier=~/$1

else

  echo "Usage : $0 <fichier>"
  exit 1

fi

  if [ -e "$fichier" ] ; then

    while read -r line
    do
      echo "$line"
      done < "$fichier"

  else

    echo "Erreur : Fichier $1 non existant"
    exit 1

  fi
exit 0
