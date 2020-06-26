terraform {
  required_version = ">= 0.12, < 0.13"
}


provider "aws" {
  region = "eu-central-1"
}


terraform {
  backend "s3" {
    key = "prod/services/webserver-cluster/terraform.tfstate"
  }
}


module "webserver_cluster" {
  source = "github.com/magsoftware/tuar-modules//services/webserver-cluster?ref=rel-0.0.2"
 
  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "magsoftware-terraform-state"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
  server_port   = 8080
}
