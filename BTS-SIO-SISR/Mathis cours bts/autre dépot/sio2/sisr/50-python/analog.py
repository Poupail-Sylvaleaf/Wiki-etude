#!/usr/bin/python3

import sys
import re
hostvolume = {}
hosthit = {}

regexp = "^(\S+) (\S+) (\S+) \[([^]]+)\] \"(\w+) (\S+).*\" (\d+) (\S+)"
for line in sys.stdin: # on lit sur l’entrée standard
	line = line.rstrip () # on enleve le retour ligne
	res = re.match (regexp, line)
	if res:
		(host, rfc931, user, date, request, url, status, byte) = res.groups()
		host = res.group (1)
		byte = int(res.group (8))
		#print ('host : ', host, ' byte : ', byte)
		if host not in hostvolume :
			hostvolume[host] = byte
			hosthit[host] = 1
		else :
			hostvolume[host] = hostvolume[host] + byte
			hosthit[host] = hosthit[host] + 1

#for addr in sorted(hostvolume.keys()):
#	print("VOLUME : ", addr, " : ", hostvolume[addr], "  HIT : ", addr, " : ", hosthit[addr])

for addr in sorted(hostvolume.keys()):
	print(addr, "-> VOLUME :", hostvolume[addr] , " : HIT :",hosthit[addr])


