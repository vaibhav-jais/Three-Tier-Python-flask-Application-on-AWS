resource "aws_db_subnet_group" "this" {
  name       = "flask-db-subnet-group"
  subnet_ids = var.db_subnet_ids
  tags       = { Name = "flask-db-subnet-group" }
}

resource "aws_db_instance" "this" {
  identifier             = "flask-db"
  allocated_storage      = 20
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.db_instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.rds_sg_id]
  skip_final_snapshot    = true
  publicly_accessible    = false
  multi_az               = false
  storage_encrypted      = true
  deletion_protection    = false
  tags                   = { Name = "flask-db" }
}
