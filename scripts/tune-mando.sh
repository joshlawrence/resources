#!/usr/bin/env bash
#
# mandolin tuning notes
#
# g3 and d4 are too hard to hear on a computer speaker, so these have
# been raised an octave.
# actual frequencies: g3=196 / d4=293.7 / a4=440 / e5=659.3

# g4
play -n synth 15 sin 392

# d5
play -n synth 15 sin 587.33

# a4
play -n synth 15 sin 440

# e5
play -n synth 15 sin 659.3
