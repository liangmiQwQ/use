# Dedupe command history
setopt HIST_IGNORE_ALL_DUPS

# Default terminal key bindings
bindkey -e

# Terminal title
zstyle ':zim:termtitle' format '%1~'

# Autosuggestions
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

# Syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Zim
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
source ${ZIM_HOME}/init.zsh

# Personal alias
alias pnpx='pnpm dlx'
alias j="just"
alias c="cd ~/code"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
