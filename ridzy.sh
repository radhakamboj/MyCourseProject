#!/bin/bash
# this script generates a reminder message to drink water 
# with some motivational messages and different time zones with weather condition
# it also adds a default css, assets and html document

# Creates the root system variable
root=site_root

# Create a directory
mkdir -p $root

# Create subfolders for css, assets, and js scripts
mkdir -p $root/css
mkdir -p $root/assets 
mkdir -p $root/assets/images 
mkdir -p $root/js 


# Replace this with your OpenWeatherMap API key
API_KEY="36c43138f485b65f70041f865bcac7a2"

# City and country code
CITY="Toronto,CA"
UNIT="metric" # Use "imperial" for Fahrenheit, "metric" for Celsius

# API URL
API_URL="http://api.openweathermap.org/data/2.5/weather?q=$CITY&appid=$API_KEY&units=$UNIT"

# Fetch weather data
weather_data=$(curl -s "$API_URL")

# Extract weather information using 'jq' (install it using 'sudo apt install jq' if you don't have it)
temperature=$(echo "$weather_data" | jq '.main.temp')
weather=$(echo "$weather_data" | jq '.weather[0].main')
description=$(echo "$weather_data" | jq '.weather[0].description')


##############################
# Create our app.css file
touch $root/css/app.css

echo "* {" >> $root/css/app.css
echo "  box-sizing: border-box;" >> $root/css/app.css
echo "  scroll-behavior: smooth;" >> $root/css/app.css
echo "  padding: 0;" >> $root/css/app.css
echo "  margin: 1;" >> $root/css/app.css
echo "}" >> $root/css/app.css
echo "body {" >> $root/css/app.css
echo " background: #CB77EB;" >> $root/css/app.css
echo " width: 100%;" >> $root/css/app.css
echo " height: 100vh;" >> $root/css/app.css
echo "}" >> $root/css/app.css


#add some more css about 15 lines


##############################
# Create our app.js file
touch $root/js/app.js

echo "// your javascript goes here" >> $root/js/app.js

# Get the current time and date
CURRENT_TIME=$(date -Iseconds | cut -c-16)
DAY_OF_WEEK=$(date +"%A")

# Create our index.html file
echo "<p>&nbsp;</p>" >> $root/index.html
echo "<p>&nbsp;</p>" >> $root/index.html
echo "<!DOCTYPE html>" >> $root/index.html
echo " <h1> *** Hello Ridzy, How are you doing today? *** </h1>" >> $root/index.html
echo "<html lang='en'>" >> $root/index.html
echo "<p>&nbsp;</p>" >> $root/index.html
echo "<p>&nbsp;</p>" >> $root/index.html
echo >> $root/index.html # blank line or you can also use <br>

echo "<head>" >> $root/index.html
echo " <meta charset='utf-8'>" >> $root/index.html
echo " <meta name='viewport' content='width=device-width, initial-scale=1.0'>"  >> $root/index.html
echo "<link rel='stylesheet' href='css/app.css>" >> $root/index.html
echo "<title='Drink Water Alarm'>" "</title>" >> $root/index.html
echo "  <link rel='stylesheet' href='css/app.css' />" >> $root/index.html
echo "  <script src='js/app.js'></script>" >> $root/index.html
echo "</head>" >> $root/index.html
echo >> $root/index.html # blank line

echo "<body>" >> $root/index.html
echo "   <h3>Today is <span> $DAY_OF_WEEK</span> <span> $GEORGIAN_DATE</span> </h3>" >> $root/index.html
echo "   <h3>Time is ⌛<span> $CURRENT_TIME</span> </h3>" >> $root/index.html

# Print weather information
echo "<h3> Weather in Toronto, Ontario, Canada: </h3>" >> $root/index.html
echo "<h4> Temperature: $temperature°C </h4>" >> $root/index.html
echo "<h4> Weather: $weather </h4>" >> $root/index.html
echo "<h4> Description: $description </h4>" >> $root/index.html

echo " <p>&nbsp;</p>" >> $root/index.html
echo "  <img src='assets/images/water.png' alt='water' width='400' height='300' />" >> $root/index.html
echo "  <img src='assets/images/countdown.gif' alt='countdown' width='400' height='300' />" >> $root/index.html
echo "  <h1>You are thirsty, Drink Water!</h1>" >> $root/index.html
echo "   <h2>Drink water for healthy lifestyle and glowing skin <span> 👍 </span>!</h2>"  >> $root/index.html
echo "   <h2>Don't Forget to Smile <span>  </span>!</h2>"  >> $root/index.html
echo "</body>" >> $root/index.html
echo "</html>" >> $root/index.html


# Copy the logo into the new site images directory
# cp source destination
cp -r ~/RIDZY_PROJECT_SCRIPT/images/drinkwater.png $root/assets/images/water.png
cp -r ~/RIDZY_PROJECT_SCRIPT/images/countdown.gif $root/assets/images/countdown.gif
# cp -r ~/RIDZY_PROJECT_SCRIPT/images $root/assets/images   : with this code delete the code from line 14


# Print success message
echo "Job Done successfully!"

#opens our new project root folder in VS Code
# code $root