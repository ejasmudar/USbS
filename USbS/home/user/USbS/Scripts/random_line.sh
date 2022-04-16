#!/bin/sh
#Random Quote Generator

############VARIABLES##############
###################################


FILENAME=$(gconftool-2 --get /apps/ControlPanel/USbS/Rndfile)
#Enter just name of the file if in the current working directory or path of the file

LINES=`wc -l $FILENAME | awk '{ print ($FILENAME + 1) }'`
RANDSEED=`date '+%S%M%I'`
echo `cat $FILENAME | awk -v COUNT=$LINES -v SEED=$RANDSEED 'BEGIN { srand(SEED); \
i=int(rand()*COUNT) } FNR==i { print $0 }'`



############END VARIABLES##########



