#!/usr/bin/bash

# add things youd like to do after provisioning here

# my_ip=`ip addr show net0 | grep -Po 'inet \K[\d.]+'`
# user_password=`openssl rand -base64 16`
# user="linux"
# sudo useradd -m -s /bin/bash -G sudo linux
# echo "linux:${user_password}" | sudo chpasswd

# sudo sed -i 's/\PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
# sudo sed -i 's/\ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/g' /etc/ssh/sshd_config
# sudo systemctl reload sshd

# echo "Linux password: ${user_password}" >> /var/tmp/.setup
# echo "IP: ${my_ip}" >> /var/tmp/.setup
# cat /var/tmp/.setup

