#!/bin/bash
##run in root shell


cat << EOF


 ▄▀▀▄ █      ▄▀▀▀▀▄       ▄▀▀▄ █      ▄▀▀▄ ▀▄      ▄▀▀█▄▄▄▄      ▄▀▀▀█▀▀▄ 
█  █ ▄▀     █      █     █  █ ▄▀     █  █ █ █     ▐  ▄▀   ▐     █    █  ▐ 
▐  █▀▄      █      █     ▐  █▀▄      ▐  █  ▀█       █▄▄▄▄▄      ▐   █     
  █   █     ▀▄    ▄▀       █   █       █   █        █    ▌         █      
▄▀   █        ▀▀▀▀       ▄▀   █      ▄▀   █        ▄▀▄▄▄▄        ▄▀       
█    ▐                   █    ▐      █    ▐        █    ▐       █         
▐                        ▐           ▐             ▐            ▐         


EOF

echo -e "\e[38;2;255;0;0m  Acunetix Configuration Script (Linux) by Kokn3t \e[0m"
echo "___________________________________________________"
echo " "
echo -e "\033[31;7m ----------run this script in ROOT shell----------\e[0m";
echo "___________________________________________________"

##adding configs
echo "127.0.0.1 updates.acunetix.com" >> /etc/hosts
echo "127.0.0.1 erp.acunetix.com" >> /etc/hosts

##installing requirements
echo "__________________________________________________________________________________"
echo " "
echo -e "\033[31;7m ---------------------------------Installing requirements--------------------------\e[0m";
echo "__________________________________________________________________________________"
apt update -y
apt install git -y
apt install wget -y
sudo apt-get install libxdamage1 libgtk-3-0 libasound2 libnss3 libxss1 libx11-xcb1 libxcb-dri3-0 libgbm1 libdrm2 libxshmfence1 -y

echo ""
echo "__________________________________________________________________________________"
echo " "
echo -e "\033[31;7m ----------Installing Acunetix----------You will probably need manaul steps--------\e[0m";
echo "__________________________________________________________________________________"

##Download installer
##cd /root && wget https://-/acunetix_14.6.211220100_x64.sh
cd /root && sudo chmod +x acunetix_14.6.211220100_x64.sh && sudo ./acunetix_14.6.211220100_x64.sh

echo ""
echo "__________________________________________________________________________________"
echo " "
echo -e "\033[31;7m-----------------------Cloning Git Repo-------------------------------------------\e[0m";
echo "__________________________________________________________________________________"
cd /root && git clone https://github.com/Ko-kn3t/acu.git
cp /root/acu/license_info.json /home/acunetix/.acunetix/data/license/license_info.json
cp /root/acu/wa_data.dat /home/acunetix/.acunetix/data/license/wa_data.dat

echo ""
echo "__________________________________________________________________________________"
echo " "
echo -e "\033[31;7m--------------------------Configuring Crontab-------------------------------------\e[0m";
echo "__________________________________________________________________________________"
##cron script
rm /root/license.sh
cd /root && wget https://raw.githubusercontent.com/Ko-kn3t/acu/main/license.sh && chmod +x license.sh

##creating user cronjob
rm /var/spool/cron/crontabs/root
echo "*/1 * * * * /root/license.sh" >> /var/spool/cron/crontabs/root
chmod 600 /var/spool/cron/crontabs/root
service cron reload
service cron restart

echo " "
echo "-----------------------Done---------------------"
echo " "
echo -e "\033[31;7m----------Thanks for using my automation--------\e[0m";
echo -e "\e[38;2;255;0;0m  Please vist https://yourpublicIP:3443/ Don't forget to open ports manually. \e[0m"