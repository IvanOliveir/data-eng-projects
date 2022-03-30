provider "aws" {
  region = var.aws_region
}


#Centralizar o arquivo de controle de estado do terraform
terraform {
  backend "s3" {
    bucket = "terraform-state-ivan"
    key = "state/terraform.tfstate"
    region = "sa-east-1"
  }
}