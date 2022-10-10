terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.33.0"
    }
  }
}

provider "aws" {
  region  = local.zone
  shared_credentials_files = [ "$HOME/Downloads/creds" ]
  profile = "terraform"
}

locals {
  setup_name = "tuts"
  zone = "us-west-2"
  availability_zone = "${local.zone}a"
}

resource "aws_vpc" "web_vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.setup_name} vpc"
  }
}

resource "aws_subnet" "web_subnet" {
  vpc_id = aws_vpc.web_vpc.id
  # vpc_id = data.aws_vpc.existing_vpc.id
  cidr_block = "10.5.0.0/16"
  availability_zone = local.availability_zone

  tags = {
    Name = "${local.setup_name} subnet"
  }
}

resource "aws_instance" "web_instance" {
  ami = "ami-017fecd1353bcc96e"
  instance_type = var.var_instance_type
  subnet_id = aws_subnet.web_subnet.id
  availability_zone = local.availability_zone
  count = var.var_instance_count

  # tags = var.var_instance_tags
  tags = {
    Name = "tuts example ${count.index}"
  }

}

# data "aws_vpc" "existing_vpc" {
#   # default = true
#   filter {
#     name = "tag:Name"
#     values = [ "old" ]
#   }
# }
