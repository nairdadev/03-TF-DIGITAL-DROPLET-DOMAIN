#!/bin/bash

apt update -y
apt install nginx -y
apt install  git -y
apt install nodejs -y
apt install npm -y

npm install pm2 -g


git clone https://github.com/nairdadev/02-PP-Example-Node.git app
cd app
npm install
pm2 start index.js



cd /etc/nginx/sites-available/

echo -e "server {
    listen 80;
    server_name dominio;

    location / {
        proxy_set_header   X-Forwarded-For $remote_addr;
        proxy_set_header   Host $http_host;
        proxy_pass         http://IP:5000;
    }
}" >> proyecto.conf

sudo ln -s /etc/nginx/sites-available/proyecto.conf /etc/nginx/sites-enabled/

sudo systemctl reload nginx