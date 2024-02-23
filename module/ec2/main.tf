
resource "aws_instance" "Hr_App" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_key_name
  vpc_security_group_ids      = [aws_security_group.hr_app_security_group.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  //user_data = file("user_data.sh.tpl")


  tags = {
    Name = "HrApp_Server1"
    Unit = "DEV"
  }
}
# resource "null_resource" "Hr_App-provisioner" {

#     triggers = {
#     public_ip = aws_instance.Hr_App.public_ip
#   }
#     connection {
#     user          = "ec2-user"
#     host          = aws_instance.Hr_App.public_ip
#     private_key   = tls_private_key.rsa.private_key_pem
#     timeout       = "30"
#   }

#     # Copy the key file to instance
#   provisioner "file" {
#     source      = "./"
#     destination = "/tmp"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo yum update -y",
#       "sudo yum install -y git",
#       "sudo amazon-linux-extras install docker -y",
#       "sudo usermod -a -G docker ec2-user",
#       "sudo chkconfig docker on",
#       "sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
#       "sudo chmod +x /usr/local/bin/docker-compose",
#       "sudo yum install pip -y",
#       "sudo pip install --user ansible",
#       "sudo yum -y python3-pip",
#       "sudo yum install python3 -y",
#       "sudo pip3 install boto3",
#       "sudo yum install https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip",
#       "unzip terraform_1.4.6_linux_amd64.zip",
#       "sudo mv terraform /usr/bin",
#       "sudo yum install git java-11-amazon-corretto-devel.x86_64 -y",
#       "sudo yum install -y jenkins java-11-openjdk-devel",
#       "sudo yum -y install wget",
#       "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
#       "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
#       "sudo yum upgrade -y",
#       "sudo yum install jenkins -y",
#       "sudo usermod -aG docker jenkins",
#       "sudo systemctl start jenkins",

#      ]
#     }

#   provisioner "local-exec" {
#     command = "echo '${tls_private_key.rsa.private_key_pem}' >> ${aws_key_pair.Devkey.id}.pem ; chmod 400 ${aws_key_pair.Devkey.id}.pem"
#   }
# }

# # resource "null_resource" "ansible" {
# #   provisioner "local-exec" {
# #     command = "ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i aws_ec2.yml (add key path) -u ec2-user"
# #   }

# #   triggers = {
# #     always_run = timestamp()
# #   }

# #   depends_on = [ aws_instance.Hr_App.public_ip ]
  
# # }
 

# resource "aws_key_pair" "Devkey" {
#   key_name   = "Devkey"
#   public_key = tls_private_key.rsa.public_key_openssh
# }

# # RSA key of size 4096 bits
# resource "tls_private_key" "rsa" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "local_file" "Devkey" {
#   content  = tls_private_key.rsa.private_key_pem
#   filename = "Devkey.pem"
#   file_permission = 0400
# }

# resource "aws_instance" "Hr_App2" {
#   ami                         = var.ec2_ami
#   instance_type               = var.ec2_instance_type
#   key_name                    = aws_key_pair.Devkey.key_name
#   vpc_security_group_ids      = [aws_security_group.hr_app_security_group.id]
#   subnet_id                   = aws_subnet.subnet_1.id
#   associate_public_ip_address = true
#   user_data = file("user_data.sh.tpl")


#   tags = {
#     Name = "HrApp_Server2"
#     Unit = "DEV"
#   }
# }

# resource "null_resource" "Hr_App-provisioner1" {

#     triggers = {
#     public_ip = aws_instance.Hr_App2.public_ip
#   }
#     connection {
#     user          = "ec2-user"
#     host          = aws_instance.Hr_App.public_ip
#     private_key   = tls_private_key.rsa.private_key_pem
#     timeout       = "30"
#   }

#     # Copy the key file to instance
#   provisioner "file" {
#     source      = "./"
#     destination = "/tmp"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo yum update -y",
#       "sudo yum install -y git",
#       "sudo amazon-linux-extras install docker -y",
#       "sudo usermod -a -G docker ec2-user",
#       "sudo chkconfig docker on",
#       "sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
#       "sudo chmod +x /usr/local/bin/docker-compose"

#     ] 
#   }
# }
# resource "aws_instance" "Hr_App3" {
#   ami                         = var.ec2_ami
#   instance_type               = var.ec2_instance_type
#   key_name                    = Devkey1.pem
#   vpc_security_group_ids      = [aws_security_group.hr_app_security_group.id]
#   subnet_id                   = aws_subnet.subnet_1.id
#   associate_public_ip_address = true
#   user_data = file("user_data.sh.tpl")
  
#   tags = {
#     Name = "Monitoring"
#     Unit = "PROD"
#   }

#     provisioner "remote-exec" {
#     inline = [ "docker run -d -p 80:5000 -e POSTGRES_HOST=project.cuzbrlyt8tuq.eu-west-1.rds.amazonaws.com -e POSTGRES_USER=hr_project -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} -e POSTGRES_DATABASE_NAME=postgres -e TO_ADDRESS=mzmazy100@gmail.com  -e SOURCE_ADDRESS=mzmazy100@gmail.com -e AWS_REGION_NAME=eu-west-1 -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} mzmarci/hrapp:v3" ]
#     }
#   connection {
#     type = "ssh"
#     user = "ec2-user"
#     host = self.public_ip
#     private_key = "${file("Devkey1.pem")}"
#   }
# }







# data "aws_caller_identity" "current" {}
# data "aws_region" "current" {}

# resource "aws_vpc" "ade-jenkins-vpc" {
#   cidr_block           = var.vpc_cidr_block
#   enable_dns_support   = "true"
#   enable_dns_hostnames = "true"
#   tags = {
#     Name = "Jenkins_vpc"
#   }
# }

# resource "aws_internet_gateway" "ade-jenkins-vpc-igw" {
#   vpc_id = aws_vpc.ade-jenkins-vpc.id
#   tags = {
#     Name = "Public_internet_gateway"
#   }
# }



# resource "aws_subnet" "ade-subnet-public" {
#   for_each = toset(var.public_subnet)

#   vpc_id                  = aws_vpc.ade-jenkins-vpc.id
#   cidr_block              = each.value
#   availability_zone       = var.availability_zones[each.value]
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "Public_subnet_${each.key}"
#   }
# }

# resource "aws_subnet" "ade-subnet-private" {
#   for_each = toset(var.private_subnet)

#   vpc_id                  = aws_vpc.ade-jenkins-vpc.id
#   cidr_block              = each.value
#   availability_zone       = var.availability_zones[each.value]

#   tags = {
#     Name = "Private_subnet_${each.key}"
#   }
# }

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.ade-jenkins-vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.ade-jenkins-vpc-igw.id
#   }

#   tags = {
#     Name = "Public_route_table"
#   }
# }

# resource "aws_route_table_association" "public" {
#   for_each = toset(var.public_subnet)

#   subnet_id      = aws_subnet.ade-subnet-public[each.value].id
#   route_table_id = aws_route_table.public.id
# }

# flatten(concat)

# /*
# Define a NAT Gateway to enable instances in the private subnet to connect to
# the internet or other AWS services, but prevent the internet from initiating a
# connection with those instances
# */

# resource "aws_eip" "nat_gw" {
#   vpc = true

# }

# resource "aws_nat_gateway" "ade_nat_gw" {
#   allocation_id = aws_eip.nat_gw.id
#   subnet_id     = values(aws_subnet.ade-subnet-public)[0].id
#   depends_on    = [aws_internet_gateway.ade-jenkins-vpc-igw]

#   tags = {
#     Name        = "ade-NAT-gateway"
# }
# }

# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.ade-jenkins-vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.ade_nat_gw.id
#   }
# }

# resource "aws_route_table_association" "private_subnet_association" {
#   for_each = toset(var.private_subnet)

#   subnet_id      = aws_subnet.ade-subnet-private[each.value].id
#   route_table_id = aws_route_table.private_rt.id
# }


