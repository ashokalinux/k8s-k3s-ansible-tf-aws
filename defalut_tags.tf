locals {
  common_tags = {
    project         = "${lower(var.projectName)}"
    environment      = "${lower(var.environmentName)}"
    AutoTag_Creator       = "${var.createdBy}"
    AutoTag_CreateTime       = "${var.createdOn}"
    business-unit  = "${var.businessUnit}"
    operation-owner = "${var.operationOwner}"
    customer-name    ="${var.customer-name}"
    product-version ="${var.productVersion}"
    product         = "${var.projectName}"
    decommission-date ="${var.decommissionDate}"
    team-access = "${var.teamaccess}"
  }
}

#9 june 2020

locals {
  common_tags_1 = {
    project         = "appservices"
    environment      = "${lower(var.environmentName)}"
    AutoTag_Creator       = "${var.createdBy}"
    AutoTag_CreateTime       = "${var.createdOn}"
    business-unit  = "${var.businessUnit}"
    operation-owner = "${var.operationOwner}"
    customer-name    ="${var.customer-name}"
    product-version ="${var.productVersion}"
    product         = "${var.projectName}"
    decommission-date ="${var.decommissionDate}"
    team-access = "${var.teamaccess}"
  }
}

locals {
  instance_tags={
      "compliance"="pci",
      "system-patching-owner"="infra",
      "patching-date"="3rd-sat-monthly"
      "ec2-startstop-excluded"="no"
      "ec2-startstop" ="no"
      "power-on-schedule" ="24x7"
      "autorecovery-configured"="yes"
      "ami-required" ="yes"
      "termination-protection" ="yes"
  }
}

locals {
  encryption_tags={
      "encryption-enable"="yes",
  }
}

locals {
  ebs_tags={
      "application-patching-owner"="ace"
      "os-type"="linux-ubuntu-18"
  }
}




variable "projectName" {
  default=""
  
}

variable "productName" {
  default=""
  
}

variable "teamaccess" {
  default=""
}


variable "createdBy" {
  default=""
  
}

variable "createdOn" {
  default=""
  
}
variable "businessUnit" {
  default=""
  
}
variable "operationOwner" {
  default=""
  
}

variable "customer-name" {
  default="controlcase-k1113"
  
}

variable "productVersion" {
  default="2"
  
}

variable "decommissionDate" {
  default="never"
  
}
