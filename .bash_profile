# Tips to add a script from the Applications folder to allow execution in bash
# Example with Atom :
# ln -s /Applications/Atom.app/Contents/Resources/app/atom.sh /usr/local/bin/atom

# Cleaning PATH
export PATH=""

# Basic folders
export PATH="/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:/usr/local/sbin:$PATH"

# Export of L3 Folder
export PATH="$HOME/Documents/L3:$PATH"

# Setting PATH For MacPorts Installer
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Setting PATH for Python 3.5
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

# Setting PATH for maven 3.3.9
export PATH="/usr/local/bin/maven/bin:${PATH}"

# Setting JAVA_HOME at /usr/libexec/java_home
export JAVA_HOME=$(/usr/libexec/java_home)

# Adding branch when a folder is on git 
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set colors to terminal
BLUE="\[\033[36m\]"
GREEN="\[\033[32m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
YELLOW_2="\[\033[33;1m\]"
NO_COLOR="\[\033[0m\]"

export PS1="$BLUE\u$NO_COLOR @ $GREEN\h :$YELLOW_2 \w$RED\$(parse_git_branch) $RED\$$NO_COLOR "
export CLICOLOR=1

# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
# Compiler for Haskell
export GHC_DOT_APP="/Applications/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# My aliases
alias ll='ls -all'
alias cdcd='cd .. && cd ..	'
alias l='ls'
