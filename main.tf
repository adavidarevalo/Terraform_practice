provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main1" {
    cidr_block = "10.0.0.0/16"  
    enable_dns_hostnames = true
    tags = {
        Name="main1"
    }
}

resource "aws_subnet" "Public_Subnet_1" {
    vpc_id = aws_vpc.main1.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "us-east-2a"
    map_public_ip_on_launch = true

    tags = {
        Name="Public_Subnet_1"
    }
}

resource "aws_internet_gateway" "IG" {
    vpc_id = aws_vpc.main1.id
    tags = {
        Name="IG"
    }
}

resource "aws_route_table" "RT" {
    vpc_id = aws_vpc.main1.id
    tags = {
        Name="RT"
    }
    route {
        gateway_id = aws_internet_gateway.IG.id
        cidr_block = "0.0.0.0/0"
    }
}

resource "aws_route_table_association" "Association" {
    subnet_id = aws_subnet.Public_Subnet_1.id
    route_table_id = aws_route_table.RT.id
}

