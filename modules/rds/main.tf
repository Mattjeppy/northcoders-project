resource "aws_db_instance" "example" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "13.4"
  instance_class       = "db.t2.micro"
  name                 = "exampledb"
  username             = "yourusername"
  password             = "yourpassword"
  parameter_group_name = "default.postgres13" # Adjust as needed
  skip_final_snapshot  = true
  vpc_security_group_ids = module.security_group
  db_subnet_group_name   = var.subnet_group_name
}