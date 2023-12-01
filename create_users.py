import os
import subprocess
import sys
import pandas as pd

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

    roster = pd.read_csv(roster_fn)
    for i, r in roster.iterrows():
        add_user(r['username'])
    for i in range(10):
    	add_user(f'extra_user{i}')
