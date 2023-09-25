
resource "aws_db_instance" "db" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class = "db.t3.micro"
  db_name    = var.postgres_database
  identifier = var.postgres_database
  username   = var.postgres_username
  password   = var.postgres_password
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  publicly_accessible = false
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = var.project_name
  }
}