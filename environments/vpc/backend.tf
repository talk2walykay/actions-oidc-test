terraform {
  backend "s3" {
    bucket  = "expertdotcom-bucket"
    region  = "us-west-2"
    key     = "oidc/terraform.tfstate"
    encrypt = true
  }
}