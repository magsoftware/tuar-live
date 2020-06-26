provider "aws" {
  region = "eu-central-1"
}


terraform {
  backend "s3" {
    key    = "stage/data-stores/mysql/terraform.tfstate"
  }
}


resource "aws_db_instance" "example" {
  identifier_prefix    = "magsoftware-terraform"
  allocated_storage    = 10
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  skip_final_snapshot  = true

  name                 = "example_database"
  username             = "admin"
  password             = var.db_password
}
