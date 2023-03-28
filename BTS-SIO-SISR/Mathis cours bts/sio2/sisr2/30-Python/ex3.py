txt=str(input('écrivez :'))

tabmot=txt.split(" ")
cptmot= {}

for mot in tabmot:
	if not mot in cptmot:
		cptmot[mot]=1
	else:
		cptmot[mot]=cptmot[mot]+1

for mot in cptmot.keys():
	print (mot,":",cptmot[mot])
