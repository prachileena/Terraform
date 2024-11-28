# Create a VPC
resource "aws_vpc" "dev_local" {
  cidr_block = var.aws_cidr  # Directly use var.aws_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Create a public subnet
resource "aws_subnet" "dev_local" {
  vpc_id = aws_vpc.dev_local.id
  cidr_block = var.public_subnet_cidr  # Use var.public_subnet_cidr directly
  tags = {
    Name = var.public_subnet
  }
}

# Create a private subnet
resource "aws_subnet" "prvt_sub" {
  vpc_id = aws_vpc.dev_local.id
  cidr_block = var.private_subnet_cidr  # Use var.private_subnet_cidr directly
  tags = {
    Name = var.private_subnet
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "dev_local" {
  vpc_id = aws_vpc.dev_local.id
  tags = {
    Name = var.internet_gateway
  }
}

# Create a Route Table and edit
resource "aws_route_table" "dev_rt" {
  vpc_id = aws_vpc.dev_local.id
  tags = {
    Name = var.pub_route_table
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_local.id
  }
}

# Create Route Table Association for Public Subnet
resource "aws_route_table_association" "dev_local" {
  subnet_id      = aws_subnet.dev_local.id
  route_table_id = aws_route_table.dev_rt.id
}

# Create an Elastic IP
resource "aws_eip" "dev_eip" {
  tags = {
    Name = "elastic_ip"
  }
}

# Create a Nat Gateway
resource "aws_nat_gateway" "dev_nat" {
  allocation_id = aws_eip.dev_eip.id
  subnet_id     = aws_subnet.dev_local.id
  tags = {
    Name = "aws_nat"
  }
}

# Create another route table for Nat Gateway
resource "aws_route_table" "prvt_rt" {
  vpc_id = aws_vpc.dev_local.id
  tags = {
    Name = "private_Rt"
  }
}

# Add the Nat Gateway to Route Table
resource "aws_route" "prvt_rt" {
  route_table_id          = aws_route_table.prvt_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.dev_nat.id
}

# Create Route Table Association for Private Subnet
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.prvt_sub.id
  route_table_id = aws_route_table.prvt_rt.id
}

# Create Security Group
resource "aws_security_group" "dev_sg" {
  name   = var.security_group_name
  vpc_id = aws_vpc.dev_local.id
  tags = {
    Name = var.security_group_name
  }

  ingress {
    description = "Allowed"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allowed"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 Instance
resource "aws_instance" "dev-ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.dev_local.id
  vpc_security_group_ids = [aws_security_group.dev_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = var.instance_name
  }
}

# Create a private EC2 Instance
resource "aws_instance" "dev-test" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.prvt_sub.id
  vpc_security_group_ids = [aws_security_group.dev_sg.id]
  associate_public_ip_address = false
  tags = {
    Name = var.instance_name2
  }
}
