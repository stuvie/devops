# .bash_aliases - is typically sourced from .bashrc
#
#PS1="tmacc@authoring$ "
#PS1="tmacc@staging$ "
#PS1="vagrant@dev.tmacc.com$ "
alias df='df -h -t ext4'
alias ll='ls -l'
alias lt='ls -ltr'
alias p='less'
alias d='dirs'
alias pd='pushd'
alias po='popd'
alias h='history'

user=`whoami`
if test x$SSH_AUTH_SOCK != xx ; then
	if test -d /tmp/ssh-$user ; then
		SSH_AUTH_SOCK=/tmp/ssh-$user/`/bin/ls -t /tmp/ssh-$user|head -1`
		SSH_AGENT_PID=`/bin/ls -t /tmp/ssh-$user|head -1|sed s/agent-socket-//`
		export SSH_AUTH_SOCK
		export SSH_AGENT_PID
	fi
fi

# PS1="\u@\h \W\\$ "
unset HISTFILE
PATH=$PATH:$HOME/bin:/usr/local/bin
