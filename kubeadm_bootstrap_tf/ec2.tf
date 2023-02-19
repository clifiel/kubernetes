terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "key_pair" {
  key_name = "cliff.silva-wsl2"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "kube-master" {
  ami = "ami-0557a15b87f6559cf"
  instance_type	= "t3a.small"
  key_name = "cliff.silva-wsl2"
  subnet_id = "subnet-fffdb7d1"
  tags = {
    "Name" = "kube-master"
  }
}

#resource "aws_key_pair" "key_pair" {}