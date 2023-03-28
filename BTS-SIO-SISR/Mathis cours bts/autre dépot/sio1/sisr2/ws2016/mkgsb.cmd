:: création des groupes globaux
for %%g in (gg-compta gg-comm gg-prod gg-admin) do net group %%g /add

:: création des groupes locaux
for %%g in (gl-pub-r gl-pub-rw gl-commun-r gl-commun-rw gl-compta gl-comm gl-prod) do net localgroup %%g /add

:: création arborescence
mkdir C:\labo22.lan
cd C:\labo22.lan

mkdir Pub Commun SVC Usr

cd SVC
mkdir compta comm prod


:: ajout groupes locaux aux groupes globaux

net localgroup gl-commun-rw gg-admin /add
net localgroup gl-pub-rw gg-admin /add

net localgroup gl-commun-rw gg-compta /add
net localgroup gl-pub-r gg-compta /add

net localgroup gl-commun-rw gg-comm /add
net localgroup gl-pub-r gg-comm /add

net localgroup gl-commun-rw gg-prod /add
net localgroup gl-pub-r gg-prod /add

net share Commun=C:\labo22.lan\Commun /grant Administrateurs:F


:: Ajout droits aux utilisateurs au dossier C:\labo22.lan

icacls C:\labo22.lan\ /grant Administrateurs:F /t

icacls C:\labo22.lan\Pub /grant gl-pub-r:R /t

icacls C:\labo22.lan\Commun /grant Utilisateurs:M /t

icacls C:\labo22.lan\SVC\compta /grant gl-compta:M /t

icacls C:\labo22.lan\SVC\comm /grant gl-comm:M /t

icacls C:\labo22.lan\SVC\prod /grant gl-prod:M /t