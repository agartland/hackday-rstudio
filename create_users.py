import os
import subprocess
import sys

def add_user(username):
    password = username
    try:
        # executing useradd command using subprocess module
        subprocess.run(['useradd', '-m', username ])   
        subprocess.run(f'echo {username}:{username} | chpasswd', shell=True) 
    except:
        print(f"Failed to add user: {username}")                    

if __name__ == '__main__':
    try:
        roster_fn = sys.argv[1]
    except IndexError:
        print('Specify a roster CSV')

    with open(roster_fn, 'r') as fh:
        s = fh.read()
    roster = s.split('\n')[1:]
    for r in roster:
        try:
            username = r.split(',')[1]
            print(username)
            add_user(username)
        except IndexError:
            pass

    for i in range(10):
        username = f'extra_user{i}'
        print(username)
        add_user(username)

