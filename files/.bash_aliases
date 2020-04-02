# .bash_aliases - is typically sourced from .bashrc
#
#PS1="tmacc@authoring$ "
#PS1="tmacc@staging$ "
#PS1="vagrant@dev.tmacc.com$ "

umask 022

case `uname` in
Linux)
	alias df='/bin/df -h -x tmpfs -x devtmpfs'
	export JAVA_HOME=/usr/lib/jvm/default-java

	case `grep '^ID=' /etc/os-release` in
	*ubuntu*|*debian*|*raspbian*|*linuxmint*)
		alias ltcp='sudo lsof \!* | grep -i tcp | grep "           "'
		alias ctl='sudo systemctl'
		alias update='sudo apt-get update'
		alias upgrade='sudo apt-get upgrade'
		alias install='sudo apt-get install -y'
		alias list='dpkg-query -l | grep'
		alias search='apt-cache search'
		alias show='apt-cache show'
		alias pfiles='dpkg -L'
		export LANGUAGE=en_US.UTF-8
		export LANG=en_US.UTF-8
		export LC_ALL=en_US.UTF-8
		;;
	*centos*)
		export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64
		alias ltcp='sudo lsof \!* | grep -i tcp | grep "           "'
		alias ctl='sudo systemctl'
		alias ram='ps aux --sort -rss | head -20'
		alias update='sudo yum check-update'
		alias upgrade='sudo yum update'
		;;
	esac
	;;
Darwin)
	alias df='/bin/df -Ph -T nodevfs,autofs,nullfs'
	#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.jdk/Contents/Home
	export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.0.2.jdk/Contents/Home
	export GOROOT=/usr/local/opt/go/libexec
	export GOPATH=~/work/go
	export GO111MODULE=on
	export GOPRIVATE=gitlab.bluecatlabs.net/dns-platform/BSL/*
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
alias ctl='systemctl'
alias ktl='kubectl'

 alias check='/home/skotsopoulos/sk/check.sh'
 alias bdr='tail -f /opt/bid-router/logs/* /opt/bid-router/bin/nohup.out'
 alias bdrp='ps aux | grep [c]om.acuityads.bid.router'
 alias cache='grep sites            /opt/bid-router/logs/bid-router.log | grep -v BatchMinus1 | grep --color=auto contains'
 alias sites='grep SiteInfoCacheDao /opt/bid-router/logs/bid-router.log | grep --color=auto exchangeId'
 alias slow='grep sampled /opt/bid-router/logs/bid-router-trace.log | sort -n -k5'
 alias traces='tail -f /opt/bid-router/logs/bid-router-trace.log'
 alias alerts='grep alert /opt/bid-router/logs/bid-router-trace.log'

 alias trace='grep \!* /opt/bid-router/logs/bid-router-trace.log'
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
# unset HISTFILE
PATH=/usr/local/gradle-4.10.2/bin:$HOME/bin/bluecat:$HOME/work/go/bin:$HOME/bin:/usr/local/bin:/home/steve/bin:$HOME/work/cli:$PATH:.
if test -f $HOME/.ssh/env.sh; then
	. $HOME/.ssh/env.sh
fi

case `hostname` in
*jbox*)
	alias pilot='scp *.zip sk/pilot_bid_router.sh nj-bdr1:/tmp'
	alias pilot2='scp *.zip sk/pilot_bid_router.sh nj-bdr2:/tmp'
	alias eu='ssh eu-bdr1'
	alias nj='ssh nj-bdr1'
	alias nj2='ssh nj-bdr2'
	alias la='ssh la-bdr1'
	alias influx='ssh nj-mon2'
	alias al='egrep "^alias" ~/.bash_aliases'
	;;
*)
	alias al='egrep "^alias" ~/.bash_aliases'
	;;
esac
CDPATH=".:~:~/work/cats:~/work:~/work/go/src/gitlab.bluecatlabs.net/dns-platform/BSL:~/work/go/src/github.com/stuvie:~/projects:~/lib:/etc"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# everything below here is just to set the prompt, lol

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/steve/.sdkman"
[[ -s "/home/steve/.sdkman/bin/sdkman-init.sh" ]] && source "/home/steve/.sdkman/bin/sdkman-init.sh"
