output "public_subnets_id" {
	value = "${aws_subnet.aws-terraform-public-subnet.*.id}"
}

output "vpc_id" {
  value = "${aws_vpc.aws-terraform-lab-vpc.id}"
}


