# variables.tf

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "iam_role_name" {
  description = "IAM Role Name"
  default     = "my-role"
}

variable "iam_user_name" {
  description = "IAM User Name"
  default     = "my-iam-user"
}

variable "policy_document" {
  description = "Policy document for user"
  type        = string
  default     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["s3:ListBucket", "s3:GetObject"],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::my-bucket-name",
        "arn:aws:s3:::my-bucket-name/*"
      ]
    }
  ]
}
POLICY
}

variable "assume_role_policy" {
  description = "Assume Role Policy for IAM Role"
  type        = string
  default     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
POLICY
}
