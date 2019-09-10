# Setup main infra in aws for sumo

provider "aws" {
  region  = "${var.region}"
  version = "~> 2"
}

terraform {
  backend "s3" {
    bucket = "ci-demo-state"
    key    = "terraform/ci-demo-infra"
    region = "us-west-2"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.60.0"

  name = "ci-demo"
  cidr = "${var.vpc_cidr}"

  azs = [
    "${data.aws_availability_zones.available.names[0]}",
    "${data.aws_availability_zones.available.names[1]}",
    "${data.aws_availability_zones.available.names[2]}",
  ]

  enable_nat_gateway = true
  single_nat_gateway = true

  private_subnets     = "${var.private_subnets}"
  public_subnets      = "${var.public_subnets}"

  private_subnet_tags     = "${merge(map("Purpose", "services"), var.base_tags)}"
  public_subnet_tags      = "${merge(map("Purpose", "kubernetes"), var.base_tags)}"

  tags = "${var.base_tags}"
}
