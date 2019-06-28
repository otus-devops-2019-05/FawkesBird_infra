#!/bin/bash

# Add keys and MongoDB-repository
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

# update apt
sudo apt update

# install MongoDB
sudo apt install -y mongodb-org

# start MongoDB
sudo systemctl start mongod

# enable MongoDB
sudo systemctl enable mongod
