#!/bin/bash

SSID=LILLE1

if [[ $(networksetup -getairportnetwork en0 | cut -c 24-) = $SSID ]];
	then
  	echo "Proxy enable in progress.."
    source $HOME/proxy.sh on
elif [[ $(networksetup -getairportnetwork en0 | cut -c 24-) != $SSID ]]; then
    source $HOME/proxy.sh off
  	echo "Proxy disable."
fi
