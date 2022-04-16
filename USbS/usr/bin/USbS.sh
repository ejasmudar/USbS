#!/bin/sh
#USbS-Useful Stand by Screen
#Main v 0.1
#Developer:Ejas Mudar

# if [ "x$1" != "x--" ]; then
# $0 -- 1> /dev/null 2> /dev/null &
# exit 0
# fi

while true; do
	n=$(gconftool-2 --get /apps/ControlPanel/USbS/Tint)
	cd /home/user/USbS/
	sh main.sh
	sleep $n
done
