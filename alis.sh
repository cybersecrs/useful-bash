#!/bin/bash
#
#   ALIS Project - v0.1.0
#
# ================================================================================
#
# - ALIS project is BASH script created to automate
#   process of software installation in Ubuntu (based) Linux Systems
#
# - Please read Software Licenses before installation!
#
# - ALIS is still in development stage, feel free to contribute
#
# ================================================================================


##### Define Colors

RS="\e[0m" #reset
U="\e[4m" #underline
Y="\e[33m" #yellow
W="\e[37m" #white
R="\e[31m" #red


##### Define Date and Time

DATE=$(date +%m/%d/%Y)
TIME=$(date +%k:%M:%S)
DAY=$(date +%A)


##### Define Help Functions

function print_help() {
    echo -e """$Y
================================================================================
$ sudo alis.sh
================================================================================
"""$R
}

function print_help_about() {
    echo -e """$Y
================================================================================
- ALIS is set of scripts created to automate software installation process
  in Ubuntu based Linux distro. You must run it as root user.
================================================================================
"""$RS
}


#  Get Help

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    clear; print_help
elif [ "$1" == "-hh" ] || [ "$1" == "--help-about" ]; then
    clear; print_help_about
fi


#  Check Root Access

if [ $(id -u) != "0" ]; then
    echo -e "$W"" You must have root access to run this script!\n"$RS" >> [ sudo ./alis.sh ] <<"
    sleep 1
    exit
fi


#  Update Sources List

    echo "Started at: "$DAY" | "$DATE" | "$TIME"" >output.txt
    echo -e -n "$W""Updating Sources List ...... ""$RS"
    echo -e "Done!"; sleep 1; clear; sleep 1


#  Define Install Funtions

function install_tor() {
  if command -v tor >/dev/null 2>&1; then
    echo -e "$R"" * Tor already installed !""$RS"; else
    echo -e -n "$W"" > Installing Tor ...... ""$RS"
    apt install tor -y >/dev/null 2>&1;     # TODO: Auto-Config Hidden Service
    echo -e "Done!";
  fi
}

function install_firefox() {
  if command -v firefox >/dev/null 2>&1; then
    echo -e "$R"" * Firefox already installed !""$RS"; else
    echo -e -n "$W"" > Installing Firefox ...... ""$RS"
    apt install firefox -y >/dev/null 2>&1;
    echo -e "Done!";
  fi
}

function install_chromium() {
  if command -v chromium-browser >/dev/null 2>&1; then
    echo -e "$R"" * Chromium already installed !""$RS"; else
    echo -e -n "$W"" > Installing Chromium ...... ""$RS"
    apt install chromium -y >/dev/null 2>&1;
    echo -e "Done!";
  fi
}

function install_proxychains() {
  if command -v proxychains >/dev/null 2>&1; then
    echo -e "$R"" * Proxychains already installed !""$RS"; else
    echo -e -n "$W"" > Installing Proxychains ...... ""$RS"
    apt install Proxychains -y >/dev/null 2>&1;     # TODO: Auto-Config to use Tor
    echo -e "Done!";
  fi
}

function install_openpgpapplet() {
  if command -v openpgp-applet >/dev/null 2>&1; then
    echo -e "$R"" * OpenPGP Applet already installed !""$RS"; else
    echo -e -n "$W"" > Installing OpenPGP Applet ...... ""$RS"
    apt install openpgp-applet -y >/dev/null 2>&1;     # TODO: Auto Key Generation
    echo -e "Done!";
  fi
}

function install_filezilla() {
  if command -v filezilla >/dev/null 2>&1; then
    echo -e "$R"" * Filezilla already installed !""$RS"; else
    echo -e -n "$W"" > Installing Filezilla ...... ""$RS"
    apt install filezilla -y >/dev/null 2>&1;   
    echo -e "Done!";
  fi
}

function install_macchanger() {
  if command -v macchanger >/dev/null 2>&1; then
    echo -e "$R"" * Macchanger already installed !""$RS"; else
    echo -e -n "$W"" > Installing Macchanger ...... ""$RS"
    apt install macchanger -y >/dev/null 2>&1;      # TODO: Option to add CronJob
    echo -e "Done!";
  fi
}

function install_onionshare() {
  if command -v onionshare >/dev/null 2>&1; then
    echo -e "$R"" * OnionShare already installed !""$RS"; else
    echo -e -n "$W"" > Installing OnionShare ...... "
    apt install onionshare -y >/dev/null 2>&1;   
    echo -e "Done!";
  fi
}

function install_transmission() {
  if command -v transmission >/dev/null 2>&1; then
    echo -e "$R"" * Transmission already installed !""$RS"; else
    echo -e -n "$W"" > Installing Transmission ...... "
    apt install transmission -y >/dev/null 2>&1;   
    echo -e "Done!";
  fi
}

function install_mat() {
  if command -v mat >/dev/null 2>&1; then
    echo -e "$R"" * MAT already installed !"; else
    echo -e -n "$W"" > Installing MAT ...... ""$RS"
    apt install mat -y >/dev/null 2>&1;   
    echo -e "Done!";
  fi
}

function install_gimp() {
  if command -v gimp >/dev/null 2>&1; then
    echo -e "$R"" * Gimp already installed !""$RS"; else
    echo -e -n "$W"" > Installing Gimp ...... ""$RS"
    apt install gimp -y >/dev/null 2>&1;
    echo -e "Done!";
  fi
}

function install_wireshark() {
  if command -v wireshark >/dev/null 2>&1; then
    echo -e "$R"" * Wireshark already installed !""$RS"; else
    echo -e "$W"" > Preparing to install Wireshark ...... ""$RS" && sleep 1 && clear
    sudo apt install wireshark >/dev/null 2>&1;
  fi
}

function install_nmap() {
  if command -v nmap >/dev/null 2>&1; then
    echo -e "$R"" * Nmap already installed !""$RS"; else
    echo -e "$W"" > Preparing to install Nmap ...... ""$RS" && sleep 1 && clear
    sudo apt install nmap >/dev/null 2>&1
  fi
}

function install_sqlmap() {
  if command -v sqlmap >/dev/null 2>&1; then
    echo -e "$R"" * SQLmap already installed !""$RS"; else
    echo -e "$W"" > Preparing to install Nmap ...... ""$RS" && sleep 1 && clear
    sudo apt install sqlmap-dev >/dev/null 2>&1
  fi
}

#  Choose Software to Install

echo -e -n "$Y""Do you want to install Tor? (y/n): ""$RS"
    read tor_Answer

echo -e -n "$Y""Do you want to install Firefox? (y/n): ""$RS"
    read firefox_Answer

echo -e -n "$Y""Do you want to install Chromium? (y/n): ""$RS"
    read chromium_Answer

echo -e -n "$Y""Do you want to install Proxychains? (y/n): ""$RS"
    read proxychains_Answer

echo -e -n "$Y""Do you want to install OpenPGP Applet? (y/n): ""$RS"
    read openpgpapplet_Answer

echo -e -n "$Y""Do you want to install Filezilla? (y/n): ""$RS"
    read filezilla_Answer

echo -e -n "$Y""Do you want to install Macchanger? (y/n): ""$RS"
    read macchanger_Answer

echo -e -n "$Y""Do you want to install OnionShare? (y/n): ""$RS"
    read onionshare_Answer

echo -e -n "$Y""Do you want to install Transmission (torrent)? (y/n): ""$RS"
    read transmission_Answer

echo -e -n "$Y""Do you want to install MAT? (y/n): ""$RS"
    read mat_Answer

echo -e -n "$Y""Do you want to install Gimp? (y/n): ""$RS"
    read gimp_Answer

echo -e -n "$Y""Do you want to install Wireshark? (y/n): ""$RS"
    read wireshark_Answer

echo -e -n "$Y""Do you want to install Nmap? (y/n): ""$RS"
    read nmap_Answer

echo -e -n "$Y""Do you want to install SQLmap? (y/n): ""$RS"
    read sqlmap_Answer


#  Start Installation Process

if [ "$tor_Answer" == "y" ] || [ "$tor_Answer" == "Y" ]; then
    install_tor; else 
    sleep 0.5
fi

if [ "$firefox_Answer" == "y" ] || [ "$firefox_Answer" == "Y" ]; then
    install_firefox; else
    sleep 0.5
fi

if [ "$chromium_Answer" == "y" ] || [ "$chromium_Answer" == "Y" ]; then
    install_chromium; else
    sleep 0.5
fi

if [ "$proxychains_Answer" == "y" ] || [ "$proxychains_Answer" == "Y" ]; then
    install_proxychains; else 
    sleep 0.5
    fi

if [ "$openpgpapplet_Answer" == "y" ] || [ "$openpgpapplet_Answer" == "Y" ]; then
    install_openpgpapplet; else
    sleep 0.5
    fi

if [ "$filezilla_Answer" == "y" ] || [ "$filezilla_Answer" == "Y" ]; then
    install_filezilla; else
    sleep 0.5
    fi

if [ "$macchanger_Answer" == "y" ] || [ "$macchanger_Answer" == "Y" ]; then
    install_macchanger; else 
    sleep 0.5
fi

if [ "$onionshare_Answer" == "y" ] || [ "$onionshare_Answer" == "Y" ]; then
    install_onionshare; else 
    sleep 0.5
fi

if [ "$mat_Answer" == "y" ] || [ "$mat_Answer" == "Y" ]; then
    install_mat; else 
    sleep 0.5
fi

if [ "$gimp_Answer" == "y" ] || [ "$gimp_Answer" == "Y" ]; then
    install_gimp; else 
    sleep 0.5
fi

if [ "$wireshark_Answer" == "y" ] || [ "$wireshark_Answer" == "Y" ]; then
    install_wireshark; else 
    sleep 0.5
fi

if [ "$nmap_Answer" == "y" ] || [ "$nmap_Answer" == "Y" ]; then
    install_nmap; else 
    sleep 0.5
fi

if [ "$sqlmap_Answer" == "y" ] || [ "$sqlmap_Answer" == "Y" ]; then
    install_sqlmap; else 
    sleep 0.5
fi

echo -e "\n Finished at: "$DAY" | "$DATE" | "$TIME""
echo -e "================================================================================"
