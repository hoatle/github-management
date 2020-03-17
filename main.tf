# terraform {
#   backend "s3" {
#     bucket = "hoatle-github-management"
#   }
# }

provider "aws" {

  version = "~> 2.53.0"

  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region

}


# module "s3-bucket" {
#   source  = "terraform-aws-modules/s3-bucket/aws"
#   version = "~> 1.6.0"
#   # insert the 6 required variables here
#   bucket = "hoatle-github-management"
#   acl    = "private"

#   versioning = {
#     enabled = true
#   }
# }




# create s3 backend first


# provider "github" {
#   version    = "~> 2.4.1"
#   individual = false
# }

