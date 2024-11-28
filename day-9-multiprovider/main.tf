#Provider1 for ap-south-1 (default provider)

provider "aws" {
  region = "ap-south-1"
}

#another provider alias

provider "aws" {
  region = "us-east-1"
  alias = "puri"
}

resource "aws_s3_bucket" "test" {
     bucket = "terraformresources"

}

resource "aws_s3_bucket" "test2" {
    bucket = "terraform2ndregion"
    provider = aws.puri
}