

# AWS Key Pair
resource "aws_key_pair" "name" {
  key_name   = "devpublic"
  public_key = file("C:\\Users\\SSD\\.ssh\\id_ed25519.pub")  # Use double backslashes in Windows paths
}

# AWS Instance
resource "aws_instance" "dev" {
  ami           = "ami-0614680123427b75e"    # Example AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.name.key_name

  tags = {
    Name = "key-test"
  }
}
