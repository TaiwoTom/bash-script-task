#!/usr/bin /bash

echo "You are about to log into server 212.71.252.11" 
sleep 3s
 
ssh root@212.71.252.11 "echo \"You have successfully logged in to the server!\"; echo \"Now create a user\"; echo  \"Provide a username: \"; read name; useradd \$name; passwd \$name; echo \"Welcome \$name!\""


