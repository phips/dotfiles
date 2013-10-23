if [ $OS == "Linux" ]; then
    LS_EXTRA_OPTS='--color=tty'
fi

alias j=jobs
alias l="ls -laF $LS_EXTRA_OPTS"
alias lr="ls -latrF $LS_EXTRA_OPTS"
alias striplines="egrep -v '(^#|^$)'"
[ -x $(which VBoxManage 2>/dev/null) ] && alias vbox=VBoxManage
[ -x $(which vim) ] && alias vi=vim
