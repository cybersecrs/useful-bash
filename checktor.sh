#!/bin/bash

#  Define Colors
R="\e[0m" #reset
U="\e[4m" #underline
Y="\e[33m" #dark yellow
W="\e[37m" #white

#  Define Output Log File

OUTPUT_LOG=/home/linuxian/scripts/bash/check-tor_log.txt

#  Define Public IP address of server

PUBLIC_IP=$(curl -s https://ipinfo.io/ip)

#  Define Tor Exit-Node IP address of server

TOR_IP=$(torify curl -s https://ipinfo.io/ip)

#  Define Date and Time

DATE=$(date +%m/%d/%Y)
TIME=$(date +%k:%M:%S)
DAY=$(date +%A)

#  Define variable to print lines after every test

UNDERLINE="------------------------------------------------------------"

function normal() {         # positive result in terminal
  echo -e $Y" Everything is normal\n$W Public IP:$R $PUBLIC_IP$R$Y -$W Tor IP:$R $TOR_IP "$R
}


function normal_print() {           # positive output save
  echo -e "Everything is normal\n""Public IP: $PUBLIC_IP - Tor IP: $TOR_IP"
}


function wrong() {              # compromised result in terminal
  echo -e $Y" Something is wrong here!!! Public and Tor IP must not be the same!!!\n$W Public IP:$R $PUBLIC_IP$R$Y -$W Tor IP:$R $TOR_IP "$R
}


function wrong_print() {            # compromised output save
  echo -e "Something is wrong here!!! Tor IP is same as Public IP!!!\n""Public IP: $PUBLIC_IP - Tor IP: $TOR_IP"
}


function error() {          # error with tor service
  echo -e "Looks like Tor service is not running!"
}
 

#  Test tor connection, print output and save log

echo $UNDERLINE

  if [ $PUBLIC_IP != $TOR_IP ]; then
    normal && echo "$DAY | $DATE | $TIME" >> $OUTPUT_LOG && normal_print >> $OUTPUT_LOG && echo $UNDERLINE >> $OUTPUT_LOG
    sleep 1
  elif [ $PUBLIC_IP = $TOR_IP ]; then
    wrong && echo -e "$DAY | $DATE | $TIME" >> $OUTPUT_LOG && wrong_print >> $OUTPUT_LOG && echo $UNDERLINE >> $OUTPUT_LOG
    sleep 1
  else
    error && echo -e "$DAY | $DATE | $TIME" >> $OUTPUT_LOG && error >> $OUTPUT_LOG && echo $UNDERLINE >> $OUTPUT_LOG
  fi

echo $UNDERLINE

exit
