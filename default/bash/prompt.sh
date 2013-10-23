case $TERM in
  linux|rxvt|screen|xterm*)
    if [[ $ID -eq 0 ]]; then
      PS1='\[\e[31;1m\]\h:\[\e[34;1m\]\W\$ \[\e[m\]'
      PS2='\[\e[31;1m\]\h> \[\e[m\]'
    else
      PS1='\[\e[32;1m\]\h:\[\e[34;1m\]\W\$ \[\e[m\]'
      PS2='\[\e[32;1m\]\h> \[\e[m\]'
    fi
    ;;
  *)
    if [[ $ID -eq 0 ]]; then
      PS1='\u@\h:\W\$ '
    fi
    ;;
esac
