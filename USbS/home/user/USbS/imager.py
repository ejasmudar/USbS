#UsefulStandbyScreen v 0.1
#Add useful info in Standby Screen
#Developer:Ejas Mudar (ejasmudar@gmail.com)

#!/usr/bin/python

import os, textwrap, sys
import Image, ImageDraw, ImageOps, ImageFont
import PIL

############VARIABLES##############
###################################
# for arg in sys.argv: 
    # print arg

FONT=sys.argv[1]
FONT_SIZE=int(sys.argv[2])
FONT_COLOR = sys.argv[3]

# FONT="NokiaPureText-Regular.ttf"
# FONT_SIZE=25
# FONT_COLOR="#ff00ff"

WORKDIR="/home/user/USbS/Scripts"

WRAP_WIDTH=34
#No of charecters for word wrapping. 

IMGWIDTH=450
IMGHEIGHT=200
#Boundary dimensions of the quote

##################################
#####END OF VARIABLE LIST#########

##################################
#############CODE#################

########Writing to Image##########

x=Image.new("RGBA", (IMGWIDTH,IMGHEIGHT),(0,0,0))
y_text = 0
font = ImageFont.truetype(FONT,FONT_SIZE)

for line in open('info.txt','r').readlines():

	text = line.decode('utf-8')

	(width, height) = font.getsize(text)

	w, h = x.size
	draw = ImageDraw.Draw(x)


	#Text Wrapping
	lines = textwrap.wrap(text, width=WRAP_WIDTH)
	for line in lines:
		(width, height) = font.getsize(line)
		draw.text(((w - width)/2, y_text), line, font=font, fill=FONT_COLOR)
		y_text+=height
	
#Saving Image
# print "SAVING...."


x.save('/home/user/USbS/.USbS.png')
# x.save('test.png')
