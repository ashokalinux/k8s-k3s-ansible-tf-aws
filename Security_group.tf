resource "aws_security_group" "createSecurityGroup" {
#  count                  = length(var.sg_name)
#  name                   = var.sg_name[count.index]
  name                   = "sg_k8s"
  description            = "Allow inbound traffic as Per Resource/Requirement"
 # vpc_id                 = data.aws_subnet.subnet-selected4.vpc_id
  vpc_id                 = aws_vpc.createVPC.id
  revoke_rules_on_delete = "true"

}

