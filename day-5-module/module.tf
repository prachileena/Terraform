module "aws_bastion" {
source = "../day-5"
  # Pass inputs to the module
  vpc_name             = "dev"
  public_subnet        = "pub_sub"
  private_subnet       = "prvt_sub"
  internet_gateway     =  "my_ig"
  pub_route_table      =  "pub_Rt"
  private_rt           =  "prvt_rt"
  aws_cidr             = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
  ami_id               = "ami-0614680123427b75e"
  key_name             = "server"
  security_group_name  = "dev_sg"
  instance_name        = "projectK"
  instance_type        = "t2.micro"
  instance_name2      = "projectK2"
}

