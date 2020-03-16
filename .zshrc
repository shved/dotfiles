export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export ARCHFLAGS="-arch x86_64"

# +++++++++++++++++++++++++++++
# +++++++++ MY THINGS +++++++++
# +++++++++++++++++++++++++++++

alias ..="cd .."
alias ws="cd ~/workspace"
alias ll="ls -lah"
alias pgp="pgp2"
alias vim="nvim"
alias python=$(which python3)

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:~/.cargo/bin

export TMPDIR=/tmp

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.7.0

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
export PROMPT=$'%{$purple%}%n${PR_RST}@%{$orange%}%m${PR_RST}: %{$limegreen%}%~${PR_RST} $vcs_info_msg_0_$(virtualenv_info)$ '

# For copying pretty examples
unprompt() {
  export PS1='$ '
  export RPROMPT=' '
}
