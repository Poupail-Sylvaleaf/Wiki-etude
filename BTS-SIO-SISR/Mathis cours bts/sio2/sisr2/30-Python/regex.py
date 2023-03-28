#!/usr/bin/python3
import sys
import re
volip={}
hostip={}

regexp = "^(\S+) (\S+) (\S+) \[([^]]+)\] \"(\w+) (\S+).*\" (\d+) (\S+)"
for line in sys.stdin: # on lit sur l’entrée standard
	line = line.rstrip () # on enleve le retour ligne
	res = re.match (regexp, line)
	if res:
		(host, rfc931, user, date, request, url, status, byte) = res.groups()
		host = res.group (1)
		byte = int(res.group (8))
		print ('host : ', host, ' byte : ', byte)
		#calcul nb ip apparitions
		if host not in hostip:
        		hostip[host] = 1
			volip[host] = byte
       		else:
       			hostip[host] = hostip[host]+1
			volip[host] = volip[host]+byte

for addr in sorted(hostip.keys()):
	print(addr, " : ", hostip[addr])
