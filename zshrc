# Path to your oh-my-zsh installation.
export ZSH=/Users/nhess/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

# TMUX
# Automatically start tmux
ZSH_TMUX_AUTOSTART=false

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
plugins=(git github macos)

# User configuration
DEFAULT_USER="nhess"

export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:$PATH"
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
alias zshconfig="vim ~/dotfiles/zshrc"
alias vim="nvim"
alias vsc="open -a 'Visual Studio Code'"
alias dotfiles="cd ~/dotfiles"
alias apps="cd /Applications"
alias dc="docker-compose"
alias dev="cd ~/developer"
alias jup="cd ~/developer/jupiter"
alias lg="lazygit"
alias oc="opencode"

export GIT_EDITOR="nvim"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

#PHP version
export PATH=/usr/local/php5/bin:$PATH

# Flutter
export PATH="$PATH:$HOME/flutter/bin:$PATH"

# MVN
export PATH=~/apache-maven-3.5.4/bin:$PATH

# Operator Mono to have cursives in vim
# run tic xterm-256color-italic.terminfo first
export TERM=xterm-256color-italic

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home

# bun completions
[ -s "/Users/nhess/.bun/_bun" ] && source "/Users/nhess/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/nhess/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Zoxide
eval "$(zoxide init zsh)"

# N
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export ZK_NOTEBOOK_DIR="$HOME/notebook"

# Added by Windsurf
export PATH="/Users/nhess/.codeium/windsurf/bin:$PATH"

# opencode
export PATH=/Users/nhess/.opencode/bin:$PATH

alias claude="/Users/nhess/.claude/local/claude"
alias load-keys="op_env"

#1password cli op completions
eval "$(op completion zsh)"; compdef _op op

# 1Password auto-signin (no output if already signed in)
if ! op whoami >/dev/null 2>&1; then
  eval "$(op signin)" >/dev/null
fi

# Load env vars from a file of 1P secret references into current shell
op_env() {
  local file="${1:-$HOME/dotfiles/.env.op}"
  if [[ ! -f "$file" ]]; then
    echo "op_env: '$file' not found" >&2
    return 1
  fi
  # Produce resolved KEY=VALUE lines in-memory and export them
  # No secrets are written to disk.
  local resolved
  resolved="$(op inject --in-file "$file" 2>/dev/null)" || return $?
  # Avoid putting secrets in history
  setopt LOCAL_OPTIONS NO_MONITOR
  # shellcheck disable=SC2163
  while IFS='=' read -r k v; do
    [[ -z "$k" || "$k" == \#* ]] && continue
    export "$k=$v"
  done <<< "$resolved"
  echo "Loaded $(echo "$resolved" | grep -v '^\s*$' | grep -v '^#' | wc -l | tr -d ' ') env var(s) from $file"
}

# API KEYS - Load securely from 1Password
# Run 'op_env' to load API keys from 1Password into environment variables
# or run 'op_env ~/.env.op' to specify a different file
# Note: API keys are stored securely in 1Password and loaded on-demand

