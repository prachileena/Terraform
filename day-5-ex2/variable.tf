variable "ami" {
    description = "ami value can given"
    type = string
    default =""
  
}
variable "instance_type" {
     description = "instance_type to specify"
     type = string
     default = ""
}

    variable "key_name" {
        description = "key_pair need to specify"
        type = string
        default = ""
      
    }
    variable "name" {
        description ="The name of the ec2 instance"
        default  = ""
      
    }