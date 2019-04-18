

resource "aws_security_group" "aws-terraform-lab-sg-bastion" {
    name = "aws-terraform-lab-sg-bastion"
    vpc_id = "${aws_vpc.aws-terraform-lab-vpc.id}"
    ingress {
        from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "aws-terraform-lab-sg-bastion"
    }
}
