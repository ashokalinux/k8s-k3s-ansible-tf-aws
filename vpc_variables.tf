# variables.tf
variable "region" {
  default = "us-west-1"
}

variable "vpcName" {
  default="DEMO-VPC"
}

variable "environmentName" {
  default ="DEV"
}

variable "availabilityZonePublic" {
  default = "us-west-1b"
}

variable "availabilityZonePublic1" {
  default = "us-west-1a"
}


variable "availabilityZonePrivate1" {
  default = "us-west-1a"
}

variable "availabilityZonePrivate2" {
  default = "us-west-1a"
}

variable "availabilityZonePrivate3" {
  default = "us-west-1b"
}

variable "instanceTenancy" {
  default = "default"
}

variable "dnsSupport" {
  default = true
}
variable "dnsHostNames" {
  default = true
}
variable "vpcCIDRblock" {
  default = "10.22.0.0/16"
}
variable "public_subnet_cidr" {
  default = "10.22.1.0/24"
}

variable "public_subnet_cidr-1" {
  default = "10.22.4.0/24"
}


variable "private_subnet_cidr-1" {
  description = "CIDR for the private subnet"
  default     = "10.22.2.0/24"
}

variable "private_subnet_cidr-2" {
  description = "CIDR for the private subnet"
  default     = "10.22.3.0/24"
}

variable "private_subnet_cidr-3" {
  description = "CIDR for the private subnet"
  default     = "10.22.5.0/24"
}

variable "destinationCIDRblock" {
  default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
  #type    = "list"
 # default = ["203.115.125.148/32"]
  default = ["0.0.0.0/0"]
}
variable "mapPublicIP" {
  default = true
}


variable "servicename" {
    default="secretsmanager"
  
}

variable "endpointtype" {
    default="Interface"
  
}

variable "sg_id"{
  default=["sg-04586d8ae35a3e2c2","sg-01044a372753883b8"]
}

