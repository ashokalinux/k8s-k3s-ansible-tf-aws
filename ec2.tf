
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "k3s" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "${var.instanceType[count.index]}"
  count                = "${length(var.instances_name)}"
  iam_instance_profile = aws_iam_instance_profile.k3s_server.name
  key_name             = aws_key_pair.ec2key.key_name
  # availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_security_group_ids = [aws_security_group.createSecurityGroup.id]
  subnet_id              = "${aws_subnet.createPublicSubnet.id}"
  user_data              = "${file("install_master.sh")}"

  tags = merge(merge(tomap({ "Name" = "${lower(var.instances_name[count.index])}", "product" = "${lower(var.instances_name[count.index])}" }), local.terratag_added_ec2), local.terratag_added_ec2)

}


locals {
  terratag_added_ec2 = {"Project"="K8S-Demo","kubernetes.io/cluster/kubernetes"="owned"}
}

###############Test################################
## for k3s demo

resource "aws_instance" "k3s_k3" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "${var.instanceType[count.index]}"
  count                = "${length(var.instances_name_k3)}"
  iam_instance_profile = aws_iam_instance_profile.k3s_server.name
  key_name             = aws_key_pair.ec2key.key_name
  # availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_security_group_ids = [aws_security_group.createSecurityGroup.id]
  subnet_id              = "${aws_subnet.createPublicSubnet.id}"
# user_data              = "${file("install_master.sh")}"

  tags = merge(merge(tomap({ "Name" = "${lower(var.instances_name_k3[count.index])}", "product" = "${lower(var.instances_name_k3[count.index])}" }), local.terratag_added_ec2), local.terratag_added_ec2)

}

/*
locals {
  terratag_added_ec2 = {"Project"="K3S-Demo","kubernetes.io/cluster/kubernetes"="owned"}
}
*/
