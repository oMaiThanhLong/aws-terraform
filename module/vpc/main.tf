

# create vpc with parmetter cidir_block
resource "aws_vpc" "aws-terraform-lab-vpc" {
    cidr_block = "${var.aws_cidr_vpc}"
    enable_dns_hostnames = true 
    enable_dns_support  = true 
    tags {
        Name = "aws-terraform-lab-vpc"
    }
}

data "aws_availability_zone" "azone" {
  
}

# create 2 subnet pulic 
resource "aws_subnet" "aws-terraform-public-subnet" {
    count = 2
    vpc_id = "${aws_vpc.aws-terraform-lab-vpc.id}"
    cidr_block = "${var.aws_cidr_subnet_public[count.index]}"
    availability_zone = "${data.aws_availability_zone.azone.names[count.index]}"
    map_public_ip_on_launch = true
    tags {
        Name  = "aws-terraform-lab-public-subnet-${count.index+1}"
    }
}

