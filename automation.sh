s3_bucket=upgrad-arvind-assignment2021
timestamp=$(date '+%d%m%Y-%H%M%S')
name=Arvind
sudo apt update -y

sudo apt install apache2

sudo systemctl status apache2
sudo systemctl reload apache2.service

tar -cvzf /tmp/Arvind-httpd-logs-(timestamp).tar /var/log/apache2/*.log*

sudo apt update
sudo apt install awscli
cp /tmp/${Arvind}-httpd-logs-$(timestamp).tar s3://$(s3_bucket}/${Arvind}-httpd-logs-${timestamp}.tar
