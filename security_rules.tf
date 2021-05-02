resource "aws_security_group_rule" "inboundRule1" {
#  count             = length(var.sg_name)
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.ssh_ingress_cidrs
  security_group_id = aws_security_group.createSecurityGroup.id
}

resource "aws_security_group_rule" "inboundRule2" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.rancher_ingress_cidrs
  security_group_id = aws_security_group.createSecurityGroup.id
}

resource "aws_security_group_rule" "inboundRule3" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [aws_vpc.createVPC.cidr_block]
  security_group_id = aws_security_group.createSecurityGroup.id
}

#outbound
resource "aws_security_group_rule" "outboundRule1" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.createSecurityGroup.id
}

