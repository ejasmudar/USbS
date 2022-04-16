#!/bin/sh
#Weather

############VARIABLES##############
###################################
WORKDIR="/home/user/USbS/Scripts"


############END VARIABLES##########

cd $WORKDIR

Place=$(gconftool-2 --get /apps/ControlPanel/USbS/Loc)

var_url="http://www.google.com/ig/api?weather=$Place&hl=en"

var_weather_wget=`wget -q $var_url -O -`
var_weather_xml=`echo "$var_weather_wget" | sed 's/<forecast_conditions>.*//'`
var_weather=`echo "$var_weather_xml" | sed 's/></>\n</g'`

# var_date=`echo "$var_weather" | grep -e '<forecast_date' | \
# sed -e 's/<forecast_date data="//' -e 's/"\/>//'`

var_city=`echo "$var_weather" | grep -e '<city' | \
sed -e 's/<city data="//' -e 's/"\/>//'`

var_condition=`echo "$var_weather" | grep -e '<condition' | \
sed -e 's/<condition data="//' -e 's/"\/>//'`

# var_temp_f=`echo "$var_weather" | grep -e '<temp_f' | \
# sed -e 's/<temp_f data="//' -e 's/"\/>//'`

var_temp_c=`echo "$var_weather" | grep -e '<temp_c' | \
sed -e 's/<temp_c data="//' -e 's/"\/>//'`

# var_humidity=`echo "$var_weather" | grep -e '<humidity' | \
# sed -e 's/<humidity data="//' -e 's/"\/>//'`

# var_wind=`echo "$var_weather" | grep -e '<wind' | \
# sed -e 's/<wind_condition data="//' -e 's/"\/>//'`

# echo "Date: $var_date"
echo -e "$var_city \n Condition: $var_condition, Temp: $var_temp_c *C"
