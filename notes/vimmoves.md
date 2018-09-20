# VIM shortcuts

https://vim.rtorr.com/

https://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers/103590#103590

https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/

## Important Shortcuts and Commands

:set textwidth=80
:set wrapmargin=2

gq - reformat text based on the current selection
gqG - reformat text from current position to bottom of file

__Don't forget `fmt` and `par` as non-vim options__

:center - centers a line of text

Tabs are just a arrangement of windows.  *Buffers* is what you want.  

    - A buffer is the in-memory text of a file.
    - A window is a viewport on a buffer
    - A tab page is a collection of windows (just stay away from these
      altogether)

Moving between buffers:

:bn - next buffer
:bp - previous buffer
:bd - delete buffer (close a file)
:ls - list all buffers
:e file - open file in new buffer
:vsp file - open file in a split window
C- ww - switch windows
C- wq - quit window

:set expandtab ts=4 sw=4 ai - tabs to spaces, tab is 4 spaces, autoindent

:%retab - convert the whole damn document

## Moving and Inserting

h,j,k,l - yeah
H - top of screen
L - bottom of screen
e - jump forward to start of word
b - jump backwards to beginning of word
0 - start of line
$ - end of line
ctrl + b - pg up
ctrl + f - pg down

i - insert before cursor
I - insert beginning of line
a - insert after cursor
A - insert end of line
o - insert line BELOW
O - insert line ABOVE

## Statusline Stuff

https://github.com/itchyny/lightline.vim

http://learnvimscriptthehardway.stevelosh.com/chapters/17.html

:set laststatus=2 - turn on the status line

## netrw (directory browsing)

:Explore
:VExplore
:SExplore

- (minus) - go up a dir level

