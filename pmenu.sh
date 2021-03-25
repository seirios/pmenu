#!/bin/sh

PMENU=$HOME/src/pmenu/pmenu

cat <<EOF | $PMENU | sh &
Browser		firefox
xterm		xterm
urxvt		urxvt
st		st
Halt		poweroff
Reboot		reboot
EOF
