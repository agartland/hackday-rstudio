import os
import subprocess
import sys

def add_user(username):
    password = username
    try:
        # executing useradd command using subprocess module
        subprocess.run(['useradd', '-m', '-p', password, username ])   
    except:
        print(f"Failed to add user: {username}")                    

if __name__ == '__main__':
    try:
        roster_fn = sys.argv[1]
    except IndexError:
        print('Specify a roster CSV')

    roster = pd.read_csv(roster_fn)

    for r in roster.iterrows():
        username = r['first'].lower() + r['last'].lower()
        username = username.replace('-', '').replace(' ', '')
        add_user(username)
