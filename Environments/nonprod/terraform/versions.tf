
terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket              = "terraform-statefile-srinivasa"
    key                 = "Nonprod/vpc/terraform.tfstate"
    region              = "us-east-1"
    encrypt             = true
    use_lockfile        = true
    allowed_account_ids = ["982468346394"]
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
