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

resource "aws_instance" "web" {
  ami = "ami-017fecd1353bcc96e"
  instance_type = "t2.micro"
}
