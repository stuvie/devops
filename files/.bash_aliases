# .bash_aliases - is typically sourced from .bashrc
#
#PS1="tmacc@authoring$ "
#PS1="tmacc@staging$ "
#PS1="vagrant@dev.tmacc.com$ "

case `uname` in
Linux)
	alias df='/bin/df -h -x tmpfs -x devtmpfs'
	export JAVA_HOME=/usr/lib/jvm/default-java

	case `grep '^ID=' /etc/os-release` in
	*ubuntu*|*debian*|*raspbian*)
		alias ltcp='sudo lsof \!* | grep -i tcp | grep "           "'
		alias ctl='sudo systemctl'
		alias update='sudo apt-get update'
		alias upgrade='sudo apt-get upgrade'
		alias install='sudo apt-get install -y'
		alias list='dpkg-query -l | grep'
		alias search='apt-cache search'
		alias show='apt-cache show'
		alias pfiles='dpkg -L'
		;;
	esac
	;;
Darwin)
	alias df='/bin/df -Ph -T nodevfs,autofs,nullfs'
	export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.jdk/Contents/Home
	;;
esac

alias ll='ls -l'
alias lt='ls -ltr'
alias ltt='ls -ltr | tail'
alias p='less'
alias d='dirs'
alias pd='pushd'
alias po='popd'
alias h='history'
alias agent='eval $(ssh-agent -s)'

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
if test -f $HOME/.ssh/env.sh; then
	. $HOME/.ssh/env.sh
fi
