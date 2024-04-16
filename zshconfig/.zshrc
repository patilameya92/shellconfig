# These files are read when starting as an interactive shell.
# They are used for setting interactive shell configuration and executing
# commands. The /etc/zsh/zshrc applies to all users, while $ZDOTDIR/.zshrc
# applies to the individual user. it's the right place for aliases,
# functions, key bindings, and interactive shell options.

# CLI behaviour
## Colour the output of ls
export CLICOLOR=1

## Persist zsh history
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

## Prompt configuration
setopt prompt_subst
PROMPT="%F{green}%n@%m%f %F{cyan}%(3~|../%2~|%~)%f%F{yellow}\$(__git_ps1)%f> "

## Antidote plugin setup
zsh_plugins="${ZDOTDIR}/.zsh_plugins"

if is_macos; then
    source "${HOMEBREW_PREFIX}/opt/antidote/share/antidote/antidote.zsh"
fi

if [[ ! "${zsh_plugins}".zsh -nt "${zsh_plugins}".txt ]]; then
    (
        antidote bundle <"${zsh_plugins}".txt >"${zsh_plugins}".zsh
    )
fi
source "${zsh_plugins}".zsh

## Keyboard behaviour
if is_macos; then
    # Move forward by word with Option+RightArrow or Alt+RightArrow
    bindkey '^[^[[C' forward-word

    # Move backward by word with Option+LeftArrow or Alt+LeftArrow
    bindkey '^[^[[D' backward-word

    ### Bindkey to use fn
    bindkey '^[[H' beginning-of-line
    bindkey '^[[F' end-of-line

    # zsh-history-substring-search configuration
    bindkey '^[[A' history-substring-search-up # or '\eOA'
    bindkey '^[[B' history-substring-search-down # or '\eOB'
    HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
fi

# Aliases
## Call neovim instead of vim
if is_macos; then
    alias vim="${HOMEBREW_PREFIX}/bin/nvim"
fi

# Kubernetes
alias k='kubectl'

# Check if .zshrc_local exists and source it
if [[ -f "${ZDOTDIR}/extras/.zshrc_local" ]]; then
    source "${ZDOTDIR}/extras/.zshrc_local"
fi
