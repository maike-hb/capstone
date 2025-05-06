#!/bin/bash
dnf update -y
# install httpd
dnf install httpd -y


# install mariadb
dnf install mariadb105 -y

# install wordpress
yum install php php-mysqlnd php-fpm php-xml php-mbstring -y
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/* /var/www/html/

# start httpd
chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/
systemctl start httpd
systemctl enable httpd

cd /var/www/html
cp wp-config-sample.php wp-config.php

# Automate wp-config.php with database credentials
sudo sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '${DB_NAME}' );/" wp-config.php
sudo sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '${DB_USER}' );/" wp-config.php
sudo sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '${DB_PASSWORD}' );/" wp-config.php
sudo sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', '${DB_HOST}' );/" wp-config.php
sudo chmod 644 wp-config.php

echo "userData.sh script executed successfully"