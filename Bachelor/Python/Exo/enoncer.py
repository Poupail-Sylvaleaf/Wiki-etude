# ajout fonction
def ecrire_dans_fichier(files,content):
    try:
        # ouverture du fichier en mode ajout
        with open(files, 'a') as fichier:
            # écriture du contenu dans fichier
            fichier.write(content)
            # calcul longeur du contenu 
            print(f'nombre de caractère ajouté {len(content)}')

    except FileNotFoundError:
        print(f"Le fichier '{files}' est introuvable.")
        
    except TypeError:
        print("le type de caractère fournie n'est pas correct")

ecrire_dans_fichier('test.txt','hello')