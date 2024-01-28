terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# login with aws credentials

provider "aws" {
  region     = "us-west-2"
}

resource "aws_instance" "s1" {
  ami = "ami-008fe2fc65df48dac"
  instance_type = "t2.medium"
  key_name     =  aws_key_pair.ec2.key_name
  security_groups	= ["allow-ssh"]
  root_block_device {
    volume_size = 35
  }
  tags = {
    Name = "server1"
  }

  connection {
    user   =  "${var.username}"
    host   =  "${self.public_ip}"
    type   =  "ssh"
    private_key  =  "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
  provisioner "file" {
    source  =  "install.sh"
    destination  =  "/tmp/install.sh"
  }
  provisioner "remote-exec" {
    inline = [
        "sudo chmod +x /tmp/install.sh",
        "/tmp/install.sh",
    ]
  }
}

resource "aws_key_pair" "ec2" {
    key_name    =    "ssh-connfile"
    public_key		= "${file("${path.module}/ssh-connfile.pub")}"
}

resource "aws_vpc" "vpc1" {
  cidr_block = "172.16.0.0/16"
  enable_dns_hostnames   =  true
  enable_dns_support     =  true
  tags = {
    Name = "tf-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-subnet"
  }
}