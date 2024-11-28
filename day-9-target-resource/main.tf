resource "aws_instance" "dev" {
     ami = "ami-0614680123427b75e"
     instance_type = "t2.micro"
     key_name = "server"
}

resource "aws_s3_bucket" "dependent" {
    bucket = "resourcetarget"
}