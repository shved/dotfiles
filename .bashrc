# Disable alt-NUM nonsense key binding
for i in "-" {0..9}; do bind -r "\e$i"; done

alias ws="cd ~/workspace"
alias ll="ls -lah"
alias vim="nvim"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GREP_COLORS='mt=1;33'

export EDITOR=hx
export VISUAL=hx

# man 1 bash
HISTCONTROL=ignoredups

# i    Ignore case unless pattern has upper case chars.
# M    Display line numbers and position.
# X    Don't clear the screen on exit.
# F    Quit if output fits on a single screen.
# L    Ignore LESSOPEN.
# R    Display colors.
export LESS="iMXFLR"

alias lls="ls -lha --color=always -F --group-directories-first |awk '{k=0;s=0;for(i=0;i<=8;i++){;k+=((substr(\$1,i+2,1)~/[rwxst]/)*2^(8-i));};j=4;for(i=4;i<=10;i+=3){;s+=((substr(\$1,i,1)~/[stST]/)*j);j/=2;};if(k){;printf(\"%0o%0o \",s,k);};print;}'"

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
PROMPT_DIRTRIM=3
PS1='\[\e[38;5;39m\]\u@\h\[\e[0m\] \[\e[38;5;220m\]\w\[\e[0m\] \[\e[38;5;208m\]${PS1_CMD1}\[\e[0m\] \$ '
