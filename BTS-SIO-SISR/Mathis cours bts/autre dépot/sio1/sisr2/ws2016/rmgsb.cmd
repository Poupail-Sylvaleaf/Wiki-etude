:: suppression des groupes globaux
for %%g in (gg-compta gg-comm gg-prod gg-admin) do net group %%g /del

:: suppresion des groupes locaux
for %%g in (gl-pub-r gl-pub-rw gl-commun-r gl-commun-rw gl-compta gl-comm gl-prod) do net localgroup %%g /del

:: supression arborescence
rmdir /S /Q C:\labo22.lan

:: suppression groupes locaux aux groupes globaux

net localgroup gl-commun-rw gg-admin /del
net localgroup gl-pub-rw gg-admin /del

net localgroup gl-commun-rw gg-compta /del
net localgroup gl-pub-r gg-compta /del

net localgroup gl-commun-rw gg-comm /del
net localgroup gl-pub-r gg-comm /del

net localgroup gl-commun-rw gg-prod /del
net localgroup gl-pub-r gg-prod /del

net share Commun /DELETE

:: Supression droits pour les utilisateurs au dossier C:\labo22.lan

icacls C:\labo22.lan\ /reset

icacls C:\labo22.lan\Pub /reset

icacls C:\labo22.lan\Commun /reset

icacls C:\labo22.lan\SVC\compta /reset

icacls C:\labo22.lan\SVC\comm /reset

icacls C:\labo22.lan\SVC\prod /reset

net user pdubois /DEL