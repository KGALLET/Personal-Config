#!/bin/bash

# In my case, I use zsh so my env_config differ from a normal user
# Just remplace .zshrc by .bashrc in this case if your not using ZSH.
env_config="$HOME/.zshrc"

# Git config
git_config="$HOME/.gitconfig"

# Maven config 
mvn_config="$HOME/.m2/settings.xml"

if [[ $1 = 'on' ]]; 
then
	# Set the proxy to use command in terminal
	sed -i -e 's/^#\(export\ .*_proxy\)/\1/' $env_config

	# Set the proxy for GitHub
	sed -i -e 's/^#\(\[https*\]\)/\1/; s/^#\(\t*proxy\)/\1/' $git_config

	# Set the proxy for npm
	npm config set proxy http://cache-etu.univ-lille1.fr:3128
	npm config set https.proxy http://cache-etu.univ-lille1.fr:3128

	# Set the proxy for maven
	# sed -i '/<proxy>/{n; s/false/true/}' $mvn_config
	echo "Git proxy..."
	git config --global --get http.proxy
	git config --global --get https.proxy
	echo "NPM proxy..."
	npm config get proxy
	npm config get https.proxy

elif [[ $1 = "off" ]]; then

	# Unset the proxy to use command in terminal
	sed -i -e 's/\(^export\ .*_proxy\)/#\1/' $env_config
	unset http_proxy

	# Unset the proxy for GitHub
	sed -i -e 's/\(^\[https*\]\)/#\1/; s/\(^\t*proxy\)/#\1/' $git_config

	# Unset the proxy for npm
	npm config rm https.proxy
	npm config rm proxy

	# Unset the proxy for maven
	# sed -i '/<proxy>/{n; s/true/false/}' $mvn_config
	echo "Removed all proxy..."
else 
	echo "Usage : $0 [on|off]"
fi