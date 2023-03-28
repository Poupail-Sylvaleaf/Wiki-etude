#!/bin/bash
#set -e
set -u

#Code

#Message aide de syntaxe
if [[ $# -ne 1 ]] ; then
  echo "usage : $0 <fichier>"
  exit  1
fi

#Affichage erreur ouverture
fichier=$1
if [[ ! -r "$fichier" ]] ; then
  echo "$0 : erreur ouverture $fichier"
  exit  2
fi


while read ligne
do
	Login=$(echo "$ligne" |cut -d: -f1)
	Nomcpl=$(echo "$ligne" |cut -d: -f2)
	echo "${Login}: ${Nomcpl}"
	getent passwd "${Login}" >> /dev/null
        if [[ $? -eq 0 ]] ; then
		sudo rm "${Login}"
	else
		echo "$0 : Utilisateur ${Login} est déjà existant "
	fi

done < "$fichier"

