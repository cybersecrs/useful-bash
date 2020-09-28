#!/bin/bash

#================================================================================#
#                          Get Linux System Statistics                           #
#--------------------------------------------------------------------------------#
#                                                                                #
#   *******************                                                          #
#   *                 *                                                          #
#   *   [SYS] Stats   *  ln -s /path/to/systat.sh /bin/systat                    #
#   *                 *                                                          #
#   *******************                                                          #
#                                                                                #
#  ============================================================================  #
#      Version: [1]                                                              #
#  ============================================================================  #
#                                                                                #
#       Author: Linuxander                                                       #
#                                                                                #
#  Description: Get system statistics in Linux Ubuntu:                           #
#                                                                                #
#               - Username                                                       #
#               - Uptime                                                         #
#               - Memory (free, swap)                                            #
#               - CPU Usage                                                      #
#               - Free HD Space                                                  #
#                                                                                #
##################################################################################


#  Define One-Line Output Log

OUTPUT_LOG=~/scripts/bash/stats.txt

#  Define Colors

  R="\e[0m" #reset
  U="\e[4m" #underline
  Y="\e[33m" #yellow
  RED="\e[37m" #light red

#  Format Date and Time

DATE=$(date +%m/%d/%Y)
TIME=$(date +%k:%M:%S)
DAY=$(date +%A)

#  User Logged In

USER=$(whoami)

#  System Uptime

UPTIME_S=$(uptime -s)
UPTIME_P=$(uptime -p)
UPTIME=$(uptime -s && uptime -p)

#  Free Memory

FREE=$(free -m | head -n 2 | tail -n 1 | awk {'print $4'})

#  Free Swap Memory

SWAP=$(free -m | tail -n 1 | gawk {'print $3'})

#  CPU Idle

CPU=$(vmstat 1 2 | sed -n '/[0-9]/p' | sed -n '2p' | gawk '{print $15}')

#  Free Disk Space

SPACE=$(df -h / | awk '{ a = $4 } END { print a }')

#  Define banner to print

  banner() {

    echo ----------------------------------------------------------------------
    echo -e "$RED" DAY: "$R"$DAY "$RED"'\t'DATE: "$R"$DATE "$RED"'\t'TIME: "$R"$TIME"$R"
    echo ----------------------------------------------------------------------
}

#  Define nice-print stats

  print_stats() {

    echo -e "$R"WELCOME:"$R"'\t|\t'"$Y"$USER

    echo -e "$R"UPTIME: "$R"'\t|\t'"$Y"$UPTIME

    echo -e "$R"FREE MEMORY:"$R"'\t|\t'"$Y"$FREE MB

    echo -e "$R"FREE SWAP:"$R"'\t|\t'"$Y"$SWAP MB

    echo -e "$R"CPU IDLE:"$R"'\t|\t'"$Y"$CPU %

    echo -e "$R"DISK SPACE:"$R"'\t|\t'"$Y"$SPACE
}

#  Define One-Line output log

  output() {

    echo "$DATE | $TIME | $USER | $UPTIME_S | $UPTIME_P | $FREE MB | $SWAP MB | $CPU % | $SPACE"
}


#  Execute Functions

  clear && banner           # Print Banner

  print_stats               # Print Stats => output for one-line output only

  output >> $OUTPUT_LOG     # Save One-Line Output


#  Display Desktop Notification

 # ALERT=$(notify-send -u normal "Free Space :  $SPACE   |   CPU USAGE :  $CPU %  |   Free Mem :  $FREE MB") && echo -e $ALERT

