
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
  ami = data.aws_ami.ubuntu.id
  instance_type          = "${var.instanceType[count.index]}"
  count = "${length(var.instances_name)}"
# iam_instance_profile = aws_iam_instance_profile.k3s_server.name
  key_name = aws_key_pair.ec2key.key_name
# availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_security_group_ids = [aws_security_group.createSecurityGroup.id]
  subnet_id = "${aws_subnet.createPublicSubnet.id}"
/*
  user_data = templatefile("server-userdata.tmpl", {
    pwd = random_password.mysql_password.result,
    host = aws_db_instance.k3s.address,
    helm-repo = var.rancher_helm_repo,
    dns-name = var.rancher_dns_name,
    inst-id = count.index
  })
  depends_on = [ aws_db_instance.k3s, aws_security_group.k3s_mysql ]
*/
 
 tags = {
      "Name" = "${lower(var.instances_name[count.index])}",
       "product" = "${lower(var.instances_name[count.index])}"
    }

}

