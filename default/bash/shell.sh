##
## functions
##
function _ssh_auth_save {
    sock=$HOME/.ssh/ssh_auth_sock
    [ -L $sock ] && rm $sock
    ln -sf $SSH_AUTH_SOCK $sock
}

function _path_munge {
    dir=$1
    placement=${2:-append}

    # check the path isn't already on the PATH
    if [ ! $(echo $PATH | grep -q $dir) ]; then
        # If it doesn't exist, don't bother processing it
        if [ -d $1 ]; then
            # prepend, rather than append
            if [ ${placement} = "pre" ]; then
                [ -d ${dir} ] && PATH=${dir}:$PATH
            else
                [ -d ${dir} ] && PATH=$PATH:${dir}
            fi
        fi
    fi
}

##
## main
##
if [ $OS = "Darwin" ]; then
    _path_munge /opt/local/bin
    _path_munge /usr/local/mysql/bin
    PERL5LIB='/usr/share/git-core/perl'
fi

if [ $OS = "SunOS" ]; then
    _path_munge /opt/csw/bin
fi

GIT_SSL_NO_VERIFY=1
PERL_MM_USE_DEFAULT=1

[ $(which less) ] && PAGER=less

if [ -z $PERLBREW_ROOT ]; then
    if [ -f ${HOME}/perl5/perlbrew/etc/bashrc ]; then
        source ${HOME}/perl5/perlbrew/etc/bashrc
    fi
else
    if [ -f $PERLBREW_ROOT/etc/bashrc ]; then
        source $PERLBREW_ROOT/etc/bashrc
    fi
fi

# pyenv
if [[ $OS == "Darwin" ]]; then
    if [[ -d /usr/local/opt/pyenv ]]; then
        export PYENV_ROOT=/usr/local/opt/pyenv
        if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
    fi
else
    if [[ -f "$HOME/.pyenv/bin/pyenv" ]]; then
        _path_munge $HOME/.pyenv/bin pre
        eval "$(pyenv init -)"
    fi
fi

if [[ -f "$HOME/src/ansible/hacking/env-setup" ]]; then
    source $HOME/src/ansible/hacking/env-setup -q
fi

# ruby version manager
if [[ -f "$HOME/.rvm/scripts/rvm" ]]; then
    source "$HOME/.rvm/scripts/rvm"
fi

if [ ${OS} = 'SunOS' -a -d /opt/csw/share/terminfo ]; then
    export TERMINFO=/opt/csw/share/terminfo
fi

# green for dirs - a bit easier to read than 00;34
LS_COLORS='no=00:fi=00:di=00;32:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:'

export GIT_SSL_NO_VERIFY HOST ID LS_COLORS OS PAGER PERL_MM_USE_DEFAULT

shopt -s histappend
