#SCRIPT NETBOOT.TAR.GZ DEBIAN BULLSEYE
#installer isc-dhcp-server tftpd-hpa



YOURMIRROR=deb.debian.org
DIST=bullseye
ARCH=amd64
wget http://"$YOURMIRROR"/debian/dists/"$DIST"/main/installer-"$ARCH"/current/images/netboot/netboot.tar.gz


# après faut decompresser : tar -xf netboot.tar.gz
# mettre les fichiers dans /srv/tftp
