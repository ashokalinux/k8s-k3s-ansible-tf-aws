
#print public ips of all nodes
output "servers_public_ips" {
  value = [aws_instance.k3s.*.public_ip]
}

output "server_ssh_key" {
  value = var.key_pair
}
