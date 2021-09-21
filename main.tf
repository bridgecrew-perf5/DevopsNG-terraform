terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region       = "eu-west-3"
  access_key   = var.access_key
  secret_key   = var.secret_key
}


resource "aws_instance" "web-server" {
  ami           = "ami-072056ff9d3689e7b"
  instance_type = "t2.micro"
}