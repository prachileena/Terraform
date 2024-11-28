variable "vpc_name" {
      description = "give the vpc name"
      type = string
      default =""
  
}

variable "public_subnet" {
   description = "give the public subnet" 
   type = string
   default = ""
}

variable "private_subnet"{
    description = "give the private subnet"
    type = string
    default = ""
}
variable "internet_gateway" {
  description = "give the ig"
    type = string
    default = ""
}
 
 variable "pub_route_table" {
   
   description = "give the rote table"
    type = string
    default = ""
   
 }

 variable "private_rt" {
         description = "give the private subnet"
    type = string
    default = ""   
 }

 variable "aws_cidr" {
   description = "give the value of cidr block"
   type = string

   default = ""
   
 }
 variable "public_subnet_cidr" {
      description ="cidr of public subnet"
      type =string
      default = ""
 }
 variable "private_subnet_cidr" {
    description = "cidr of private subnet"
    type = string
    default =""
   
 }
 variable "ami_id" {
  description = "give the ami id here"
  type = string
  default = ""
   
 }
 variable "key_name" {
  description = "key-pair name of ec2 instance"
  type = string
  default = ""
   
 }

 variable "security_group_name" {
  description = "Name for the security group"
  type = string
  default = ""
   
 }

 variable "instance_name"{
  description = "name tag for ec2 instance name"
  type = string
  default = ""
 }

 variable "instance_name2"{
  description = "name tag for private  ec2 instance name"
  type = string
  default = ""
 }

 variable "instance_type" {
  description = "identify the instance type"
  type = string
  default = ""

   
 }
