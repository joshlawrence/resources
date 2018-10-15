#!/usr/bin/env python3

import csv

with open('linodes.csv', 'r') as f:
    reader = csv.reader(f, delimiter = ',')
    for row in reader:
        print(row)
