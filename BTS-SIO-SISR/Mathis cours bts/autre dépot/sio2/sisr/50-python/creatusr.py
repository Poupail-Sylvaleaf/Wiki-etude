#!/usr/bin/python3
# ne marche pas

import sys
import os
import pwd
import subprocess

#print ("Nom du programme : ", sys.argv[0])
#print ("Nombre d'arguments: ", len(sys.argv))
#print ("Les arguments sont : " , str(sys.argv))

if len(sys.argv) != 2:
	msg= ("Usage : " + sys.argv[0] + " <fichier.txt>")
	print(msg ,file=sys.stderr)
	sys.exit(1)

filename = sys.argv[1]
try:
	file= open(filename , "r")
except:
	msg = ("Erreur ouverture fichier " + filename)
	print(msg ,file=sys.stderr)

else:
	line = file.readline()
	linee = line.rstrip()
	while linee:
		(login, complet) = linee.split(":")

		cmd="getent passwd " + login
		res= subprocess.run(cmd.split(),stdout=subprocess.PIPE)
		res2= (res.stdout.decode("utf8"))
		if not res2 :
			commande = "useradd --create-home --home-dir /home/"+ login + " --shell /bin/bash --comment \"" + complet + "\" " +  login
			res3= os.system(commande)

		else :
			print("Utilisateur " + login + " existant" )


		line = file.readline()
		linee = line.rstrip()
	file.close()

