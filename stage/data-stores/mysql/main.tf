terraform {
  required_version = ">= 0.12, < 0.13"
}


provider "aws" {
  region = "eu-central-1"
}


terraform {
  backend "s3" {
    key    = "stage/data-stores/mysql/terraform.tfstate"
  }
}


module "mysql" {
  source = "github.com/magsoftware/tuar-modules//data-stores/mysql?ref=rel-0.0.2"
 
  db_name     = "mydatabase_stage"
  db_username = "mysername_stage"
  db_password = var.db_password
}
