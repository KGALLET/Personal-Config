# Path to your oh-my-zsh installation.
export ZSH=/Users/Nvk/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="zeta"

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git colored-man colorize brew osx zsh-syntax-highlighting)

# User configuration

######################################## PATH ########################################

# Cleaning PATH
export PATH=""
# Basic folders
export PATH="/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:/usr/local/sbin:$PATH"
# Export of L3 Folder
export PATH="$HOME/Documents/L3:$PATH"
# Setting PATH For MacPorts Installer
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Setinng PATH for node_modules LAC
export PATH="~/Documents/Stage/CreationCulturelle/lacnative/node_modules:$PATH"
# Setting PATH for Python 3.5
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
# Setting PATH for android sdk & ndk
export PATH="~/android-sdk-macosx/platform-tools/:~/android-sdk-macosx/tools/:$PATH"
export ANDROID_NDK="~/android-ndk-r10e/"
# Setting node_modules LAC to PATH
export PATH="~/Documents/Stage/CreationCulturelle/lacnative/node_modules/:$PATH"

#####################################################################################

######################################## FUNCTIONS ########################################

source $ZSH/oh-my-zsh.sh

# Owner
export USER_NAME="Kévin Gallet"
eval "$(rbenv init -)"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

#####################################################################################

######################################## ALIASES ########################################

alias ll='ls -all'
alias cdcd='cd .. && cd ..  '
alias lac='cd ~/Documents/Stage/CreationCulturelle/lacnative/'
alias runa='react-native run-android'
alias runi='react-native run-ios'

# Use sublimetext for editing config files
alias zshconfig="sublime ~/.zshrc"

#######################################################################################
