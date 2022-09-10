provider "aws"{
    region = "sa-east-1"
//    shared_config_files      = ["/home/penalva/.aws/config"]
//    shared_credentials_files = ["/home/penalva/.aws/credentials"]
//    profile                  = "awsadm"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-igti-edc-penalvd"
    key = "state/igti/edc/mod1/terraform.tfstate"
    region = "sa-east-1"
  }
}