#!/bin/bash

#================================================================================#
#                         Test Internet Connection Speed                         #
#--------------------------------------------------------------------------------#
#                                                                                #
#   ********************                                                         #
#   *                  *                                                         #
#   *   [SpeeD] Test   *  wrapper for speedtest-cli                              #
#   *                  *                                                         #
#   ********************                                                         #
#                                                                                #
#  ============================================================================  #
#      Version: [1]                                                              #
#  ============================================================================  #
#                                                                                #
#       Author: Linuxander                                                       #
#                                                                                #
#  Description: Simple Bash script to test internet connection speed             #
#               Run with 'torify' to test tor connection speed                   #
#               Use speedtest.net over https to check down/up speed              #
#               Connection data pretty-print                                     #
#                                                                                #
#      ====================================================================      #
#                       https://www.github.com/cybersecrs                        #
#      ====================================================================      #
#                                                                                #
##################################################################################


#  Define Output Logs

  TEMP_LOG=~/speedtest_tmp.txt
  OUTPUT_LOG=~/speedtest_log.txt


#  Define Colors

  R="\e[0m" #reset
  U="\e[4m" #underline
  Y="\e[33m" #yellow
  RED="\e[37m" #light red


#  Format Date and Time

  DATE=$(date +%m/%d/%Y)
  TIME=$(date +%k:%M:%S)
  DAY=$(date +%A)


#  Get IP and Test Speed

function speed_test() {
  clear && echo -e "$Y""\nTesting Internet Connection Speed\n" && sleep 0.3
  echo -e "$DATE\t$TIME\n""$R"
  echo " $(curl ipinfo.io/ip 2>/dev/null)"; echo
  speedtest --secure > $TEMP_LOG
  cat $TEMP_LOG >> $OUTPUT_LOG
  echo -e "\n==========================================================\n" >> $OUTPUT_LOG
  show_output
}


#  Functions Show Output

function show_output () {
  echo -e "$Y""==========================================================""$R"
    cat $TEMP_LOG | fgrep Download | awk {'print $1 " | " $2 " | "$3'}
    cat $TEMP_LOG | fgrep Upload | awk {'print $1 "   | " $2 " | "$3'}
  echo -e "$Y""==========================================================\n""$R"
}

#                                                           END OF DEFINITIONS
#================================================================================#

#  Execute

  if !command -v speedtest; then
    sudo apt install -y speedtest-cli
  fi

  speed_test
