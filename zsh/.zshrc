# Created by newuser for 5.8.1
# Set directory where we want to store our plugins and zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


# Load zinit
source "$ZINIT_HOME/zinit.zsh"

# Load plugins
zinit light zsh-users/zsh-syntax-highlighting # syntax highlighting
zinit light zsh-users/zsh-completions # completions
zinit light zsh-users/zsh-autosuggestions # autosuggestions
# zinit light Aloxaf/fzf-tab # fzf tab completion


zinit snippet OMZP::git # Load git aliases from oh-my-zsh
zinit snippet OMZP::sudo # Load sudo aliases from oh-my-zsh
zinit snippet OMZP::kubectl # Load kubectl aliases from oh-my-zsh
zinit snippet OMZP::kubectx # Load kubectx and kubens aliases from oh-my-zsh
zinit snippet OMZP::command-not-found # Load command-not-found handler from oh-my-zsh

autoload -Uz compinit && compinit

zinit cdreplay -q # replay all cached completions

# Setup oh my posh
export PATH=$PATH:$HOME/.local/bin
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/amro.omp.json)"

# Load Completions
autoload -Uz compinit && compinit

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Use LS_COLORS for completion colors
zstyle ':completion:*' menu no # Disable completion menu
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle 'fzf-tab:completer:cd:*' fzf-preview 'ls --color $realpath' # Use ls to preview fzf completions

# Aliases
alias ls='ls --color=auto' # Always use color output for ls
alias nv='nvim' # Alias nv to nvim

# Key bindings
bindkey '^f' autosuggest-accept # Use autosuggest with ctrl+f
bindkey '^r' history-incremental-search-backward # Use history search with ctrl+r
bindkey '^p' history-incremental-pattern-search-backward # Use history search with ctrl+p
bindkey '^n' history-incremental-pattern-search-forward # Use history search with ctrl+n

# History
HISTSIZE=5000 # Number of commands to remember
HISTFILE=~/.zsh_history # File to save history to
SAVEHIST=$HISTSIZE # Save history to file
HISTDUP=erase # Erase duplicates in history
setopt appendhistory # Append history to file
setopt sharehistory # Share history between sessions
setopt hist_ignore_space # Ignore commands starting with space
setopt hist_ignore_all_dups # Ignore duplicates in history
setopt hist_save_no_dups # Don't save duplicates in history
setopt hist_ignore_space # Ignore commands starting with space
setopt hist_verify # Show command with history expansion to edit
setopt hist_find_no_dups # Don't display duplicates when searching history


# shell Integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)" # fzf shell integration

# Custom Paths

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
