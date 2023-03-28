#!/usr/bin/python3

phrase= str(input("phrase :"))

#Eclatage de la chaine de caractères en tableau avec séprateur espace
tabmots= phrase.split(" ")
cptmots={}

for mot in tabmots:
	if not mot in cptmots:
		cptmots[mot]= 1 # Nouveau mot -> apparu 1 fois
	else:
		cptmots[mot]= cptmots[mot] +1 # Mot déja vu -> +1

#Affichage des occurences
for mot in cptmots.keys():
	print(mot, ":",cptmots[mot])
