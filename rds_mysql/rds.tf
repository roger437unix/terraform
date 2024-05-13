// https://medium.com/@paulboeck/create-an-aws-rds-instance-with-terraform-e6bb9014dcde

resource "aws_security_group" "mysql-iac" {
  name_prefix = "mysql-iac-"
  ingress {
    from_port   = 0
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql-iac" {
  engine                 = "mysql"
  db_name                = "db_tux"
  identifier             = "mysql-iac"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  publicly_accessible    = true
  storage_encrypted      = false
  username               = var.db-username
  password               = var.db-password
  vpc_security_group_ids = [aws_security_group.mysql-iac.id]
  skip_final_snapshot    = true

  tags = {
    Name = "mysql-db"
  }
}
