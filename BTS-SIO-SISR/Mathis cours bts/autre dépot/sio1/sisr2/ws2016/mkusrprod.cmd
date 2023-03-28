:: exemple : mkusrprod pdubois "Paul Dubois" 2 parametres
::-créer le compte
::-appartenance groupe 
::-créer repertoire de base
::-partager repertoire de base



mkdir C:\labo22.lan\Usr\%1

net user %1 Azerty1+ /FULLNAME:%2 /HOMEDIR:\\DCAA\%1$ /SCRIPTPATH:prod.cmd /add

net group gg-prod %1 /add

net share %1$=C:\labo22.lan\Usr\%1 /grant:Utilisateurs,FULL

icacls C:\labo22.lan\Usr\%1 /grant Administrateurs:F
icacls C:\labo22.lan\Usr\%1 /grant %1:M