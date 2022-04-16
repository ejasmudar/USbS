#!/bin/sh
#Script idea from http://www.badzilla.co.uk/Screenscraping-using-wget-and-Shell-Scripting
# Modified by Ejas Mudar
# email: ejasmudar@gmail.com
# URL to screenscrape

############VARIABLES##############
###################################
WORKDIR="/home/user/USbS/Scripts"
FILENAME="taglines.txt"
#Enter just name of the file if in the current working directory or path of the file

FONT="NokiaPureText-Regular.ttf"
FONT_SIZE=25
FONT_COLOR="#ff00ff"
#Details of font used. Fontname required path if not present in current working directory.


resulthttp='http://m.yahoo.com/w/cricket/scores?pg=results'

# Screenscrape
TEXT= wget -q  -O - $resulthttp | sed 's/.*ALL//' | sed -e 's/Sat.*//g' -e 's/Sun.*//g' -e 's/Mon.*//g' -e 's/Tue.*//g' -e 's/Wed.*//g' -e 's/Thu.*//g' -e 's/Fri.*//g' -e 's/Yesterday.*/\n \n &/g' | sed 's/Match [0-9]*/\n&/g'  | sed 's/<[^>]*>//g;s/^[ \t]*//;' | sed 's/<!--.*//'

echo $TEXT