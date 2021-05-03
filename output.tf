
#print public ips of all nodes
output "K8_servers_public_ips" {
  value = [aws_instance.k3s.*.public_ip]
}

output "K3_servers_public_ips" {
  value = [aws_instance.k3s_k3.*.public_ip]
}

output "server_ssh_key" {
  value = var.key_pair
}
