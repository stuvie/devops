# ~steve/.cshrc on all hosts

setenv NODE_ENV development

switch(`uname`)
case "CYGWIN*":
	# see $home/lib/cygwin/.profile
	alias home cd '"/cygdrive/c/Documents and Settings/kotsopol"'
	alias ssh /bin/ssh -F /home/steve/.ssh/config
	breaksw
default:
	# unix stuff
	unlimit cpu
	set mail = (60 /var/mail/$USER)
	setenv PLAN9 /usr/local/plan9
	setenv GOROOT /usr/local/opt/go/libexec
	setenv GOPATH ~/work/go
	setenv GOBIN $GOPATH/bin
	set	path=(~/work/bin ~/bin ~/work/go/bin /usr/local/opt/go/libexec/bin /usr/local/bin /usr/local/sbin /bin /usr/bin /sbin /usr/sbin /usr/bin/X11 /usr/X11R6/bin /usr/games /usr/ucb $PLAN9/bin)
	breaksw
endsw

umask 022
setenv	EDITOR	vi
setenv	SHOST `hostname| sed 's/\..*//' | sed 's/-fywss-com//' | sed 's/fywsscom//'`
setenv PAGER less
setenv MAX_MAP_COUNT 262144
setenv LESSHISTFILE /dev/null

unalias vi
alias ls /bin/ls -F
alias psj jps -l
alias p less -m
alias pp cp -p

switch(`uname`)
case "SunOS":
	set path=(/usr/java1.4.1/bin ~/sun.bin /usr/ucb /usr/openwin/bin $path /usr/ccs/bin . /usr/local/test/apache/bin )
	setenv LANG en_US
	setenv LD_LIBRARY_PATH "/home/steve/work/links/m/solaris/lib:/usr/lib:/usr/openwin/lib:/usr/local/lib"
	alias du /bin/du -k
	alias df /bin/df -k
	alias ping /usr/sbin/ping -s
	breaksw
case "NetBSD":
case "BSD/OS":
case "BSD/386":
case "SecureZone":
	set path=(~/bsd.bin $path /usr/contrib/teTeX/bin/i386-bsdi3.0 /usr/contrib/mh/bin /usr/contrib/bin .)
	alias routes 'netstat -rn | grep -v UHL'
	alias koff	ktrace -C		# turn off all tracing
	alias kd	kdump -S		# show syslog-style time stamps
	alias pss 'ps  -aguxww | egrep -e "PID|\!*"'
	alias pssl 'ps  -aglxw | egrep -e "PID|\!*"'
	setenv	BLOCKSIZE 1k
	breaksw
case "Linux":
	set path=(~/work/bin.linux /usr/local/go/bin $path . /rc/pub /opt/argus/bin /usr/office52/program)
	setenv LANG en_US
	setenv I_WANT_A_BROKEN_PS 1
	setenv GOROOT /usr/local/go
	alias whois '/usr/bin/whois "\!*@whois.geektools.com"'
	alias trace strace -f
	alias df /bin/df -h -x tmpfs -x devtmpfs
	switch(`grep '^ID=' /etc/os-release`)
	case "*debian*":
	case "*ubuntu*":
	case "*raspbian*":
		alias ltcp	'sudo lsof \!* | grep -i tcp | grep "           "'
		alias ctl	sudo systemctl
		alias update	sudo apt-get update
		alias upgrade	sudo apt-get upgrade
		alias install	sudo apt-get install -y
		alias list	'dpkg-query -l | grep'
		alias search	apt-cache search
		alias show	apt-cache show
		alias pfiles	dpkg -L
		breaksw
	default:
		alias rinst	rpm -ivh
		alias upgrade	rpm -Uvh
		alias rfresh	rpm -Fvh
		alias rfiles	rpm -qlp
		alias rinfo	rpm -qip
		alias rbuild	rpm --rebuild
		alias pfiles	rpm -ql
		alias pinfo	rpm -qi
		alias plist	rpm -q
		breaksw
	endsw
	setenv JAVA_HOME /usr/lib/jvm/default-java
	breaksw
case "Darwin":
	setenv HOMEBREW_CASK_OPTS "--appdir=/Applications/dev-tools"
	alias cask	brew cask
	alias update	brew update
	alias upgrade	brew upgrade
	alias install	brew install
	alias uninstall	brew uninstall
	alias list	brew list
	alias search	brew search
	alias show	brew info
	alias pfiles	brew list --verbose
	alias ser	brew services
	alias df	df -Ph -T nodevfs,autofs,nullfs
	setenv JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home
	set path=(/opt/X11/bin /usr/local/opt/node@10/bin ~/work/tools/spring/bin ~/work/tools/ant/bin /usr/local/mysql/bin ~/work/tools/maven/bin ~/work/tools/bin $path ~/Dropbox/dbin /opt/local/bin /usr/local/plan9/bin /Developer/usr/bin .)
	breaksw
default:
	breaksw
endsw

switch(`hostname`)
case "*.ecf*":
	set path=($path /share/bin)
	breaksw
case "radical*":
	setenv JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home
	breaksw
case "server*":
	setenv NODE_ENV production
	setenv NODE_ENV development
	breaksw
case "taco*":
	# setenv JAVA_HOME /Library/Java/JavaVirtualMachines/jdk-10.jdk/Contents/Home
	breaksw
case "ads*":
case "clash*":
	setenv JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
	setenv JAVA_HOME /Library/Java/JavaVirtualMachines/zulu1.7.0_181.jdk/Contents/Home
	setenv JAVA_TOOL_OPTIONS "-Dspring.profiles.active=LOCAL -Dfile.encoding=UTF8"
	setenv SDKMAN_PLATFORM Darwin
	setenv SDKMAN_CANDIDATES_API https://api.sdkman.io/2
	setenv SDKMAN_VERSION 5.7.3+337
	setenv SDKMAN_DIR ~/.sdkman
	setenv SDKMAN_CANDIDATES_DIR ~/.sdkman/candidates
	setenv GRADLE_HOME $SDKMAN_CANDIDATES_DIR/gradle/current
	set path=($GRADLE_HOME/bin $path)
	alias dbash	docker exec -it acuity_percona bash
	alias dlogs	docker logs -f acuity_percona
	alias mysql	mysql -A
	alias ka	kafkacat -b localhost:9092
	alias kq	kafkacat -b qa2-kafka-1:9092
	alias kd	kafkacat -b dv1-kafka-1.dv1.acuityads.org:9092
	alias kp	kafkacat -b 10.65.16.71:9092
	alias java8 'setenv JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home; set path=($JAVA_HOME/bin $path); rehash'
	switch(`hostname`)
	case "clash*":
		setenv JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home
		breaksw
	endsw
	breaksw
case "fw":
case "*fywss*":
case "*raspberrypi*":
	breaksw
default:
	if (! $?prompt) exit
	echo unknown host: $SHOST
	breaksw
endsw
set path=($JAVA_HOME/bin $path)

test -d /tmp/ssh-$user && \
    setenv SSH_AUTH_SOCK /tmp/ssh-$user/`/bin/ls -t /tmp/ssh-$user|head -1`

# if shell is not interactive, we've gone far enough.
#if (! $?prompt) exit

# An interactive shell -- set some stuff up
set filec
set notify=
set cdpath=( . ~ ~/work ~/Documents ~/Documents/projects ~/Dropbox/projects ~/Dropbox ~/links ~/work/links ~/lib )
set history=1000; unset savehist; unset autologout

setenv TZ EST5EDT
setenv LESS "-deiMs"

alias j	jobs -l
alias k1 "kill %1"
alias h history
alias f finger
alias d dirs
alias pd pushd
alias po popd
alias cdp cd '`pwd`'
alias ll ls -l
alias lt ls -ltr
alias ltt lt \!\* "|" tail
alias printer	'echo setenv PRINTER $PRINTER'
alias x		'echo setenv DISPLAY $DISPLAY'
alias rot tr "a-mn-zA-MN-Z" "n-za-mN-ZA-M"

alias z gzip -v
alias un gunzip -vN
alias zipls gzip -vl
alias shell echo /bin/csh is not very C-like

# tcpdump aliases for network testing
alias tcpd    tcpdump -N		# show short-form hostnames
alias tcpx    tcpdump -Nlx -s 800	# hex dump, includes IP/TCP/UDP headers
alias tpdump  'tcpx \!* | pdump'	# convert hex dump to ascii with pdump

alias mlog    tail -f /var/log/maillog
alias slog    tail -f /var/log/messages
alias dlog    tail -f /var/log/debug

alias ttcpsd  nuttcp -rv		# ttcp server, deprecated
alias ttcps   nuttcp -1v		# ttcp server
alias ttcp    nuttcp -tvv -n1000	# ttcp client
alias ho	host -t any

if (`whoami` == root) then
	echo "$user becomes root"
	if ($?admin) then
		set prompt="$admin# "
	else
		set prompt="root@$SHOST# "
	endif
else
	set prompt="`whoami`@$SHOST% "
endif

test -f ~/.ssh/env && source ~/.ssh/env
