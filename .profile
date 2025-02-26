# homebrew sbin
export PATH=$PATH:/usr/local/sbin

export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

# Add scripts I write in ~/bin to $PATH
export PATH="$HOME/bin:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Brew git 
export PATH="/usr/local/opt/git/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

# After $PATH vars are added grab bashrc 
if [ -f ~/.zshrc ]; then
  source ~/.zshrc
fi

# Source GNU versions of linux tools as default
if [ -f ~/.bash_gnu ]; then
  source ~/.bash_gnu
fi

export JAVA_HOME=$(/usr/libexec/java_home)

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
. "$HOME/.cargo/env"
