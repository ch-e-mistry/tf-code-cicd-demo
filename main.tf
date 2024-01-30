data "aws_ami" "Amazon_Linux" {
  #Get the latest amazon-linux2 official image as AMI.
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.Amazon_Linux.id
  instance_type = "t2.micro"

  tags = {
    Name = "PéldaEC2"
  }
}