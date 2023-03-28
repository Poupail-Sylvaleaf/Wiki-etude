#!/bin/bash

set -e
set -u


# si pas 4 arguments -> quitte
if [  "$#" != 4 ] ; then
  exit 1

fi

chemin_partage=$1
login_password=$2
action=$3
cle=$4
tmpdir=$(mktemp -d)
# separation login/password

login=$(echo "$login_password" | cut -d'/' -f1)
password=$(echo "$login_password"| cut -d'/' -f2)

# tentative de montage smb
sudo mount.cifs "$chemin_partage" "$tmpdir" -o username="$login",password="$password"

# si montage foire
if [ "$?" != 0 ] ; then
  rmdir $tmpdir
  exit 2
fi

ccrypt -r "$action" -k "$cle" ${tmpdir}/
sudo umount "$tmpdir"
echo #?
rmdir "$tmpdir"
