# DIGITAKT NOTES

## SETUP

* EMPTY RESET
* boot up, format drive, reboot
* create project
* copy samples over

## LOOP SLICING

You can generally get a sample broken into even sections of 16 on the dt if you set each start point by multiples of 7.5 (7.5 x 16 = 120). The dt start point value maxes at 120 which is probably why everything factors well with that number.

```
0 7.5 15 22.5 30 37.5 45 52.5 60
67.5 75 82.5 90 97.5 105 112.5 120
```

## TRIGS

there are 2 types of trigs, note and lock.

TRIG COLORS:

* note trigs = red
* lock trigs = yellow

ADDING TRIGS - GRID RECORDING MODE:

* note trig = press trig key
* lock trig = FUN + trig key

ADDING TRIGS - LIVE RECORDING MODE (RED + PLAY):

_Set up quantize:  FUNC + TRIG, F for global quantize, FUNC + YES to apply. pressing REC + PLAY (x2) will enable/disable quantize._

* note trig = press TRIG
* lock trig = any changes to parameters (while holding the step button?) will be recorded as p_locks.

REMOVING TRIGS:

* TRIG + data entry knob of the locked parameter clears trig (GRID and LIVE)
* NO + TRIG clears entire track

## TODO



## MISC

- press + turn encoders for whole increments
- FUNC + turn to snap back to zero
