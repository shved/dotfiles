export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export ARCHFLAGS="-arch x86_64"

alias ws="cd ~/workspace"
alias ll="ls -lah"
# alias pgp="pgp2"
alias vim="nvim"
alias python=$(which python3)
alias fd=fdfind

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:~/.cargo/bin
source "$HOME/.cargo/env"

export TMPDIR=/tmp

export PATH=~/.npm-global/bin:$PATH

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-3.0.0

export GREP_COLOR='1;33'

# Makes git auto completion faster favouring for local completions
__git_files () {
    _wanted files expl 'local files' _files
}

# [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward

export EDITOR=nvim
export VISUAL=nvim

# man 1 bash
HISTCONTROL=ignoredups

# R    Display colours escape chars as-is (so they're displayed).
# i    Ignore case unless pattern has upper case chars.
# M    Display line numbers and position.
# Q    Never ring terminal bell.
# X    Don't clear the screen on exit.
# F    Quit if output fits on a single screen.
# L    Ignore LESSOPEN (some Linux distros set this to defaults)
export LESS="RiMQXFL"

# override steeef theme prompt
autoload -U colors; colors

export PROMPT=$'%{$fg[yellow]%}%D{%H:%M} %{$purple%}%n${PR_RST}@%{$orange%}%m${PR_RST}: %{$limegreen%}%~${PR_RST} $vcs_info_msg_0_$(virtualenv_info)$ '

# For copying pretty examples
promptoff() {
  export PS1='$ '
  export RPROMPT=' '
}

alias lls="ls -lha --color=always -F --group-directories-first |awk '{k=0;s=0;for(i=0;i<=8;i++){;k+=((substr(\$1,i+2,1)~/[rwxst]/)*2^(8-i));};j=4;for(i=4;i<=10;i+=3){;s+=((substr(\$1,i,1)~/[stST]/)*j);j/=2;};if(k){;printf(\"%0o%0o \",s,k);};print;}'"
