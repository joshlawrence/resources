#!/usr/bin/env python3

import os.path
import time
import datetime
import subprocess
import glob
import shutil
import zipfile

# variables
srcdir = '/usr/local/share/plm_stc/extract'
wrkdir = '/usr/local/share/plm_stc/extract/data/csv'
f_date = datetime.date.today().strftime("%Y-%m-%d")
f = glob.glob(os.path.join(srcdir, 'PlmExport.' + f_date + '_[0-9][0-9][0-9][0-9][0-9][0-9].zip'))

# for testing
f_dir = Path('/usr/local/share/plm_stc/extract/data/csv')

# check if our file exists and wait if it does not
f = f[0]
while True:
    if os.path.isfile(f):
        print("File found, moving on...")
        break
    else:
        print("File NOT found, waiting...")
        time.sleep(60)

# create wrkdir, copy file to wrkdir and unzip
print("Creating working directory...")
if not os.path.exists(wrkdir):
    try:
        os.makedirs(wrkdir)
    except:
        print("Could not make working directory!")

print("Copying file to working directory...")
try:
    shutil.copy(f, wrkdir)
except:
    print("Could not copy file to working directory!")

print("Unzipping file...")
zf = glob.glob(os.path.join(wrkdir, 'PlmExport.' + f_date + '_[0-9][0-9][0-9][0-9][0-9][0-9].zip'))
zf = zipfile.ZipFile(zf[0], 'r')
try:
    zf.extractall(wrkdir)
    zf.close()
except:
    print("Could not unzip the PlmExtract file.")

# read each csv filename into a list
#
# https://docs.python.org/3/library/pathlib.html

# remove the wrkdir and all files
# print("Removing working directory and all files...")

# try:
#     shutil.rmtree(wrkdir)
# except:
#     print("Could not remove working directory!")
