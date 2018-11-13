#!/bin/bash

count_check_iterations=0

if [[ $count_check_iterations -gt 120 ]]; then
    echo "[$(date +%F_%T)] Never found file for CMO...."
    exit 1
else
    echo "nope still good"
fi
