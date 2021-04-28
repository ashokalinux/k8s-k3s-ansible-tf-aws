resource "aws_key_pair" "ec2key" {
  key_name = var.key_pair
  public_key = "${file("${path.module}/my-keypair.pub")}"
#  public_key = "${file("${path.module}/data/id_rsa.pub")}"
}

