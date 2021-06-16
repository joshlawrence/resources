# Understanding Master Mode

[Phil Clendeninn](https://yamahasynth.com/learn/2010s/understanding-master-mode-xf)

Master mode will allow you to place your favorite Programs in one convenient Bank.

https://yamahasynth.com/resource_images/XF_MasterMode/image-002.jpg

> “This synthesizer is loaded with such a wealth of different features, functions and operations, you may find it difficult to locate and call up the particular feature you need. This is where the Master function comes in handy. You can use it to memorize the operations you use most often in each mode, and call them up instantly anytime you need them with a single button press.
> The MOTIF XF has space for a total of 128 of your own User Master settings. Press the `[MASTER]`
> button to enter the Master Play mode.”

The Master programs can be used to organize and memorize your MOTIF XF programs into one neat bank. It can also function as a place to store your external MIDI Controller setups when using the MOTIF XF as an 8-Zone Master MIDI controller. Familiarize yourself with basic MOTIF XF modes and operations before diving in this end of the pool. Save any personal data before following this document.The principal modes of MOTIF XF are VOICE, PERFORMANCE, SONG and PATTERN. A Master mode setup can be used to recall a Voice, a Performance, a Song or a Pattern. Rather than jumping back and forth between the modes, organize things in the one Bank ‘to rule them all.’ You can then easily access setups via a Foot Switch (FS). The programmable FS assigned to cc98 will increment you through the Master setups.

A second use for Master setups is to integrate and organize your external MIDI gear, as well. This is accomplished with the ZONE Switch active. You can send a Bank Select and Program Change message on eight different MIDI channels simultaneously when you recall a MASTER setup. The Bank Select and Program Change data can be “preset” so that you can address internal MOTIF XF Voices and/or external device setups from your 8 Zones.

Although Master setups are non-volatile (they do remain in memory between power cycles), often the data they point to is changeable - this can present a problem if you are not organized and aware of this fact. For example, if you load new Voice data into a USER location or are pointing to volatile User sample data (SDRAM), this can cause the Master to not sound properly. In general, if you are going to setup and use MASTERS you will want to save your data in “ALL” data files (.X3A). This way you restore all the information that your MASTER programs might be accessing. Read on…

## MASTERING MASTER MODE

If you are using a MOTIF XF alone (that is, no external MIDI devices), Master Mode can be used to assemble your on-board MOTIF XF setups (Programs) in one convenient bank. A Master program location can point to a Voice, a Performance, a Song Mix or a Pattern Mix. You can use a Footswitch to advance through the Master setups during a live session. Study the Factory data for examples of this type of usage of the Master setups. The MASTER setups are used to recall different Performances, Voices, Patterns, or Songs. You can set up a Footswitch (FS) assigned to Control Change 098 to advance through the Master setups.

* Recall MASTER 056

https://yamahasynth.com/resource_images/XF_MasterMode/image-003.jpg

To learn from these MASTER setups:

* Press [EDIT]
* Press [COMMON EDIT]
* Press [F2] OTHER

Here you can see how they are directly associated (linked) with a “MODE”: Voice, Performance, Song or Pattern. Master number 056 is associated with `“MODE”: PATTERN; “MEMORY”:01 [Someday]`.

Master mode has a second more complex use – with ZONE control. You see the “Zone Switch” is set to ON in the screenshot above. Master mode can be used to control internal sounds, and/or complex configurations where both internal and external sounds are used together, that is, setups where some “Zones” are controlling Internal MOTIF XF Voices or a MOTIF XF Performance while other Zones might be controlling external devices. By the time you reach the level of creating your own Master setups you should have gained a thorough knowledge of the MOTIF XF and its modes. We will state their general definitions here so that you can fully understand what is possible and what is impossible from a Master setup. Then we will look at a few possible scenarios.

Rule 1: 

A Voice is the fundamental playable entity in the MOTIF XF. The internal Voices are made up of up to eight multi-sampled sounds called Elements. Each Voice has a Dual Insertion Effect, plus a Reverb and a Chorus processor available. The two Insertion Effects can be real-time controlled via MIDI controllers and have an intricate relationship to the individual Elements of the Voice. The Dual Insertion Effect is an important component – and is often the “personality” of the Voice. A Voice occupies a single MIDI channel and in Voice mode, significantly, only one Voice can be recalled at a time. There are 1024 Preset Voices in 8 banks of 128. There are 512 User Voices in 4 banks. There are 128 Normal General MIDI Voices and a GM Drum Kit; 64 Preset Drum Kits; and 32 User Drum Kits. When you associate a MASTER with VOICE mode, you will be able to play just one internal VOICE. Voice mode rules will apply. Even if you activate the ZONE SWITCH, only one Zone will be able to access an internal sound – because in VOICE mode only one Voice can be recalled at a time.

https://yamahasynth.com/resource_images/XF_MasterMode/image-004.jpg

Left: The current MASTER is shown in [EDIT] > [COMMON EDIT] > [F2] OTHER. The MODE is “VOICE”, the associated program is PRE 1:001(A01) Full Concert Grand. Because the ZONE SWITCH is ON, this program’s Zone parameters will determine how MIDI is transmitted.

[F6] GET NAME: This function, when pressed will transfer the name of the MEMORY selection “Full Concert Grand” and make that the name of this MASTER. Currently the name of this MASTER is “[ Demo Pattern 1 ], if you were to press [F6] GET NAME, the MASTER would be renamed “Full Concert Grand”.