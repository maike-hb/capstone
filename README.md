# CAPSTONE PROJECT

during further training

## Database
Not for production use!
This settings are just a case study. Never check in the infos about user name and password of the database!
Remove default value from variable.tf and you will be asked for the value.

### DB connect 
mysql -h <DB_ADDRESS> -P 3306 -u admin -p

# Little Terraform Help

## Terraform output of sensitive data

Output generated keypair wpKeyPair  
terraform output -raw privateKey  
terraform output -raw publicKey  

## Remove Files from terraform state

terraform state list  
terraform state rm <NAME_OF_OBJECT_TO_BE_REMOVED>  

## Check logging of user_data
cat /var/log/cloud-init-output.log

# Wordpress
These installation comes with a mysql, wordpress, php and wordpress cli installation. But you have to configure it. Scripts and examples are in the wordpress folder.