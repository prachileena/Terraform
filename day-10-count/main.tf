resource "aws_instance" "dev" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "server"
    #count = 3
    count = length(var.sandboxes)
    tags = {
      #Name ="dev-ec2"
       Name = var.sandboxes[count.index]
    }
    }
  
variable "sandboxes" {
  type    = list(string)
  default = [ "dev", "test","prod"]
}

