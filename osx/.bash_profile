export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TZ=UTC-8
# OSX default PATH is:
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# Add Homebrew super formulae to PATH:
export PATH="/usr/local/sbin:$PATH"

# Import prompt settings
if [ -f ${HOME}/.bash_prompt ]; then
  . ${HOME}/.bash_prompt
fi

# Source bash-completion formula:
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Solarized color theme for ls command:
#   * make sure installed GNU ls (brew install coreutils)
if brew list --versions coreutils >/dev/null && [ -f ${HOME}/.dir_colors ]; then
  eval `gdircolors ${HOME}/.dir_colors`
  alias ls='gls -F --show-control-chars --color=auto'
fi

# Powerline status:
#  1) install brewed python (brew install python)
#  2) use brewed python's pip install powerline-status
#if brew list --versions python >/dev/null && powerline-daemon -h >/dev/null; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . $(brew --prefix)/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#fi
# jenv(java):
#[[ -s "${HOME}/.jenv/bin/jenv-init.sh" ]] && \
#. "${HOME}/.jenv/bin/jenv-init.sh" && \
#. "${HOME}/.jenv/commands/completion.sh"

# nvm(node, npm):
# export NVM_DIR="${HOME}/.nvm"
# . "$(brew --prefix nvm)/nvm.sh"

# nodenv(node, npm): (brew install nodenv)
export PATH="$HOME/.nodenv/bin:$PATH"

if which nodenv > /dev/null; then
  eval "$(nodenv init -)";
fi

# pyenv, pyenv-virtualenv(python):
# if which pyenv >/dev/null; then
#   eval "$(pyenv init -)";
#   # cf. https://github.com/yyuu/pyenv/issues/106#issuecomment-94921352
#   alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
# fi
#
# if which pyenv-virtualenv-init >/dev/null; then
#   eval "$(pyenv virtualenv-init -)";
# fi

# rbenv (brew install rbenv)
export PATH="$HOME/.rbenv/bin:$PATH"

if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

# exenv (brew install exenv)
export PATH="$HOME/.exenv/bin:$PATH"

if which exenv > /dev/null; then
  eval "$(exenv init -)";
fi

# phpenv (brew install phpenv)
export PATH="$HOME/.phpenv/bin:$PATH"

if which phpenv > /dev/null; then
  eval "$(phpenv init -)";
fi

# --= Alias =--
alias ..='cd ..'
alias c='clear'
alias q='exit'
alias quit='exit'
alias l='ls'
alias ll='ls -lh'
alias la='ll -A'
alias here='open .'
alias gdf='git diff'
alias gst='git status'
