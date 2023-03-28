tbl=[]
nbl=5
i=0
moy=0
for i in range (5):

	nb=input('Nombre :')
	tbl.append(float(nb))

petit=tbl[0]
grand=tbl[0]
for nb in tbl:
	if petit >nb:
                petit=nb
	if grand < nb:
		grand=nb
	moy = moy + nb
for nb in range (nbl):
	print (tbl[nb])

moyenne=moy/nbl

print ('plus petite valeur: ',petit,' plus grande valeur: ',grand,'moyenne:',moyenne) 
