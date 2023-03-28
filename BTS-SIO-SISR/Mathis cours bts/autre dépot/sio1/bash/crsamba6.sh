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
    if [ ! "$line" = "root" ] ; then # si la ligne a traite n est pas l utilisateur root -> continue
      getent passwd "$line" >> /dev/null # check si l utilisateur existe
      if [ $? -eq 0 ] ; then # si il existe on le supprime lui et son repertoire home et informe
        deluser "$line" >> /dev/null # redirection de la sortie texte dans le neant
        rm -rf "/home/$line"
        echo " Utilisateur supprime : $line "
        echo " Repertoire home supprime : /home/$line/ "
      fi
      if [ $? -ne 0 ] ; then # si l utilisateur n existe pas pas besoin de le supprime
        echo " Utilisateur $line deja supprime "
      fi
    fi
    done < "$fichier"
    if [ "$line" = "root" ] ; then #aucune action si utilisateur root
      echo " Utilisateur invalide : $line "
    fi
fi

if [ ! -r "$fichier" ] ; then # fichier d entree non existant  -> exit
  echo "Fichier non existant ."
  exit 1
fi
exit 0 # sortie sans erreur
