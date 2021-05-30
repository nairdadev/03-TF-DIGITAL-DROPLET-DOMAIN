#!/bin/bash

apt update -y
apt install nginx
apt install  git -y
apt install nodejs -y
apt install npm -y

npm install pm2 -g


git clone https://github.com/nairdadev/02-PP-Example-Node.git app
cd app
npm install
pm2 start index.js