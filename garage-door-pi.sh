#!/bin/bash
#
# v.1.0 - 27 magio 2016
#
#Inizializziamo la porta gpio di rpi
#
echo "25" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio25/direction


# Get start time
START=$(date +%s)
TIMENOW=`date +%D\ +%T`
prefisso=garage
suffisso=$(date +%Y%m%d-%H%M%S)
nomefile=$prefisso-$suffisso


echo "- $TIMENOW Software restarted!" >> /var/log/porta.log


#
# LOOP 
#

DOOR=0

while :
do

   # Check door

   if [  `cat /sys/class/gpio/gpio25/value` = 0 ]
   then
    if [ $DOOR -gt 0 ]
    then
       TIMENOW=`date +%D\ +%T`
       echo "- $TIMENOW - Porta APERTA"
       echo "- $TIMENOW - Porta APERTA" >> /var/log/porta.log
       #Image from camera
       FILE="/tmp/$nomefile.jpg"
       wget ...
       #Wait
       sleep 5 
       FILE2="/tmp/$nomefile-2.jpg"
       wget ...
      #SEND to telegram
      ....
       #Nuovo stato porta 
       DOOR=0
    fi
   else
    if [ $DOOR -eq 0 ]
    then
       TIMENOW=`date +%D\ +%T`
       echo "- $TIMENOW - Porta CHIUSA"
       echo "- $TIMENOW - Porta CHIUSA" >> /var/log/porta.log
       DOOR=1
       
       #Send to telegram

    fi
   fi

   # rest for a 1 seconds
   sleep 1

done

exit 0
