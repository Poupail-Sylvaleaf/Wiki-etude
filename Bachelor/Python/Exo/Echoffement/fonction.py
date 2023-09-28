def produce_default_dict():
    default_dict = {'root': 'password'}
    return default_dict

def salutation(nom, age):
    resultat = "Bonjour {}, vous avez actuellement {} an".format(nom, age)
    if age != '1':
        resultat += "s"
    resultat += "."
    return resultat
#print(salutation('gael', '24'))

def exponentielle_2(limit):
    for i in range(limit+1):
        resultat = 2 ** i
        if resultat <= limit:
            print(resultat, end=",")
#print(exponentielle_2(10))

def check_ip_format(ip):
    octets = ip.split('.')
    if len(octets) != 4:
        return False
    for octet in octets:
        if not octet.isdigit() or int(octet) < 0 or int(octet) > 255:
            return False
    return True
#print(check_ip_format('10.0.0.0'))
#print(check_ip_format('192.12.'))