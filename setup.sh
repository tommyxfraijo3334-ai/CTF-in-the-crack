#!/bin/bash


apt-get update -y


apt-get install -y apache2



# --- CTF Challenge 1: Web Source Code Clue ---


mkdir /var/www/html/web-backups

echo "# Admin: Set up a user for file transfers." > /var/www/html/web-backups/vsftpd.conf.bak
echo "# User: ftp-user" >> /var/www/html/web-backups/vsftpd.conf.bak
echo "# Pass: SuperSecurePass123!" >> /var/www/html/web-backups/vsftpd.conf.bak

cat <<EOF > /var/www/html/index.html
<html>
  <body>
    <h1>Welcome to the Company Portal</h1>
    <p>Site is under construction. Please check back later.</p>
    
    </body>
</html>
EOF





# Restart Apache to make sure
systemctl restart apache2

# CTF Challenge 2: Privilege Escalation 


echo "flag{gratz_u_are_root_9921}" > /root/root.txt

chmod 600 /root/root.txt


cp /bin/bash /usr/local/bin/get-root-shell

chmod +s /usr/local/bin/get-root-shell


apt-get install -y vsftpd


sed -i 's/anonymous_enable=NO/anonymous_enable=YES/' /etc/vsftpd.conf


echo "flag{ftp_is_fun_555}" > /srv/ftp/network-flag.txt


systemctl restart vsftpd
