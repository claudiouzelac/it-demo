variable "region" {
  default = "us-west-2"
}

variable "vpc_cidr" {
  default = "10.141.0.0/16"
}

variable "private_subnets" {
  default = ["10.141.0.0/20", "10.141.32.0/20", "10.141.64.0/20"]
}

variable "public_subnets" {
  default = ["10.141.96.0/19", "10.141.128.0/19", "10.141.160.0/19"]
}

# Tags to apply across the VPC resources
variable "base_tags" {
  default = {
    "Terraform" = "true"
    "Project"   = "ci-demo"
    "Region"    = "us-west-2"
    "Owner"     = "ericz"
  }
}
