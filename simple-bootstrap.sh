#!/bin/bash
yum update -y
yum -y install httpd wget cowsay mariadb
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from EC2 $(hostname -f)" > /var/www/html/index.html
echo "This is health for $(hostname -f)" > /var/www/html/health.html
echo "#!/bin/sh" > /etc/update-motd.d/40-cow
echo 'cowsay "Amazon Linux 2 AMI - TraianOTPDemo"' > /etc/update-motd.d/40-cow
chmod 755 /etc/update-motd.d/40-cow
rm /etc/update-motd.d/30-banner
update-motd
