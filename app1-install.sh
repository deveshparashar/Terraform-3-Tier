#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
sudo echo "<h1>Welcome to Dev_SSH - APP-1</h1> <hr> <br> <h3> this is $(hostname)</h3>" | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(53, 157, 174);"> <h1>Welcome to Dev_ssh - APP-1</h1> <p>Application Load Balancer folder</p> <p>Application Version: V1</p> <hr> <br></body></html>' | sudo tee /var/www/html/app1/index.html
sudo echo " <h3> this is hostname : `hostname` and ip is : `hostname -I` </h3>" >> /var/www/html/app1/index.html
sudo echo  " <hr> <h3> this is inside this path : /var/www/html/app1/  </h3>" >> /var/www/html/app1/index.html


