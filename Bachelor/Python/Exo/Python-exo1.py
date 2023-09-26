# ouverture fichier
with open('Bachelor\Python\Exo\\ages.txt', encoding="utf-8") as f:
    # affichage du contenue
    print(f)
    # lecture ligne
    for line in f:
        try:
            # convertione des résultat des lignes en int
            age = int(line)
            # comparaison
            if age >= 18:
                print(f"{age} est supérieur ou égal à 18.")
            else:
                print(f"{age} est inférieur à 18.")
        # ne s'arete pas lors d'une erreur (espace)
        except:
            pass


