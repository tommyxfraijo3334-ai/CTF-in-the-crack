#!/bin/bash

# Update the box
apt-get update -y

# Install Apache
apt-get install -y apache2

# --- This is your vulnerability ---

# 1. Create a "hidden" directory
mkdir /var/www/html/this-is-a-secret-dir

# 2. Create the user flag
echo "flag{my_first_web_flag_123}" > /var/www/html/this-is-a-secret-dir/user.txt

# 3. Create the robots.txt file to give the clue
echo "User-agent: *" > /var/www/html/robots.txt
echo "Disallow: /this-is-a-secret-dir/" >> /var/www/html/robots.txt

# --- End of vulnerability ---

# Restart Apache to make sure
systemctl restart apache2
