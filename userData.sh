#!/bin/bash
dnf update -y
# install httpd
dnf install httpd -y
echo "<h1>Hello, Maike!</h1>" > /var/www/html/index.html
chown -R apache:apache /var/www/html/
systemctl start httpd
systemctl enable httpd
# install mariadb
dnf install mariadb105 -y