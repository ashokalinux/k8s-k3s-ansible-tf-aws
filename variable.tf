# Allowing access from everything is probably not secure; so please override this to your requirement.
variable "rancher_ingress_cidrs" {
  description = "External ips allowed access to rancher."
  default     = ["0.0.0.0/0"]
  type        = list(string)
}

# Allowing access from everything is probably not secure; so please override this to your requirement.
variable "ssh_ingress_cidrs" {
  description = "External ips allowed access to k3s servers via ssh."
  default     = ["0.0.0.0/0"]
  type        = list(string)
}

variable "ec2_inst_type" {
  description = "k3s server instance type."
  default     = "t3a.medium"
}

variable "key_pair" {
  default = "my-keypair"
}


variable "instances_name" {
  description = "Instance name of K8s"
  default = ["Master", "node1", "node2" ]
}

variable "instanceType" {
  default= ["t3a.medium","t2.micro","t2.micro"]
}

#####k3s demo
variable "instances_name_k3" {
  description = "Instance name of K3s"
  default = ["K3-Master"]
}

