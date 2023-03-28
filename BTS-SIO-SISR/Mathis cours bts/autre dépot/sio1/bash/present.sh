#/bin/bash
#set -e
set -u

if [[ $# -ne 1 ]] ; then

	exit 1
fi

who | grep $1 > /dev/null
if [[ $? -eq 0 ]] ; then

	echo "l'utilisateur $1 est connecté"

else
	echo "l'utilisateur $1 n'est pas connecté"
fi
exit 0
