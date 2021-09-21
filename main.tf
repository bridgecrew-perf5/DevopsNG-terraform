terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
      Name = "test"
  }
}

resource "aws_instance" "my-web-server" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name      = "chuks_prime"

  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install apache2 -y
  sudo systemctl start apache2
  sudo bash -c 'echo your very first web server > /var/www/html/index.html'
  EOF


  tags = {
    Name = "web-1"
  }
}