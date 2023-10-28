#!/usr/bin /bash

echo "You are about to log into server 212.71.252.11" 
sleep 3s 
ssh root@212.71.252.11

sleep 2s
read -p "create a new user? Y for yes, N for n: " response


if [[  "$response" = "y" || "$response" = "Y" ]]; then

sleep 2s
read  -p "Provide a username:" username
useradd $username


sleep 2s
read  -p "Provide a password:" password
passwd $password

sleep 2s
echo "A user is created successfully"


elif [[  "$response" = "n" || "$response" = "N" ]]; then

sleep 2s
echo "You are logged in as a root user"


sleep 2s
else echo "You have a syntax error. Kindly resolve it." 
fi


#---LAMP installation
default_colour = '\033[0m'
red_colour='\033[0;31m'
green_color='\033[0;32m'
yellow_colour='\033[0;33m'
purple_colour='\33[0;35m'
cyan_colour='\33[0;36m'

#update apt
echo -e "$cyan_colour \n Updating System .. $default_colour"
apt update


#install apache 2
echo -e "$red_colour \n Installing Apache .. $default_color"
apt install apache2

if [$? -eq 0]
then
echo -e "$green_color \n successfully installed apache server .. $default_colour"
sleep 2s

else 
echo -e "$red_colour \n error installing apache server.. $default_colour"
fi


#install mysql server
echo -e "$yellow_colour \n Installing mysql .. $default_colour"
apt install mysql-server

if [ $? -eq 0]
then
echo -e "$green_color \n successfully installed mysql server .. $default_colour"
sleep 2s

else
echo -e "$red_colour \n error installing mysql server.. $default_colour"
fi

#install php
echo -e "$purple_colour \n Installing php .. $default_colour"
apt install --no-install-recommends php8.1

if [ $? -eq 0 ]
then
echo -e "$green_color \n successfully installed php server .. $default_colour"
sleep 2s

else
echo -e "$red_colour \n error installing php server.. $default_colour"
fi


#install php modules
echo -e "$red_colour \n Installing phpmodules .. $default_colour"
apt-get install -y php8.1-cli php8.1-common php8.1-zip php8.1-gd php8.1-curl php8.1-xml php8.1-bcmath

if [ $? -eq 0 ]
then 
echo -e "$purple_color \n successfully installed apache server .. $default_colour"
sleep 2s

else
echo -e "$cyan_colour \n error installing apache server.. $default_colour"
fi



#create php file
cd /var/www/html
touch taiwo.php
echo "<?php phpinfo(); ?>" > taiwo.php
