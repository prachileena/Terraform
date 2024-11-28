resource "aws_db_instance" "dev" {
    allocated_storage = 20
    engine = "mysql"
    engine_version = "8.0.32"
    instance_class = "db.t2.micro"
    username = "admin"
    password = "12345678"
    parameter_group_name = "default.mysql.8.0"
    publicly_accessible = true
    skip_final_snapshot = true

  
}