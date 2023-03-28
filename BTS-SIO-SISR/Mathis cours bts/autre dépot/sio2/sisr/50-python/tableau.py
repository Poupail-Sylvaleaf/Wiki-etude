#!/usr/bin/python3


tableau=[]

for i in range(5):
	valeur = input("indiquer un chiffre : ")
	tableau.append(float(valeur))
#print(tableau)




# Calcul Minimum, Maximum, Moyenne
total=0
max=tableau[0]
min=tableau[0]
for valeur in tableau:

	total= total+valeur

	if valeur > max:
		max = valeur

	if valeur < min:
		min = valeur

moy= total/len(tableau)

# Affichage des résultats

for valeur in tableau:
	print(valeur)

print("La valeur minimale est :", min)
print("La valeur maximale est :", max)
print("La moyenne est         :", moy)
print("Le total est de        :", total)
