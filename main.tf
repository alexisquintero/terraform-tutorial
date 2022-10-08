terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.33.0"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  shared_credentials_files = [ "$HOME/Downloads/creds" ]
  profile = "terraform"
}

resource "aws_vpc" "web_vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "tuts vpc"
  }
}

resource "aws_subnet" "web_subnet" {
  vpc_id = aws_vpc.web_vpc.id
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "tuts subnet"
  }
}

resource "aws_instance" "web_instance" {
  ami = "ami-017fecd1353bcc96e"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.web_subnet.id

  tags = {
    Name = "tuts example"
    foo = "bar"
  }
}
