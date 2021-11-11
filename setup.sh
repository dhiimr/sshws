#!/bin/bash
mrz=/root/.mrz
mkdir -p $mrz
cd $mrz
read -n "Domain Name : "
read domain
sudo apt install stunnel dropbear gcc make cmake build-essential python unzip zip -y
sudo apt install apache2 python3-certbot-apache -y
sudo systemctl start apache2
sudo certbot --apache -e dhiimr93@gmail.com -d $domain
cp /etc/letsencrypt/live/$domain/*.pem /etc/stunnel/
cat /etc/stunnel/{fullchain.pem,privkey.pem} >> /etc/stunnel/cmrz.pem
wget https://github.com/dhiimr/sshws/raw/main/master.zip
unzip master.zip
cd badvpn-master/
mkdir -p build
cd build
cmake .. -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
make install
cd $mrz
systemctl stop apache2
apt purge apache2
wget https://raw.githubusercontent.com/dhiimr/sshws/main/PDirect.py
wget https://raw.githubusercontent.com/dhiimr/sshws/main/svpn.service
mv svpn.service /etc/systemd/system/
wget https://raw.githubusercontent.com/dhiimr/sshws/main/wssh.service
mv wssh.service /etc/systemd/system/
systemctl daemon-reload
systemctl start wssh
systemctl start svpn


