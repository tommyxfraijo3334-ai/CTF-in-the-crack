#!/bin/bash


apt-get update -y


apt-get install -y apache2




mkdir /var/www/html/this-is-a-secret-dir


echo "flag{my_first_web_flag_123}" > /var/www/html/this-is-a-secret-dir/user.txt


echo "User-agent: *" > /var/www/html/robots.txt
echo "Disallow: /this-is-a-secret-dir/" >> /var/www/html/robots.txt


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
