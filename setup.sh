mkdir -p /root/.mrz/kerja
read -n "Domain Name : "
read domain
sudo apt install stunnel dropbear gcc make cmake build-essential python unzip zip -y
sudo apt install apache2 python3-certbot-apache -y
sudo systemctl start apache2
sudo certbot --apache -e dhiimr93@gmail.com -d $domain
cp /etc/letsencrypt/live/$domain/*.pem /etc/stunnel/
cat /etc/stunnel/{fullchain.pem,privkey.pem} >> /etc/stunnel/cmrz.pem


