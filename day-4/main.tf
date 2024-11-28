resource "aws_s3_bucket" "name" {
      bucket = "narshitdevopsss"
}

terraform {
  backend "s3" {
    encrypt = true    
    bucket = "awsbuckettttt"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}