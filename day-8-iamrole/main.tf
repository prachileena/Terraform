

# IAM Role
resource "aws_iam_role" "my_role" {
  name               = var.iam_role_name
  assume_role_policy = var.assume_role_policy

  tags = {
    Name = var.iam_role_name
  }
}

# IAM User
resource "aws_iam_user" "my_user" {
  name = var.iam_user_name
}

# Attach policy to IAM user
resource "aws_iam_user_policy" "my_user_policy" {
  name   = "my-policy"
  user   = aws_iam_user.my_user.name
  policy = var.policy_document
}

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0614680123427b75e"   # Replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name      = "server" 
  iam_instance_profile = aws_iam_instance_profile.my_instance_profile.name

}

resource "aws_iam_instance_profile" "my_instance_profile" {
  name = "my-instance-profile"
  role = aws_iam_role.my_role.name
}