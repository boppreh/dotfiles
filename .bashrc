alias t="python ~/t.py"
alias ta="python ~/t.py a"
alias td="python ~/t.py d"
alias te="python ~/t.py e"

alias pl="pl -s"

PS1="\w> "

PYTHONSTARTUP=~/.pythonrc.py
EDITOR=vim

[ -t 0 ] && exec screen -xRRU
