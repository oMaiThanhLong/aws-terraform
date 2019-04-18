data "aws_availability_zones" "azone" {
    state = "available"
}

# create vpc with parmetter cidir_block
resource "aws_vpc" "aws-terraform-lab-vpc" {
    cidr_block = "${var.aws_cidr_vpc}"
    enable_dns_hostnames = true 
    enable_dns_support  = true 
    tags {
        Name = "aws-terraform-lab-vpc"
    }
}



# create 2 subnet pulic 
resource "aws_subnet" "aws-terraform-public-subnet" {
    count = 2
    vpc_id = "${aws_vpc.aws-terraform-lab-vpc.id}"
    cidr_block = "${var.aws_cidr_subnet_public[count.index]}"
    availability_zone = "${data.aws_availability_zones.azone.names[count.index]}"
    map_public_ip_on_launch = true
    tags {
        Name  = "aws-terraform-lab-public-subnet-${count.index+1}"
    }
}
# create internet gateway
resource "aws_internet_gateway" "aws-terraform-internet-gateway-public" {
    vpc_id = "${aws_vpc.aws-terraform-lab-vpc.id}"
    tags {
        Name =  "aws-terraform-internet-gateway-pulic"
    }
}

# router table  for asign 2 subnet public
resource "aws_route_table" "aws-terraform-router-table-public" {
    vpc_id = "${aws_vpc.aws-terraform-lab-vpc.id}"
    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.aws-terraform-internet-gateway-public.id}"
    }
    tags {
        Name = "aws-terraform-router-table-public"
    }
}

#asign 2 public subnet into route table public

resource "aws_route_table_association" "aws-terraform-route-table-association" {
    count = "${aws_subnet.aws-terraform-public-subnet.count}"
    subnet_id = "${aws_subnet.aws-terraform-public-subnet.*.id[count.index]}"
    route_table_id = "${aws_route_table.aws-terraform-router-table-public.id}"
}





