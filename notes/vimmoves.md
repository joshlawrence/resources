# VIM shortcuts

https://vim.rtorr.com/

https://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers/103590#103590

https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/

https://sanctum.geek.nz/arabesque/vim-anti-patterns/

## Moving/Inserting/Deleting

h,j,k,l - yeah
^ or 0 - start of line
$ - end of line
ctrl+B - pg up
ctrl+F - pg down
{ - start of prev paragraph or block
} - end of next paragraph or block

i - insert before cursor
a - insert after cursor
I - insert beginning of line
A - insert end of line
o - insert line BELOW
O - insert line ABOVE

y - copy
d - cut (after visually selecting)
P - paste before cursor
p - paste after cursor

## Formatting

:set textwidth=80
:set wrapmargin=2

gq - reformat text based on the current selection
gqG - reformat text from current position to bottom of file

__Don't forget `fmt` and `par` as non-vim options__

:center - centers a line of text
:set expandtab ts=4 sw=4 ai - tabs to spaces, tab is 4 spaces, autoindent
:%retab - convert the whole damn document

## Buffers

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

## Directory Browsing (netrw)

:Explore
:VExplore
:SExplore

- (minus) - go up a dir level

