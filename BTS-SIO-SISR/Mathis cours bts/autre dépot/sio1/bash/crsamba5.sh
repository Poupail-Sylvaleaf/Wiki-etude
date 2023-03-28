#!/bin/bash

#set -e

if [ $# -eq 1 ] ; then # definit le premier argument en tant que $fichier
  fichier=./$1
fi

if [ $# -ne 1 ] ; then # exit si syntaxe incorect
  echo " Usage : $0 <fichier> "
  exit 1
fi


if [ -r "$fichier" ] ; then # si le fichier de liste d utilisateurs existe
  while read -r line
  do
    login=$(echo $line | cut -d: -f1)
    long=$(echo $line | cut -d: -f2)
    if [ ! "$line" = "*root*" ] ; then # si la ligne a traite n est pas l utilisateur root -> continue
      getent passwd "$line" >> /dev/null # check si l utilisateur existe
      if [ $? -ne 0 ] ; then # si il existe pas on le cree lui et son repertoire home et informe
        useradd "$line" --home /home/"$login"/ --create-home --shell /bin/bash --comment "${login}" "${long}"
        echo " Utilisateur : $login "
        echo " Repertoire home : /home/$login/ "
      fi
      if [ $? -eq 0 ] ; then # si l utilisateur existe deja on ignore
        echo " Utilisateur $login existe deja "
      fi
   fi
   if [ "$login" = "root" ] ; then #aucune action si utilisateur root
     echo " Utilisateur invalide : $login "
   fi
   done < "$fichier"
fi

if [ ! -r "$fichier" ] ; then # fichier d entree non existant  -> exit
  echo "Fichier non existant ."
  exit 1
fi
exit 0 # sortie sans erreur
