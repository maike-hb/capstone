# CAPSTONE PROJECT

during further training

## Visual Studio Code Credentials

$Env:AWS_ACCESS_KEY_ID=""  
$Env:AWS_SECRET_ACCESS_KEY=""  
$Env:AWS_SESSION_TOKEN=""  

## Database
### connect 
mysql -h <DB_ADDRESS> -P 3306 -u admin -p

# Keys
## Terraform output of sensitive data
Output generated keypair wpKeyPair
terraform output -raw privateKey  
terraform output -raw publicKey  
