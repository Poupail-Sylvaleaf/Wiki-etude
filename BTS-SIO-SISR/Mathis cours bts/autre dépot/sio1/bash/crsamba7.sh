#!/bin/bash

#set -e


if [[  $# -ne 1 ]] ; then
  echo "Usage : $0 <fichier>"
  exit 1
fi

if [[ ! -r "$1"  ]] ; then
  echo " Fichier non lisible : ${fichier} "
  exit 1
fi

fichier=$1
while read -r line
do
  login=$(echo "${line}"|cut -d: -f1)
  long=$(echo "${line}"|cut -d: -f2)
  echo " Utilisateur : ${login} ${long} "
  echo " Repertoire home : /home/$long/ "
  getent passwd "${login}" >> /dev/null
  if [[ $? -ne 0 ]] ; then 
    useradd --create-home --home-dir /home/"${login}" --shell /bin/bash --comment "${long}" "${login}"
    passwd=$(pwgen 6 1)
    echo "${login}:${passwd}" | chpasswd
    echo "${login}:${passwd}" >> "${fichier}.pwd"
  else
    echo " Utilisateur ${login} existant "
  fi

done < "$fichier"
