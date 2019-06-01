if [ -f /etc/bashrc  ]; then
    . /etc/bashrc
fi
 
alias v=vi
alias e=evince
alias p=python
alias i=ipython

function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}")"
}
color_prompt=yes
if [ "$color_prompt" = yes  ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h:\[\033[01;34m\]\w\[\033[01;35m\]\$(parse_git_branch)\[\033[01;33m\]\$\[\033[00m\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
