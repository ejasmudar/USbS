#!/bin/sh
#USbS Main
#0.01

WORKDIR="/home/user/USbS/Scripts"
FONT="NokiaPureText-Regular.ttf"
FONT_SIZE=25
FONT_COLOR=$(gconftool-2 --get /apps/ControlPanel/USbS/FColour)

SCRIPT=$(gconftool-2 --get /apps/ControlPanel/USbS/Script)


sh Scripts/$SCRIPT > info.txt

	
	
	

python imager.py $FONT $FONT_SIZE $FONT_COLOR



gconftool --type String --set /desktop/meego/screen_lock/low_power_mode/operator_logo '/home/user/USbS/.USbS_.png'
gconftool --type String --set /desktop/meego/screen_lock/low_power_mode/operator_logo '/home/user/USbS/.USbS.png'