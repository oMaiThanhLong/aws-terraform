output "public_subnets_id" {
	value = "${aws_subnet.aws-terraform-public-subnet.*.id}"
}

output "vpc_id" {
  value = "${aws_vpc.aws-terraform-lab-vpc.id}"
}

output "aws_terraform_lab_sg_bastion" {
  value = "${aws_security_group.aws-terraform-lab-sg-bastion.id}"
}

