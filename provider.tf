# Define AWS as our provider
provider "aws" {
  region = "${var.region}"
}

# Ansible provider
terraform {
  required_providers {
    ansible = {
      source = "nbering/ansible"
      version = "1.0.4"
    }
  }
}
provider "ansible" {}
