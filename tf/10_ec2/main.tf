# Setup main infra in aws for sumo

provider "aws" {
  region  = "${var.region}"
  version = "~> 2"
}

terraform {
  backend "s3" {
    bucket = "ci-demo-state"
    key    = "terraform/ci-demo-infra-ec2"
    region = "us-west-2"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "webapp" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.large"
  user_data = "${file("${path.module}/userdata.sh")}"

  tags = {
    "Env"      = "dev"
    "App"      = "it-demo"
  }
}
