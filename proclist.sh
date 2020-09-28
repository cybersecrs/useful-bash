#!/bin/bash

#================================================================================#
#                          Get Linux Active Processes                            #
#--------------------------------------------------------------------------------#
#                                                                                #
#   *******************                                                          #
#   *                 *                                                          #
#   *   [proc] List   *  ln -s /path/to/proclist.sh /bin/proclist                #
#   *                 *                                                          #
#   *******************                                                          #
#                                                                                #
#  ============================================================================  #
#      Version: [1]                                                              #
#  ============================================================================  #
#                                                                                #
#       Author: Linuxander                                                       #
#                                                                                #
#  Description: Get active proc data in Linux Ubuntu:                            #
#                                                                                #
#               - Without arguments print 10 Highest CPU proc                    #
#               - If argument is given, display proc data                        #
#                                                                                #
#               $ proclist.sh firefox                                            #
#                                                                                #
##################################################################################


#  Default number of processes to show

processes="10"


#  Define 'help' banner

function print_help() {
echo -e "--------------------------------------------------------------"
echo -e " - proclist.sh will print the highest CPU% processes"
echo -e " - proclist.sh firefox - will print firefox processes"
echo -e "--------------------------------------------------------------"
}


  if [ "$1" == "-h" ]; then
    print_help
    exit

  elif [ "$1" == "--help" ]; then
    print_help
    exit

  elif [ "$1" == "" ]; then

    # If first string is empty, print most used processes
    echo "CPU |PID |MEM |START |COMMAND"
    ps aux | awk '{print $3,$2,$4,$9,$11}' | sort -rn | head -n "$processes"
    exit

  else

    # If first argument is passed as string, search processes for that arg
    echo "CPU |PID |MEM |START |COMMAND"
    ps aux | grep "$1"| awk '{print $3,$2,$4,$9,$11}' | sort -rn | head -n "$processes"
  fi


exit
