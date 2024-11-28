module "aws_ec2" {
    source = "../day-5-ex2"
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "server"
    name = "dev-ec2"
}