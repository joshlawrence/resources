#!/usr/bin/env python3

import os.path
import time
import subprocess

f_path = "/Users/josh/Projects/"
f_name = "sample.txt"
f = f_path + f_name

# check if our file exists and wait if it does not
while True:
    if os.path.exists(f):
        print("File found, bailing out.")
        break
    else:
        print("File NOT found, waiting...")
        time.sleep(5)

# process sample.txt
try:
    p = subprocess.run(['ls', '-lah', f],
                       stdout=subprocess.PIPE,
                       stderr=subprocess.PIPE)
except subprocess.CalledProcessError as err:
    print('ERROR: ', err)
else:
    print('returncode: ', p.returncode)
