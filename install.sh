#!/bin/bash
# Init/Start script
FILE="/tmp/out.$$"
GREP="/bin/grep"
#....
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
	   echo "This script must be run as root" 1>&2
	      exit 1
fi

apt-get update -y
apt-get install nginx openssl supervisor wget -y
wget https://raw.githubusercontent.com/NyankoLux/az/main/nginx-default -O /etc/nginx/sites-enabled/default
wget https://raw.githubusercontent.com/NyankoLux/az/main/oauth2proxy.conf -O /etc/supervisor/conf.d/oauth2proxy.conf
wget https://raw.githubusercontent.com/NyankoLux/az/main/template.conf -O /etc/nginx/template.conf

openssl req -new -nodes -x509 -out /etc/nginx/server.crt -keyout /etc/nginx/server.key -reqexts v3_req -config /etc/nginx/template.conf

adduser --disabled-password --shell /bin/false --gecos "" oauth2_proxy

mkdir -p /opt/oauth2_proxy

wget https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v7.5.1/oauth2-proxy-v7.5.1.linux-amd64.tar.gz -O /opt/oauth2_proxy/proxy.tar.gz

tar -xvf /opt/oauth2_proxy/proxy.tar.gz --strip-components=1 -C /opt/oauth2_proxy

rm -f /opt/oauth2_proxy/proxy.tar.gz


