fuser = open(file='user.txt', mode='r')
fpass = open(file='pass.txt', mode='r')
for user in fuser:
    for password in fpass:
        print(f'{user.strip()},{password.strip()}')
