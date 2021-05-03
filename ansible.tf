resource "ansible_host" "MASTER" {
  inventory_hostname = "${aws_instance.k3s[0].public_dns}"
  groups = ["master"]
  vars = {
      ansible_user = "ubuntu"
      ansible_ssh_private_key_file="/root/working-code/my-demo-cluster-tag/my-keypair"
      ansible_python_interpreter="/usr/bin/python3"
  }
}

resource "ansible_host" "Node1" {
  inventory_hostname = "${aws_instance.k3s[1].public_dns}"
  groups = ["node1"]
  vars = {
      ansible_user = "ubuntu"
      ansible_ssh_private_key_file="/root/working-code/my-demo-cluster-tag/my-keypair"
      ansible_python_interpreter="/usr/bin/python3"
  }
}

resource "ansible_host" "Node2" {
  inventory_hostname = "${aws_instance.k3s[2].public_dns}"
  groups = ["node2"]
  vars = {
      ansible_user = "ubuntu"
      ansible_ssh_private_key_file="/root/working-code/my-demo-cluster-tag/my-keypair"
      ansible_python_interpreter="/usr/bin/python3"
  }
}

#for k3s single node cluster

resource "ansible_host" "K3S-Master" {
  inventory_hostname = "${aws_instance.k3s_k3[0].public_dns}"
  groups = ["K3SMaster"]
  vars = {
      ansible_user = "ubuntu"
      ansible_ssh_private_key_file="/root/working-code/my-demo-cluster-tag/my-keypair"
      ansible_python_interpreter="/usr/bin/python3"
  }
}

