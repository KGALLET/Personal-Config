#!/bin/bash

ACTIVELAYOUT="$(osascript $HOME/Scripts/GetInputSource.scpt)"
KEYBOARD1=Mini\ Keyboard
KEYBOARD2=Razer\ BlackWidow

if [[ $(ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*' | grep $KEYBOARD1) = $KEYBOARD1 ]];
	then
	echo "$KEYBOARD1 detected, switching Keyboard Layout..."
	if [[ ($ACTIVELAYOUT = "French - numerical") ]];
	then
		osascript $HOME/Scripts/ChangeLayoutAppleScript.scpt
	fi
elif [[ $(ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*' | grep $KEYBOARD2) = $KEYBOARD2 ]];
	then
  	echo "$KEYBOARD2 detected, switching Keyboard Layout..."
	if [[ ($ACTIVELAYOUT = "French - numerical") ]];
 	then
		osascript $HOME/Scripts/ChangeLayoutAppleScript.scpt
	fi
else
	echo "No Windows Keyboards detected, switching to default Keyboard Layout..."
	if [[ ($ACTIVELAYOUT = "French-PC") ]];
 	then
		osascript $HOME/Scripts/ChangeLayoutAppleScript.scpt
	fi
fi
