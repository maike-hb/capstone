#!/bin/bash
dnf update -y
# install httpd
dnf install httpd -y


# install mariadb
dnf install mariadb105 -y

# install wordpress and php packages
dnf install php php-mysqlnd php-fpm php-xml php-mbstring -y
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/* /var/www/html/

# install wordpress cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


# start httpd
chown -R ec2-user:apache /var/www/html
systemctl start httpd
systemctl enable httpd


# Wordpress configuration
echo "Start WordPress configuration"
cd /var/www/html
# Automate wp-config.php with database credentials
cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/${DB_NAME}/" wp-config.php
sed -i "s/username_here/${DB_USER}/" wp-config.php
sed -i "s/password_here/${DB_PASSWORD}/" wp-config.php
sed -i "s/localhost/${DB_HOST}/" wp-config.php

find /var/www/html -type f -exec chmod 644 {} \;
find /var/www/html -type d -exec chmod 755 {} \;

echo "userData.sh script executed successfully"