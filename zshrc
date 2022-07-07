# Path to your oh-my-zsh installation.
export ZSH=/Users/nhess/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

# TMUX
# Autmoatically start tmux
# ZSH_TMUX_AUTOSTART=true

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git github brew macos node)

# User configuration
DEFAULT_USER="nhess"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

# Enabled true color support for terminals
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/dotfiles/zshrc"
alias vim="nvim"
alias vsc="open -a 'Visual Studio Code'"
alias code="cd ~/code"
alias dotfiles="cd ~/dotfiles"
alias apps="cd /Applications"
alias dc="docker-compose"
alias loft="docker-compose -f docker-compose.yml -f docker-compose.dev.yml"
export GIT_EDITOR="vim"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python

eval "$(rbenv init -)"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PACKAGE_DIRS="/Users/nhess/Code/meteor/packages"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

#PHP version
export PATH=/usr/local/php5/bin:$PATH

# Flutter
export PATH="$PATH:$HOME/flutter/bin:$PATH"

# MVN
export PATH=~/apache-maven-3.5.4/bin:$PATH

# Yarn
export PATH="$PATH:$(yarn global bin)"

# Operator Mono to have cursives in vim
export TERM=xterm-256color-italic

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nhess/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nhess/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nhess/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nhess/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/nhess/.bun/_bun" ] && source "/Users/nhess/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/nhess/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
