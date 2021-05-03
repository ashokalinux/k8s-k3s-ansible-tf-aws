
Tools used
--------------------------
@AWS Cloud - infrasture platform

@Terraform - infrasture code

 -tfswitch - for version of terraform

 -terratag - for tagging resources

 -terra-doc - for generating README creation

@Ansible - configuration management

@k8s - kubernetes (kubeadm) and @k3s 
  -sample web apps exposed to external word using haproxy ingress controller


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> v0.15.0 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | 1.0.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ansible"></a> [ansible](#provider\_ansible) | 1.0.4 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.37.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ansible_host.MASTER](https://registry.terraform.io/providers/nbering/ansible/1.0.4/docs/resources/host) | resource |
| [ansible_host.Node1](https://registry.terraform.io/providers/nbering/ansible/1.0.4/docs/resources/host) | resource |
| [ansible_host.Node2](https://registry.terraform.io/providers/nbering/ansible/1.0.4/docs/resources/host) | resource |
| [aws_eip.createNATGateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_iam_instance_profile.k3s_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.k3s_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.k3s_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.k3s_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.k3s](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.createInternetGateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_key_pair.ec2key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_nat_gateway.associateNATGateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_network_acl.createNetworkACL](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_network_acl.createNetworkACL1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_route.associatePrivate_Route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.createInternet_Access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.createInternet_Access1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.createPrivateRouteTable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.createPublicRouteTable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.createPublicRouteTable1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.associatePriavteSubnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.associatePriavteSubnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.associatePriavteSubnet3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.associateRouteTable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.associateRouteTable1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.createSecurityGroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.inboundRule1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.inboundRule2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.inboundRule3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.outboundRule1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.createPrivateSubnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.createPrivateSubnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.createPrivateSubnet3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.createPublicSubnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.createPublicSubnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.createVPC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availabilityZonePrivate1"></a> [availabilityZonePrivate1](#input\_availabilityZonePrivate1) | n/a | `string` | `"us-west-1a"` | no |
| <a name="input_availabilityZonePrivate2"></a> [availabilityZonePrivate2](#input\_availabilityZonePrivate2) | n/a | `string` | `"us-west-1a"` | no |
| <a name="input_availabilityZonePrivate3"></a> [availabilityZonePrivate3](#input\_availabilityZonePrivate3) | n/a | `string` | `"us-west-1b"` | no |
| <a name="input_availabilityZonePublic"></a> [availabilityZonePublic](#input\_availabilityZonePublic) | n/a | `string` | `"us-west-1b"` | no |
| <a name="input_availabilityZonePublic1"></a> [availabilityZonePublic1](#input\_availabilityZonePublic1) | n/a | `string` | `"us-west-1a"` | no |
| <a name="input_destinationCIDRblock"></a> [destinationCIDRblock](#input\_destinationCIDRblock) | n/a | `string` | `"0.0.0.0/0"` | no |
| <a name="input_dnsHostNames"></a> [dnsHostNames](#input\_dnsHostNames) | n/a | `bool` | `true` | no |
| <a name="input_dnsSupport"></a> [dnsSupport](#input\_dnsSupport) | n/a | `bool` | `true` | no |
| <a name="input_ec2_inst_type"></a> [ec2\_inst\_type](#input\_ec2\_inst\_type) | k3s server instance type. | `string` | `"t3a.medium"` | no |
| <a name="input_environmentName"></a> [environmentName](#input\_environmentName) | n/a | `string` | `"DEV"` | no |
| <a name="input_ingressCIDRblock"></a> [ingressCIDRblock](#input\_ingressCIDRblock) | n/a | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_instanceTenancy"></a> [instanceTenancy](#input\_instanceTenancy) | n/a | `string` | `"default"` | no |
| <a name="input_instanceType"></a> [instanceType](#input\_instanceType) | n/a | `list` | <pre>[<br>  "t3a.medium",<br>  "t2.micro",<br>  "t2.micro"<br>]</pre> | no |
| <a name="input_instances_name"></a> [instances\_name](#input\_instances\_name) | Instance name of K8s | `list` | <pre>[<br>  "Master",<br>  "node1",<br>  "node2"<br>]</pre> | no |
| <a name="input_key_pair"></a> [key\_pair](#input\_key\_pair) | n/a | `string` | `"my-keypair"` | no |
| <a name="input_mapPublicIP"></a> [mapPublicIP](#input\_mapPublicIP) | n/a | `bool` | `true` | no |
| <a name="input_private_subnet_cidr-1"></a> [private\_subnet\_cidr-1](#input\_private\_subnet\_cidr-1) | CIDR for the private subnet | `string` | `"10.22.2.0/24"` | no |
| <a name="input_private_subnet_cidr-2"></a> [private\_subnet\_cidr-2](#input\_private\_subnet\_cidr-2) | CIDR for the private subnet | `string` | `"10.22.3.0/24"` | no |
| <a name="input_private_subnet_cidr-3"></a> [private\_subnet\_cidr-3](#input\_private\_subnet\_cidr-3) | CIDR for the private subnet | `string` | `"10.22.5.0/24"` | no |
| <a name="input_public_subnet_cidr"></a> [public\_subnet\_cidr](#input\_public\_subnet\_cidr) | n/a | `string` | `"10.22.1.0/24"` | no |
| <a name="input_public_subnet_cidr-1"></a> [public\_subnet\_cidr-1](#input\_public\_subnet\_cidr-1) | n/a | `string` | `"10.22.4.0/24"` | no |
| <a name="input_rancher_ingress_cidrs"></a> [rancher\_ingress\_cidrs](#input\_rancher\_ingress\_cidrs) | External ips allowed access to rancher. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | variables.tf | `string` | `"us-west-1"` | no |
| <a name="input_ssh_ingress_cidrs"></a> [ssh\_ingress\_cidrs](#input\_ssh\_ingress\_cidrs) | External ips allowed access to k3s servers via ssh. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_vpcCIDRblock"></a> [vpcCIDRblock](#input\_vpcCIDRblock) | n/a | `string` | `"10.22.0.0/16"` | no |
| <a name="input_vpcName"></a> [vpcName](#input\_vpcName) | n/a | `string` | `"DEMO-VPC"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_server_ssh_key"></a> [server\_ssh\_key](#output\_server\_ssh\_key) | n/a |
| <a name="output_servers_public_ips"></a> [servers\_public\_ips](#output\_servers\_public\_ips) | print public ips of all nodes |
