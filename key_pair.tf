resource "aws_key_pair" "ec2key" {
  key_name   = var.key_pair
  public_key = "${file("${path.module}/my-keypair.pub")}"
  #  public_key = "${file("${path.module}/data/id_rsa.pub")}"
  tags = merge(local.terratag_added_key_pair, local.terratag_added_key_pair)
}



locals {
  terratag_added_key_pair = {"Project"="K8S-Demo","kubernetes.io/cluster/kubernetes"="owned"}
}

