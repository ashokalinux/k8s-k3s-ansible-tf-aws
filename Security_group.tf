resource "aws_security_group" "createSecurityGroup" {
  #  count                  = length(var.sg_name)
  #  name                   = var.sg_name[count.index]
  name        = "sg_k8s"
  description = "Allow inbound traffic as Per Resource/Requirement"
  vpc_id                 = aws_vpc.createVPC.id
  revoke_rules_on_delete = "true"

  tags = merge(local.terratag_added_Security_group, local.terratag_added_Security_group)
}


locals {
  terratag_added_Security_group = {"Project"="K8S-Demo","kubernetes.io/cluster/kubernetes"="owned"}
}

