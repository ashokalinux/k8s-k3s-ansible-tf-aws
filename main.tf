
####################################################

# TERRAFORM VERSION

###################################################
terraform {

required_version = "~> v0.15.0" # is equivalent to >= 0.15.0,

#  required_providers {
#    aws = "~> 3.37.0"
#  }


  ##################################################

  # TERRAFORM Backend
  ### Remote Backent - S3 (with locking via DynamoDB)# To allow collaboration within a team ###

  backend "s3" {
    bucket         = "ashelke-com-state-store"
    dynamodb_table = "terraform-state-lock-dynamodb"
    key            = "us-east-1/Demo/terraform.tfstate"
    region         = "us-east-1"
  }
}
##############################################################

