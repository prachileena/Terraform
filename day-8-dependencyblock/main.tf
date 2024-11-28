resource "aws_s3_bucket" "test" {
  bucket = "terraformbuckettttt"
}

resource "aws_instance" "name" {
  ami = "ami-0614680123427b75e"
  instance_type = "t2.micro"
  key_name = "server"
  depends_on = [ aws_s3_bucket.test ]
}