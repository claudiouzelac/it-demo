variable "region" {
  default = "us-west-2"
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
