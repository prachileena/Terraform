module "dev" {
  source = "github.com/prachileena/TERRAFORM_PRACTISE/day-5"
  ami = "ami-0614680123427b75e"
  instance_type = "t2.micro"
  key_name = "server"
}