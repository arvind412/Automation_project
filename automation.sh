#s3 bucket name variable
s3_bucket=upgrad-arvind-assignment2021
#timestamp variable
timestamp=$(date '+%d%m%Y-%H%M%S')
name=Arvind

#update the package
sudo apt update -y
#install apache2 server
sudo apt install apache2
#check the status of httpd job ,reload everytime
sudo systemctl status apache2
sudo systemctl reload apache2.service

#arvhive the file
tar -cvzf /tmp/Arvind-httpd-logs-$($timestamp)}.tar /var/log/apache2/*.log*

#copy tar file to s3 bucket
sudo apt update
sudo apt install awscli
cp /tmp/${Arvind}-httpd-logs-$(timestamp).tar s3://$(s3_bucket}/${Arvind}-httpd-logs-${timestamp}.tar

#check for inventory file and create record
grep "$inventory" inventory.html >> /var/www/html
     rc=$?

     if [[ "$rc" != 0 ]]; then
        echo $Log Type:$Time Created:$Type:$Size >> inventory.html
     else
        echo "inventory file is present"
     fi

(crontab -l 2>/etc/cron.d; echo "55 01 * * * /root/Aumation_project/automation.sh -with args") | crontab -
