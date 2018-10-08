#!/usr/bin/env python3

# print only lines with jasmin.gonzalez.rpsg is in the AGENT column

import csv

#data_file =  (open('data.csv', 'w'))
#csv_writer = csv.writer(data_file, delimiter = ',')
line_count = 0

with open('log.csv', 'r') as csv_file:
    csv_reader = csv.DictReader(csv_file)
    for row in csv_reader:
        if row['AGENT'] == 'jasmin.gonzalez.rpsg':
            print(row)
            line_count += 1

    print(f'Processed {line_count} line(s).')
