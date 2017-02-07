#!/bin/bash

# In my case, I use zsh so my env_config differ from a normal user
# Just remplace .zshrc by .bashrc in this case if your not using ZSH.
# env_config="$HOME/.zshrc"

# Git config
git_config="$HOME/.gitconfig"

# Maven config
mvn_config="$HOME/.m2/settings.xml"

if [[ $1 = 'on' ]];
then
	# Set the proxy to use command in terminal
	export http_proxy=http://cache-etu.univ-lille1.fr:3128
	export https_proxy=http://cache-etu.univ-lille1.fr:3128
	echo "Terminal proxy... done."

	# Set the proxy for GitHub
	sed -i -e 's/^#\(\[https*\]\)/\1/; s/^#\(\t*proxy\)/\1/' $git_config
	echo "Git proxy... done."

	# Set the proxy for npm
	npm config set proxy http://cache-etu.univ-lille1.fr:3128
	npm config set https.proxy http://cache-etu.univ-lille1.fr:3128

	echo "NPM proxy... done."

	# Set the proxy for maven
	echo "MAVEN proxy... done."
	sed -i -e '/<proxy>/,/<\/proxy>/ s|<active>[a-z.]\{1,\}</active>|<active>true</active>|g' $mvn_config


elif [[ $1 = "off" ]]; then

	# Unset the proxy to use command in terminal
	sed -i -e 's/\(^export\ .*_proxy\)/#\1/' $env_config
	unset http_proxy
	unset https_proxy

	# Unset the proxy for GitHub
	sed -i -e 's/\(^\[https*\]\)/#\1/; s/\(^\t*proxy\)/#\1/' $git_config

	# Unset the proxy for npm
	npm config rm https.proxy
	npm config rm proxy

	# Unset the proxy for maven
	sed -i -e '/<proxy>/,/<\/proxy>/ s|<active>[a-z.]\{1,\}</active>|<active>false</active>|g' $mvn_config
	echo "Removed all proxy..."
else
	echo "Usage : $0 [on|off]"
fi
