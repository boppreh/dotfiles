export MAN_POSIXLY_CORRECT=1

alias ll="ls -lh"
alias la="ll -a"
alias lr="ll -aR"
alias l="ls -CF"

alias t="python ~/t.py"
alias ta="python ~/t.py a"
alias td="python ~/t.py d"
alias te="python ~/t.py e"

alias s="exec screen -dRU"

alias identify="cat .plan"

function email {
    if [ $2 ]; then
        if [ -e $1 ]; then
            mailx -a $1 -R "$2" -r "lucasboppre@gmail.com"
        else
            mailx -a $2 -R "$1" -r "lucasboppre@gmail.com" 
        fi
    else
        if [ -e $1 ]; then
            mailx -a $1 -R "lucasboppre@gmail.com" -r "lucasboppre@gmail.com" 
        else
            mailx -R "$1" -r "lucasboppre@gmail.com" 
        fi
    fi
}

function publish {
	cp $1 ~/public_html
	echo "www.inf.ufsc.br/~lucasboppre/$(basename $1)"
}

function unpublish {
	rm ~/public_html/$(basename $1)
}

p() { publish $1 };
u() { unpublish $1 };

function testc {
	vim ~/testsrc.c
	if gcc -o ~/testbin ~/testsrc.c -lm
	then
		~/testbin
		rm ~/testsrc.c
		rm ~/testbin
	else
		read
		testc
	fi
}

PS1="%~> "

PYTHONSTARTUP=~/.pythonrc.py
EDITOR=vim

#if [ -z "$STY" ]; then
	#exec screen -dRU
#fi

# If runing in screen, set the window title to the command about to be executed
preexec() {
	if [[ "$TERM" == "screen" ]]; then
	   local CMD=${1[(wr)^(*=*|sudo|-*)]}
	   echo -n "\ek${TITLE:-$CMD}\e\\"
	fi
}
