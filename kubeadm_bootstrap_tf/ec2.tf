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

  # user_data = <<-EOL
  # #!/bin/bash -xe

  # apt update
  # apt install openjdk-8-jdk --yes
  # wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
  # echo "deb https://pkg.jenkins.io/debian binary/" >> /etc/apt/sources.list
  # apt update
  # apt install -y jenkins
  # systemctl status jenkins
  # find /usr/lib/jvm/java-1.8* | head -n 3  
  # EOL
  tags = {
    "Name" = "kube-master"
  }
}

resource "aws_instance" "kube-node1" {
  ami = "ami-0557a15b87f6559cf"
  instance_type	= "t3a.small"
  key_name = "cliff.silva-wsl2"
  subnet_id = "subnet-fffdb7d1"
  tags = {
    "Name" = "kube-node1"
  }
}

# resource "aws_instance" "kube-node2" {
#   ami = "ami-0557a15b87f6559cf"
#   instance_type	= "t3a.small"
#   key_name = "cliff.silva-wsl2"
#   subnet_id = "subnet-fffdb7d1"
#   tags = {
#     "Name" = "kube-node2"
#   }
# }

#resource "aws_key_pair" "key_pair" {}