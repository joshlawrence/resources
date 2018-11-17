#!/usr/bin/env python3

import csv

with open('log.csv') as data_file:
    contents = csv.reader(data_file, delimiter=',', quotechar='"')
    for row in contents:
        print(row[0])
