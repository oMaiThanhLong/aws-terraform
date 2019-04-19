provider "aws"{
    region = "${var.aws_region}"
    profile  =  "${var.aws_profile}"
}

module "instances" {
    source = "./module/instances"
    aws_key_pair = "${var.aws_key_pair}"
    aws_terraform_lab_sg_bastion  = "${module.vpc.aws_terraform_lab_sg_bastion}"
}

module "vpc" {
    source = "./module/vpc"
    aws_cidr_vpc  = "${var.aws_cidr_vpc}"
    aws_cidr_subnet_public = "${var.aws_cidr_subnet_public}"
}
