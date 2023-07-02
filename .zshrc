# idk {{{
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

#}}}


# User configuration{{{

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



if [ -n "$VIRTUAL_ENV" ]; then
. "$VIRTUAL_ENV/bin/activate"
# else
# workon default
fi

setopt extendedglob

#Autocomplete hidden files
#_comp_options+=(globdots)}}}



## VI-MODE {{{

vi-cmd () {
  local REPLY

  # Read the next keystroke, look it up in the `vicmd` keymap and, if successful,
  # evalute the widget bound to it in the context of the `vicmd` keymap.
  zle .read-command -K vicmd && 
    zle $REPLY -K vicmd
}

# Make a keyboard widget out of the function above.
zle -N vi-cmd

# Bind the widget to Ctrl-O in the `viins` keymap.
bindkey -v '^O' vi-cmd

# Remove mode switching delay.
export KEYTIMEOUT=1



bindkey "^W" backward-kill-word 
bindkey "^H" backward-delete-char      # Control-h also deletes the previous char
bindkey "^U" backward-kill-line  

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

function zle-line-init zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
# Change cursor shape for different vi modes.
zle -N zle-keymap-select

_fix_cursor() {
    echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

zle -N zle-line-init
zle -N zle-keymap-select

# autosuggest
bindkey '^ ' autosuggest-accept
bindkey '^f' vi-forward-word
# }}}


# Creating custom kill-word because it didn't stop on slash
backward-kill-word() { 
  # LBUFFER -- all text left of the cursor
  # (z)     -- split into shell words
  # (A)     -- force the resulting words into an array
  # [-1]    -- take the right-most element
  # :t      -- strip all path ancestors from it
  # %       -- remove the shortest matching substring from the right
  LBUFFER=${LBUFFER%${${(zA)LBUFFER}[-1]:t}*} 
  zle -f kill  # Tell the Zsh Line Editor that we've killed text.
}
zle -N backward-kill-word  # Replace the default widget.

kill-word() {
  # RBUFFER -- all text to the right of the cursor
  # [1]     -- take the left-most element
  # :h1     -- strip all path descendants from it
  # #       -- remove the shortest matching substring from the left
  RBUFFER=${RBUFFER#*${${(zA)RBUFFER}[1]:h1}}
  zle -f kill
}
zle -N kill-word

# for Fedora 
# alias vim=vimx




## ENVIORNMENT VARIABLES{{{

LANG="en_US.utf8"
export LANG
export PATH=/home/hazem/scripts:/home/hazem/.local/bin:/home/hazem/Downloads/apps/flutter/bin:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib
export PATH=/snap/bin:$PATH
export EDITOR=vim
export TERMINAL=kitty
export TERM=xterm-256color
# export GLFW_IM_MODULE=ibus
export QT_STYLE_OVERIDE=GTK+
export QT_QPA_PLATFORMTHEME=gtk2

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export CHROME_EXECUTABLE="/opt/brave.com/brave/brave-browser"
# virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

#}}}



# PROPMT{{{

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{156}%b %F{154}%F{156} '

#zstyle ':vcs_info:git:*' formats '%F{0}%b %F{0}%F{0} '

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
# PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '
PROMPT='%B%F{220}%n: ${vcs_info_msg_0_}%F{253}%~ %F{244}» '
# PROMPT='%B%F{0}%n: ${vcs_info_msg_0_}%F{0}%~ %F{0}» '

# }}}


## HISTORY{{{

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
# }}}


## COMPLETION{{{

autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
fpath=(~/.zsh/plugins/zsh-completions/src $fpath)

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# }}}


## PLUGINS{{{

source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh
source ~/.zsh/plugins/git/git.plugin.zsh
# }}}

# ALIAS{{{
alias ipy='ipython --TerminalInteractiveShell.editing_mode=vi'
alias bh='echo 7500 | sudo tee -a /sys/class/backlight/intel_backlight/brightness'
alias bm='echo 4000 | sudo tee -a /sys/class/backlight/intel_backlight/brightness'
alias bl='echo 1000 | sudo tee -a /sys/class/backlight/intel_backlight/brightness'
# }}}

