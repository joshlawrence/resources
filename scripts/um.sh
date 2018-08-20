#!/bin/bash

umedit() { mkdir -p ~/notes; vim ~/notes/"$1.txt"; }
    um() { less ~/notes/"$1.txt"; }
