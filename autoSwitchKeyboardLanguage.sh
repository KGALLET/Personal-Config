#!/bin/bash

ACTIVELAYOUT="$(osascript $HOME/Scripts/GetInputSource.scpt)"
KEYBOARD1=Mini\ Keyboard
#KEYBOARD2=

if [[ $(ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*'  | grep "Mini Keyboard") = $KEYBOARD1 ]]; 
	then
	echo "Windows keyboard(s) detected, switching Keyboard Layout..."
	if [[ ($ACTIVELAYOUT = "French - numerical") ]];
	then
		osascript $HOME/Scripts/ChangeLayoutAppleScript.scpt
	fi
elif [[ $(ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*'  | grep "Mini Keyboard") != $KEYBOARD1 ]];
	then
  	echo "No Windows keyboard detected, switching to default Keyboard Layout..."
	if [[ ($ACTIVELAYOUT = "French-PC") ]];
 	then 
		osascript $HOME/Scripts/ChangeLayoutAppleScript.scpt
	fi
fi
