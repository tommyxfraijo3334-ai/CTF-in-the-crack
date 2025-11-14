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

# --- CTF Challenge 3: Privilege Escalation (Cron Job) ---

echo "flag{cron_jobs_are_a_classic_!_9432}" > /root/root.txt

chmod 600 /root/root.txt

echo "#!/bin/bash" > /opt/cleanup.sh
echo "# This script is run by root to clear temp files." >> /opt/cleanup.sh
echo "echo 'Cleanup complete.'" >> /opt/cleanup.sh

chmod 777 /opt/cleanup.sh


echo "* * * * * root /opt/cleanup.sh" >> /etc/crontab


# --- CTF Challenge 2: Network Service (FTP) ---


apt-get install -y vsftpd

sed -i 's/anonymous_enable=YES/anonymous_enable=NO/' /etc/vsftpd.conf

# 3. Create the new user with the password from our web clue
useradd -m ftp-user -p $(openssl passwd -1 SuperSecurePass123!)


echo "Sysadmin Note: That /opt/cleanup.sh script keeps breaking." > /home/ftp-user/note.txt
echo "It's set to run as root every minute, so it's a pain to fix!" >> /home/ftp-user/note.txt


systemctl restart vsftpd

# --- End of Challenge 2 ---
