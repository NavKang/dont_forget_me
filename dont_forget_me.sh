#!/bin/bash


# Colours
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the colour after that
clear='\033[0m'


echo -e "\033[1;31m
    ,---,                                                 
  .'  .' \`\\                                               
,---.'     \\    ,---.     ,---.         ,----,            
|   |  .\`\\  |  '   ,'\\   '   ,'\\      .'   .\`|            
:   : |  '  | /   /   | /   /   |  .'   .'  .'      .--,  
|   ' '  ;  :.   ; ,. :.   ; ,. :,---, '   ./     /_ ./|  
'   | ;  .  |'   | |: :'   | |: :;   | .'  /   , ' , ' :  
|   | :  |  ''   | .; :'   | .; :\`---' /  ;--,/___/ \\: |  
'   : | /  ; |   :    ||   :    |  /  /  / .\`| .  \\  ' |  
|   | '\` ,/   \\   \\  /  \\   \\  / ./__;     .'   \\  ;   :  
;   :  .'      \`----'    \`----'  ;   |  .'       \\  \\  ;  
|   ,.'                          \`---'            :  \\  \\ 
'---'                                              \\  ' ; 
                                                    \`--\`  
\033[0m"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "            Doozys Don't Forget Me Tool"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo
echo
echo -e "\033[1;31mSystem information:\033[0m"
uname -a
echo
echo -e "\033[0;32mNote: Please check Google for any exploits\033[0m"
echo
echo -e "\033[0;32m-------------------------------------------------------------\033[0m"
echo

echo -e "\033[1;32mList of setuid files:\033[0m"
setuid_files=$(find / -perm -u=s -type f 2>/dev/null)
if [ -z "$setuid_files" ]; then
  echo "No setuid files found."
else
  echo "$setuid_files"
fi
echo
echo -e "\033[0;32mNote: Check out GTFObins\033[0m"
echo
echo -e "\033[0;32m-------------------------------------------------------------\033[0m"
echo
echo -e "\033[1;33mCapabilities of files in /:\033[0m"
capabilities=$(getcap -r / 2>/dev/null)
if [ -z "$capabilities" ]; then
  echo "No capabilities found."
else
  echo "$capabilities"
fi
echo
echo -e "\033[0;32m-------------------------------------------------------------\033[0m"
echo
echo -e "\033[1;33mReadable files in home:\033[0m"
readable=$(find /home -readable 2>/dev/null)
if [ -z "$readable" ]; then
  echo "No readable files found."
else
  echo "$readable"
fi
echo
echo -e "\033[0;32mNote: Loads of goodies to be found here\033[0m"
echo
echo -e "\033[0;32m-------------------------------------------------------------\033[0m"
echo
echo -e "\033[1;33mContents of crontab:\033[0m"
crontab=$(cat /etc/crontab)
if [ -z "$crontab" ]; then
  echo "No crontab found."
else
  echo "$crontab"
fi
echo
echo -e "\033[0;32mNote: Any scripts or zipped files ?\033[0m"
echo
echo -e "\033[0;32m-------------------------------------------------------------\033[0m"
echo

echo -e "\033[1;34mList of id_rsa files:\033[0m"
id_rsa_files=$(find / -name id_rsa 2>/dev/null)
if [ -z "$id_rsa_files" ]; then
  echo "No id_rsa files found."
else
  echo "$id_rsa_files"
fi
echo
echo -e "\033[0;32mNote: Can we nab the id_rsa and log in via ssh\033[0m"
echo
echo -e "\033[0;32m-------------------------------------------------------------\033[0m"
echo

echo -e "\033[1;35mList of .bash_history files:\033[0m"
bash_history_files=$(find / -name .bash_history 2>/dev/null)
if [ -z "$bash_history_files" ]; then
  echo "No .bash_history files found."
else
  echo "$bash_history_files"
fi
echo
echo -e "\033[0;32mNote: You never know what you may find\033[0m"
echo
echo -e "\033[0;32m-------------------------------------------------------------\033[0m"
echo

echo -e "\033[1;36mList of .mysql_history files:\033[0m"
mysql_history_files=$(find / -name .mysql_history 2>/dev/null)
if [ -z "$mysql_history_files" ]; then
  echo "No .mysql_history files found."
else
  echo "$mysql_history_files"
fi
echo
echo -e "\033[0;32mNote: A second - you may never know what you find\033[0m"
echo
echo -e "\033[0;32m-------------------------------------------------------------\033[0m"
echo

echo -e "\033[1;37mList of wp-config.php files:\033[0m"
wp_config_files=$(find / -name wp-config.php 2>/dev/null)
if [ -z "$wp_config_files" ]; then
  echo "No wp-config.php files found."
else
  echo "$wp_config_files"
fi
echo
echo -e "\033[0;32mNote: Any credentials here?\033[0m"
echo
echo -e "\033[0;32m-------------------------------------------------------------\033[0m"
echo

echo -e "\033[1;38mSudo permissions:\033[0m"
sudo -l &> /dev/null
if [ $? -ne 0 ]; then
  echo "Password is required."
  read -s -p "Password: " password
  echo ""
  echo $password | sudo -S -l &> /dev/null
  if [ $? -ne 0 ]; then
    echo "Incorrect password."
  else
    sudo -l
  fi
else
  sudo -l
fi
