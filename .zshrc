# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="gnzh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="ls -GF"
alias l="ls -Ghl"
alias ll="ls -AGhl"
alias .="pwd"
alias ..="cd .."
alias more="less"

alias grep='grep --color=auto'
alias mtr='sudo mtr'
alias lsusb='system_profiler SPUSBDataType'
alias k='/usr/local/bin/kubectl'
alias netstat-osx='sudo lsof -nP -iTCP -iUDP | grep LISTEN'
alias netstat-osx-more='sudo lsof -nP -iTCP -iUDP'
alias showvpn='ifconfig | grep -A 2 utun'

# Update homebrew
alias update_hb='cd "$(brew --repo)" && git fetch && git reset --hard origin/master && brew update'
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# Reload zsh
alias sa='source ~/.zshrc'

# The dad joke generator
dadjoke(){
  dadjoke=$(curl -sX GET https://icanhazdadjoke.com)
  count=${#dadjoke}

  printf '%*s\n' "$count" '' | tr ' ' '-'
  echo "${dadjoke}"
  printf '%*s\n' "$count" '' | tr ' ' '-'
}

# Call the function on each shell invocation
dadjoke

# Open a file or URL in the default application
qopen() {
  local arg="$*"
  open "$arg"
}

# Find files with a pattern
f() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: f [<PATH>] <PATTERN>"
        echo "       f <FIND_OPTIONS> <PATTERN>"
        return 1
    fi

    # If only one argument is passed, treat it as the pattern
    if [[ $# -eq 1 ]]; then
        find . -iname "*$1*"
        return
    fi

    # If two arguments are passed, treat the first as the path and the second as the pattern
    if [[ $# -eq 2 ]]; then
        find "$1" -iname "*$2*"
        return
    fi

    # For more than two arguments, treat all but the last as regular find options
    # and wrap the last argument in "*" for pattern matching
    local args=("$@")  # Copy all arguments into an array
    local last_arg="${args[-1]}"  # Get the last argument
    args[-1]="*$last_arg*"  # Wrap the last argument in "*"

    # Run the find command with the modified arguments
    find "${args[@]}"
}


