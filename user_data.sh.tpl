# #!/bin/sh
# sudo amazon-linux-extras install docker
# sudo service docker start
# sudo usermod -a -G docker ec2-user

# #Make docker auto-start
# sudo chkconfig docker on

# sudo yum install -y git

# # Install docker-compose
# curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

# #Reboot to verify it all loads fine on its own.
# sudo reboot