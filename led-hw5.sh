#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone.

#The following code was Modified to accept 2 new arguments, and blink the LED the inputed amount of times

#Example Invocation: ./led-hw5.sh blink 5

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

#Arguments blink and an integer n

# Example bash function
function removeTrigger
{
	  echo "none" >> "$LED3_PATH/trigger"
  }


#blink arg = $1
#n integer = $2
counter=0
blinkCommand=$1 #the blink command you type before the 2nd argument
blinkCOUNT=$2 #blinkCOUNT is the amount of times the user wants to blink the LED

echo "Starting the LED Bash Script"
        echo "The LED command that was passed is blink"
	        echo "Blinking the LED $blinkCOUNT times"

while [ $counter -lt $blinkCOUNT ]; #while 

do
	echo "1" >> "$LED3_PATH/brightness"
	sleep 1
	echo "0" >> "$LED3_PATH/brightness"
	sleep 1
	counter=$((counter+1))
	echo "Blink $counter"
	if [ $counter -eq $blinkCOUNT ];
	then
		echo "End of Bash Script"
		fi
done

