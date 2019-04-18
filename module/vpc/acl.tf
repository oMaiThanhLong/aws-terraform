resource "aws_default_network_acl" "aws-terraform-lab-acl" {
    default_network_acl_id = "${aws_vpc.aws-terraform-lab-vpc.default_network_acl_id}"

    egress {
        protocol   = "tcp" #-1 ALL
        rule_no    = 200
        action     = "allow"
        cidr_block = "10.3.0.0/18" # 0.0.0.0/0
        from_port  = 443 #22
        to_port    = 443 #22
    }

    ingress {
        protocol   = "tcp"
        rule_no    = 100
        action     = "allow"
        cidr_block = "10.3.0.0/18"
        from_port  = 80
        to_port    = 80
    }

    tags = {
        Name = "aws-terraform-lab-acl"
    }
}