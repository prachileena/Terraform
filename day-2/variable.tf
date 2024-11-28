variable "ami" {
    description = "give the ami id"
    type = string
    default = "ami-0aebec83a182ea7ea"
}
   variable "type" {
      description = "give the instance type"
      type = string
      default = "t2.micro"
     
   }
     variable"key"{
        description = "give the key pair name"
        type = string
        default = "server"
     }
      