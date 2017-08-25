#!/bin/bash
# doitnow.sh
# Do It Now! v2 - New and improved (maybe)
# Author: n0logic
# Date: 8/25/2017
# Updated: 8/25/2017
# on github @ https://github.com/n0logic/doitnow-v2/
# Reach me via Twitterzz @realn0logic
# or Emailzz via daniel@n0logic.com
# Good day sir/madam!
#

# Lets add some color this time around!
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
BLUE=$ESC_SEQ"34;01m"
MAGENTA=$ESC_SEQ"35;01m"
CYAN=$ESC_SEQ"36;01m"

# git variables - Credit: Neil Mayhew on Stackoverflow 
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

# Function mainmenu - Main Menu, first function called.
splashit(){
while :
do
    clear
    cat<<"EOF"
    
                  dMMMMMMMMMMMx;''lONWMMMMMN0l'''dWMMMMMMMMMMd                           
                  dMMMMMMMMMMO'''..'';clolc,''...'OMMMMMMMMMMd                           
                  dMMMMMMMMMN;'''''''''''''''''''',NMMMMMMMMMd                           
                  dMMMMMMMMMx''''''''''''''''''''''xMMMMMMMMMd                           
                  dMMMMMMMMX,'''''''''''''''''''''',XMMMMMMMMd                           
                  MMMMMMMWl.'''''''''''''''''''''''oWMMMMMMMdd                           
                  dMMMMWWNO''''''''''''''''''''''''',0WWMMMMMd                           
                  l0do:;,'.''''''''''''''''''''''''''',,;coxOl                           
                  ;c,''''''''''''''''''''''''''''''''''''..,c;                           
                  dWWKkkxddlc::::;,,,,,,,,,,,,::::clodxkOXXWMd                           
                  dMKc,,;;:cloooodxxxxxxxxxxxxooddooc;;;lNMMMd                           
                  dNc'''''';cxOOKKKKKKKKKKKKK0OOdc,''''.'xWMMd                           
                  dK;dxxxxxOWMWWMMMMMMMMMMMMMMMWWNkkxxxxolWMMd                           
                  dOkk'..,;;;:cccccooooooccccc:;;;,....;NdNMMd                           
                  d0o0,'''',:cccc:'.''''''',;:ccc;'''''cNlNMMd                           
                  dOc0k''''cNMMMMWK;'''''.oNMMMMMX;''',0xcWMMd                           
                  dO;;0O,.'',lkOOd:''''''''ckOOxc'''':Kx;cWMMd                           
                  dO;',dOko:;''''''',okko,.''''''';okOc''cWMMd                           
                  d0;''',;lNWK0Okkk0WMMMMNOkkkk0KNOc;,'''cWMMd                           
                  dK;''''''OWMMMMMMMMMMMMMMMMMMMMMo''''''lWWMd                           
                  dN:'''''':0WWWMMMMMMMMMMMMMMWWXk;''''''xWWMd                           
                  dWx'''''''';;;::::::::::::::;;;''''''',XWWMd                           
                  dMWx;''''''''''''''''''''''''''''''',cKMMMMd                           
                  dMMWN0o;;;,'''''''''''''''''''',;;cdKMMMMMMd                           
                  .'''.''.............................'''''''.                           


                        __   ___                                 
                      /'__`\/\_ \                   __           
                 ___ /\ \/\ \//\ \     ___      __ /\_\    ___   
               /' _ `\ \ \ \ \\ \ \   / __`\  /'_ `\/\ \  /'___\ 
               /\ \/\ \ \ \_\ \\_\ \_/\ \L\ \/\ \L\ \ \ \/\ \__/ 
               \ \_\ \_\ \____//\____\ \____/\ \____ \ \_\ \____\
                \/_/\/_/\/___/ \/____/\/___/  \/___L\ \/_/\/____/
                                                /\____/          
                                                \_/__/       

Press any key to continue!				Do It Now! v2 - 2017 
EOF
	# Check for root and inform user
	if [ "$EUID" -ne 0 ]
  		then echo -e "Please run as root or sudo with sudo ./doitnow.sh"
  		exit
	fi
	# Check for updates via github
	echo -e "Checking for script updates via GitHub!"
	if [ $LOCAL = $REMOTE ]; then
    	echo "Up-to-date"
	elif [ $LOCAL = $BASE ]; then
    	echo "Updating script and restarting!"
    	git pull
    	/bin/bash doitnow.sh
    exit
	elif [ $REMOTE = $BASE ]; then
    	echo "Newer than GitHub! Proceed with caution!"
	else
    	echo "Diverged"
	fi
    read -n1 -s 
    case "$REPLY" in
     * )  mainmenu     ;;
    esac
    sleep 1
done
}

# The main menu function
mainmenu(){
while :
do
    clear
    cat<<EOF
  n0logic
  ________            ____________     _____   __               ______
  ___  __ \_____      ____  _/_  /_    ___  | / /________      ____  /
  __  / / /  __ \      __  / _  __/    __   |/ /_  __ \_ | /| / /_  / 
  _  /_/ // /_/ /     __/ /  / /_      _  /|  / / /_/ /_ |/ |/ / /_/  
  /_____/ \____/      /___/  \__/      /_/ |_/  \____/____/|__/ (_)   
                                                                    
    ==============================
    Do It Now! v2
    Newly renovated!
    ------------------------------
    Please enter your choice:

    Tools Menu		 (1)
    Software Menu   	 (2)
    System Menu	    	 (3)
    Misc Stuff      	 (4)
    Reboot System   	 (5)
           (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  toolsmenu ;;
    "2")  softwaremenu ;;
    "3")  systemmenu ;;
    "4")  miscmenu ;;
    "5")  g_reboot;;
    "Q")  exit                      ;;
    "q")  exit                      ;;
     * )  echo "invalid option... Try Harder!"     ;;
    esac
    sleep 1
done
}

# toolsmenu - Main menu for Tools
toolsmenu(){
while :
do
    clear
    cat<< "EOF"
n0logic
  ________            ____________     _____   __               ______
  ___  __ \_____      ____  _/_  /_    ___  | / /________      ____  /
  __  / / /  __ \      __  / _  __/    __   |/ /_  __ \_ | /| / /_  / 
  _  /_/ // /_/ /     __/ /  / /_      _  /|  / / /_/ /_ |/ |/ / /_/  
  /_____/ \____/      /___/  \__/      /_/ |_/  \____/____/|__/ (_)   
                                                                    
    ==============================
    Penetration Testing Tools
    ------------------------------
    Please enter your choice:

    enum Script      	(1)
    dirb            	(2)
    nikto            	(3)
    Wireless Tools  	(4)
    Discover Tools   	(5)
    Hydra            	(6)
           (B)ack   (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  enumscript ;;
    "2")  e_dirb ;;
    "3")  e_nikto ;;
    "4")  e_wireless ;;
    "5")  e_discover;;
    "6")  e_hydra;;
    "B")  mainmenu ;;
    "b")  mainmenu ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac
    sleep 1
done
}

# Run the splash screen!
splashit
