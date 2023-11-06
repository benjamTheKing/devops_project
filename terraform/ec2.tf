provider "aws" {
    region = "eu-north-1"
}

resource "aws_instance" "demo" {
    ami = "ami-0df024d681444bc53"
    instance_type = "t3.micro"
    key_name = "key_pair"
    security_groups = ["allow_ssh"]
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}