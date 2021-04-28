# vpc.tf 
# Create VPC/Subnet/Security Group/ACL

# create the VPC
resource "aws_vpc" "createVPC" {
  cidr_block           = "${var.vpcCIDRblock}"
  instance_tenancy     = "${var.instanceTenancy}"
  enable_dns_support   = "${var.dnsSupport}"
  enable_dns_hostnames = "${var.dnsHostNames}"
}

# end resource

# create the Subnet
resource "aws_subnet" "createPublicSubnet" {
  vpc_id                  = "${aws_vpc.createVPC.id}"
  cidr_block              = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = "${var.mapPublicIP}"
  availability_zone       = "${var.availabilityZonePublic}"
}
# end resource
# create the Subnet
resource "aws_subnet" "createPublicSubnet1" {
  vpc_id                  = "${aws_vpc.createVPC.id}"
  cidr_block              = "${var.public_subnet_cidr-1}"
  map_public_ip_on_launch = "${var.mapPublicIP}"
  availability_zone       = "${var.availabilityZonePublic1}"
}

# Define the private subnet
resource "aws_subnet" "createPrivateSubnet1" {
  vpc_id            = "${aws_vpc.createVPC.id}"
  cidr_block        = "${var.private_subnet_cidr-1}"
  availability_zone = "${var.availabilityZonePrivate1}"
}

/*
output "ACE_Project_Private_Subnet" {
  value = "${aws_subnet.createPrivateSubnet1.id}"
}
*/

# Define the private subnet

resource "aws_subnet" "createPrivateSubnet2" {
  vpc_id            = "${aws_vpc.createVPC.id}"
  cidr_block        = "${var.private_subnet_cidr-2}"
  availability_zone = "${var.availabilityZonePrivate2}"
}
# Define the private subnet
resource "aws_subnet" "createPrivateSubnet3" {
  vpc_id            = "${aws_vpc.createVPC.id}"
  cidr_block        = "${var.private_subnet_cidr-3}"
  availability_zone = "${var.availabilityZonePrivate3}"
}

/*
# Create the Security Group
resource "aws_security_group" "createSecurityGroup" {
  vpc_id      = "${aws_vpc.createVPC.id}"
  name        = "JUMP_Server_SG"
  description = "Security group for Jump server"
  ingress {
    cidr_blocks = "${var.ingressCIDRblock}"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["${aws_vpc.createVPC.cidr_block}"]
}
}
# end resource
*/

# create VPC Network access control list
resource "aws_network_acl" "createNetworkACL" {
  vpc_id     = "${aws_vpc.createVPC.id}"
  subnet_ids = ["${aws_subnet.createPublicSubnet.id}"]
    ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 0
    to_port    = 0
  }
}
# end resource

resource "aws_network_acl" "createNetworkACL1" {
  vpc_id     = "${aws_vpc.createVPC.id}"
  subnet_ids = ["${aws_subnet.createPublicSubnet1.id}"]
    ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_route_table" "createPublicRouteTable1" {
  vpc_id = "${aws_vpc.createVPC.id}"
}
# end resource

# Create the Internet Access
resource "aws_route" "createInternet_Access1" {
  route_table_id         = "${aws_route_table.createPublicRouteTable1.id}"
  destination_cidr_block = "${var.destinationCIDRblock}"
  gateway_id             = "${aws_internet_gateway.createInternetGateway.id}"
}
# end resource

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "associateRouteTable1" {
  subnet_id      = "${aws_subnet.createPublicSubnet1.id}"
  route_table_id = "${aws_route_table.createPublicRouteTable1.id}"

}
# end resource
# Create the Internet Gateway
resource "aws_internet_gateway" "createInternetGateway" {
  vpc_id = "${aws_vpc.createVPC.id}"
}
# end resource

# Create the Route Table
resource "aws_route_table" "createPublicRouteTable" {
  vpc_id = "${aws_vpc.createVPC.id}"
}
# end resource

# Create the Internet Access
resource "aws_route" "createInternet_Access" {
  route_table_id         = "${aws_route_table.createPublicRouteTable.id}"
  destination_cidr_block = "${var.destinationCIDRblock}"
  gateway_id             = "${aws_internet_gateway.createInternetGateway.id}"
}
# end resource

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "associateRouteTable" {
  subnet_id      = "${aws_subnet.createPublicSubnet.id}"
  route_table_id = "${aws_route_table.createPublicRouteTable.id}"
  
}

#For NAT Gateway-29/07/2019
#create this IP to assign it the NAT Gateway 
resource "aws_eip" "createNATGateway" {
  vpc      = true
  depends_on = ["aws_internet_gateway.createInternetGateway"]
}

resource "aws_nat_gateway" "associateNATGateway" {
    allocation_id = "${aws_eip.createNATGateway.id}"
    subnet_id = "${aws_subnet.createPublicSubnet.id}"
    depends_on = ["aws_internet_gateway.createInternetGateway"]
}

resource "aws_route_table" "createPrivateRouteTable" {
    vpc_id = "${aws_vpc.createVPC.id}"
}

resource "aws_route" "associatePrivate_Route" {
	route_table_id  = "${aws_route_table.createPrivateRouteTable.id}"
	destination_cidr_block = "${var.destinationCIDRblock}"
	nat_gateway_id = "${aws_nat_gateway.associateNATGateway.id}"
}

resource "aws_route_table_association" "associatePriavteSubnet1" {
    subnet_id = "${aws_subnet.createPrivateSubnet1.id}"
    route_table_id = "${aws_route_table.createPrivateRouteTable.id}"
}

resource "aws_route_table_association" "associatePriavteSubnet2" {
    subnet_id = "${aws_subnet.createPrivateSubnet2.id}"
    route_table_id = "${aws_route_table.createPrivateRouteTable.id}"
}

resource "aws_route_table_association" "associatePriavteSubnet3" {
    subnet_id = "${aws_subnet.createPrivateSubnet3.id}"
    route_table_id = "${aws_route_table.createPrivateRouteTable.id}"
}

# end vpc.tf
