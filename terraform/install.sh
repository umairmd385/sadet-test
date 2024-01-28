#!/bin/bash

sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo chkconfig docker on

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


#Installing python3
sudo yum install python3 python3-pip -y
sudo pip3 install gdown
sudo mv /usr/local/bin/gdown /usr/bin
sudo usermod -aG docker ec2-user
sudo chmod 777 /var/run/docker.sock

gdown --fuzzy https://drive.google.com/file/d/1nwIvuVj2vZrMv4p1-6M8T7760ZInuoR0/view?usp=drive_link

sudo docker-compose up -d