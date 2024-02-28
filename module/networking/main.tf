resource "aws_vpc" "hr_app_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "hr_app_vpc"
  }
}

# use data source to get all avalablility zones in region
#data "aws_availability_zones" "available_zones" {}

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs)
  //count             = length(split(",", var.public_subnet_cidrs))
  vpc_id            = aws_vpc.hr_app_vpc.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  //cidr_block        = element(split(",", var.public_subnet_cidrs), count.index)
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet ${count.index + 1}"
    }
  
}



resource "aws_internet_gateway" "hr_app_igw" {
  vpc_id = aws_vpc.hr_app_vpc.id

  tags = {
    Name = "hr_app igw"
  }
}

resource "aws_route_table" "route_1" {
  vpc_id = aws_vpc.hr_app_vpc.id


  tags = {
    Name = "RouteTable"
  }
}

resource "aws_route_table" "route_2" {
  vpc_id = aws_vpc.hr_app_vpc.id

  tags = {
    Name = "RouteTable2"
  }

}


resource "aws_route_table_association" "public_route" {
  count             = length(aws_subnet.public_subnets[*].id)
  subnet_id         = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.route_1.id
}

resource "aws_route_table_association" "route_2" {
  count             = length(aws_subnet.public_subnets[*].id)
  subnet_id         = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id    = aws_route_table.route_2.id
}

resource "aws_route" "route_1" {
  route_table_id         = aws_route_table.route_1.id
  gateway_id             = aws_internet_gateway.hr_app_igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "route_2" {
  route_table_id         = aws_route_table.route_2.id
  gateway_id             = aws_internet_gateway.hr_app_igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# create private subnet
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.hr_app_vpc.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = "PrivateSubnet -${count.index +1}"
  }
}

# create route table for private subnet
resource "aws_route_table" "Private1" {
  vpc_id = aws_vpc.hr_app_vpc.id


  tags = {
    Name = "Private RouteTable1"
  }
}

resource "aws_route_table" "Private2" {
  vpc_id = aws_vpc.hr_app_vpc.id


  tags = {
    Name = "Private RouteTable2"
  }
}

resource "aws_route_table_association" "Private_1" {
  count             = length(aws_subnet.private_subnets[*].id)
  subnet_id         = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id    = aws_route_table.Private1.id
}

resource "aws_route_table_association" "Private_2" {
  count             = length(aws_subnet.private_subnets[*].id)
  subnet_id         = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id    = aws_route_table.Private2.id
}

#create natgateway with eip
resource "aws_eip" "nat" {
  count = length(var.private_subnet_cidrs)
  vpc = true
  tags = {
    Name = "PrivateEip"
  }
}

resource "aws_nat_gateway" "Nat1" {
  count = length(var.private_subnet_cidrs) 
  allocation_id = aws_eip.nat[count.index].id
  subnet_id         = element(aws_subnet.private_subnets[*].id, count.index)
  tags = {
    Name = "PrivateNat"
  }
  
}