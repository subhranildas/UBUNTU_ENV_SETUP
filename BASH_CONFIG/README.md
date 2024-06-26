# A Modified BASHRC for better BASH Experience #

## PREREQUISITIES ##
    - There are not really many prerequisities as such.
    - The updated bash uses batcat instead of cat for better visuals.
      Therefore batcat should be installed in the system.

## SETUP PROCESS ##
    - Run the setup.sh file from this directory

## SETUP Script ##
    - The setup script will automatically install batcat if not already installed.
    - If the bashrc is already updated to new then setup won't replace the bashrc.
    - If setup has to replace the bashrc, it will save the old one as .bashrc.bak.

## BASHRC Features ##
    - Added useful Aliases

## LS COLOR MANUAL ##

Possible file types to choose from to modify color:

bd = (BLOCK, BLK)   Block device (buffered) special file
cd = (CHAR, CHR)    Character device (unbuffered) special file
di = (DIR)  Directory
do = (DOOR) [Door][1]
ex = (EXEC) Executable file (ie. has 'x' set in permissions)
fi = (FILE) Normal file
ln = (SYMLINK, LINK, LNK)   Symbolic link. If you set this to ‘target’ instead of a numerical value, the color is as for the file pointed to.
mi = (MISSING)  Non-existent file pointed to by a symbolic link (visible when you type ls -l)
no = (NORMAL, NORM) Normal (non-filename) text. Global default, although everything should be something
or = (ORPHAN)   Symbolic link pointing to an orphaned non-existent file
ow = (OTHER_WRITABLE)   Directory that is other-writable (o+w) and not sticky
pi = (FIFO, PIPE)   Named pipe (fifo file)
sg = (SETGID)   File that is setgid (g+s)
so = (SOCK) Socket file
st = (STICKY)   Directory with the sticky bit set (+t) and not other-writable
su = (SETUID)   File that is setuid (u+s)
tw = (STICKY_OTHER_WRITABLE)    Directory that is sticky and other-writable (+t,o+w)
*.extension =   Every file using this extension e.g. *.rpm = files with the ending .rpm

The first number is the style (1=bold), followed by a semicolon, and then the actual number of the color, possible styles (effects) are:

0   = default colour
1   = bold
4   = underlined
5   = flashing text (disabled on some terminals)
7   = reverse field (exchange foreground and background color)
8   = concealed (invisible)

The possible backgrounds:

40  = black background
41  = red background
42  = green background
43  = orange background
44  = blue background
45  = purple background
46  = cyan background
47  = grey background
100 = dark grey background
101 = light red background
102 = light green background
103 = yellow background
104 = light blue background
105 = light purple background
106 = turquoise background
107 = white background

All possible colors:

30  = black
31  = red
32  = green
33  = orange
34  = blue
35  = purple
36  = cyan
37  = grey
90  = dark grey
91  = light red
92  = light green
93  = yellow
94  = light blue
95  = light purple
96  = turquoise
97  = white

These can even be combined, so that a parameter like:

di=1;4;31;42

** In the bashrc file LS_COLORS is an example usage.
