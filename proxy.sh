#!/bin/bash

if [ $1 = 'N' ]
then
	git config --global --unset http.proxy
	git config --global --unset https.proxy
	npm config rm proxy
	npm config rm https.proxy
else
	git config --global https.proxy https://cache-etu.univ-lille1.fr:3128
	git config --global http.proxy http://cache-etu.univ-lille1.fr:3128
	npm config set proxy http://cache-etu.univ-lille1.fr:3128
	npm config set https.proxy http://cache-etu.univ-lille1.fr:3128
fi

echo "Checking Git proxy..."
	git config --global --get http.proxy
	git config --global --get https.proxy

echo "Checking npm proxy..."
	npm config get proxy
	npm config get https.proxy
