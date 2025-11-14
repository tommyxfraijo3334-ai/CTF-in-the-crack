#!/bin/bash


apt-get update -y


apt-get install -y apache2



# --- CTF Challenge 1: Web Source Code Clue ---


mkdir /var/www/html/web-backups

echo "# Admin: Set up a user for file transfers." > /var/www/html/web-backups/vsftpd.conf.bak
echo "# User: ftp-user" >> /var/www/html/web-backups/vsftpd.conf.bak
echo "# Pass: SuperSecurePass123!" >> /var/www/html/web-backups/vsftpd.conf.bak

# 3. Create a custom index.html file with a hidden clue in the source code.
#    The 'cat <<EOF' command is a clean way to write a multi-line file.
cat <<EOF > /var/www/html/index.html
<html>
  <body>
    <h1>Welcome to the Company Portal</h1>
    <p>Site is under construction. Please check back later.</p>
    
    <img src="company-logo.jpg">
    
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



# --- CTF Challenge 4: Steganography (Forensics) ---

apt-get install -y steghide wget


echo "Here's a hint for the root flag:" > /tmp/hint.txt
echo "The cron script is at /opt/cleanup.sh" >> /tmp/hint.txt

wget -O /tmp/logo.jpg https://upload.wikimedia.org/wikipedia/commons/a/a9/Example.jpg


steghide embed -cf /tmp/logo.jpg -ef /tmp/hint.txt -p "password" -f

# 5. Move the final stego-image to the web server
mv /tmp/logo.jpg /var/www/html/company-logo.jpg

# 6. Clean up our temp files
rm /tmp/hint.txt

# --- End of Challenge 4 ---


# --- CTF Challenge 5: "Packet Capture" (Forensics) ---


echo "flag{analyzing_packets_is_key_101}" > /tmp/traffic.pcap

# --- End of Challenge 5 ---
