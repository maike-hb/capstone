#!/bin/bash

# array declaration
declare -A props

file="/home/ec2-user/wordpress.properties"
while IFS='=' read -r key value; do
    props["$key"]="$value"
done < "$file"

# Download completion for wp cli and add it to you search path. Tab two times and you get suggestions for wp cli.
wget https://github.com/wp-cli/wp-cli/raw/main/utils/wp-completion.bash
echo 'source ~/wp-completion.bash' >> /home/ec2-user/.bash_profile
source /home/ec2-user/.bash_profile

echo "start configuring wordpress"
echo ${props["WP_URL"]}
echo ${props["WP_TITLE"]}
echo ${props["WP_ADMIN_USER_NAME"]}
echo ${props["WP_ADMIN_USER_PASS"]}
echo ${props["WP_ADMIN_EMAIL"]}


cd /var/www/html
# configure basics and create an admin user
wp core install --url=${props["WP_URL"]} --title=${props["WP_TITLE"]} --admin_user=${props["WP_ADMIN_USER_NAME"]} --admin_email=${props["WP_ADMIN_EMAIL"]} --admin_password=${props["WP_ADMIN_USER_PASS"]} --skip-email

wp option get siteurl
wp user list

echo "finished configure wordpress"