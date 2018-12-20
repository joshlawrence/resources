# digitakt notes #

## getting started

* EMPTY RESET
* boot up, format drive, reboot
* create project
* copy samples over
* profit

## breakbeat science tutorial

NOTES REGARDING TRACK 2:

https://youtu.be/99XWrvT7y9Y?t=165

- amen 160 sample
- pattern is 4 bars long, with trigs on every 1/4 note (1, 5, 9, 13)
- steps 1, 3, 5, 7... are parameter locked to a different part of the loop
- SRC is set to loop instead of one-shot
- SRC loop length is set to 7.5
- TRIG has probability condition set for each step
- AMP decay is set to 55

LOOP SLICING:

> As most people know holding a trig and pressing an encoder will lock the current value to that step, so in this example lets slice up a beat loop and place it evenly across 16 steps.

> First load up or sample a loop, tempo is irrelevant, now place a trig on step 1, hold trig 1 then press the encoder for start (encoder E on SRC page) now exit step rec and tap pad where loop is assigned, tweak start encoder until you are on second hit of loop (or whatever hit you want next) place trig, hold trig, push enocder and now you have locked the value, repeat process until the beat is sounding how you want it to.

> So hopefully by now you will see that this can be a fast way of setting a sound how you want initially, then locking the relevant parameters to a step simply by pressing the encoders whilst holding trig, changing sound parameters again for next desired sound, locking those in, repeat as necessary.  Copy and paste trig can really speed things up. And of course you can lock multiple parameters in this way too.

### skills to practice

TRIG COLORS:

* note trigs = red
* lock trigs = yellow

ADDING TRIGS - GRID RECORDING MODE:

* note trig = press trig key
* lock trig = FUN + trig key

ADDING TRIGS - LIVE RECORDING MODE (RED+PLAY):

_Set up quantize:  FUNC+TRIG, F for global quantize, FUNC+YES to apply. pressing REC + PLAY (x2) will enable/disable quantize._

* note trig = press TRIG
* lock trig = any changes to parameters (while holding the step button?) will be recorded as p_locks.

REMOVING TRIGS:

* TRIG + data entry knob of the locked parameter clears trig (GRID and LIVE)
* NO + TRIG clears entire track

## TODO

* 10.10.4 - FILL MODE (FILL MODE is a trig condition.)
* 10.10.5 - SWING
* LFO math

## misc notes

- press + turn encoders for whole increments
- FUNC + turn to snap back to zero
