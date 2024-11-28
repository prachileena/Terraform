
resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  for_each      = toset(var.sandboxes)
  ##subnet_id = var.subnet_id
#   count = length(var.sandboxes)
  tags = {
    Name = each.value # for a set, each.value and each.key is the same
  }
}

variable "sandboxes" {
  type    = list(string)
  default = ["testt","dev2"]
}

variable "ami" {
    type = string
    default = "ami-0614680123427b75e"
  
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}