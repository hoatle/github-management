terraform {

  # enable this only when the bucket is created
  # terraform init -backend-config=backend.tfvars
  backend "s3" {

  }
}
