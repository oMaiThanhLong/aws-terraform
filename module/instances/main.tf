resource "aws_key_pair" "aws-terraform-lab" {
    key_name = "aws-terraform-lab"
    public_key = "${file(var.aws_key_pair)}"
}



resource "aws_instance" "aws-terraform-lab-instance" {
    count = 1
    ami = "ami-0bd0e446b9c0706dc"
    instance_type = "t2.micro"
    tags {
        Name = "aws-terraform-lab-instance-${count.index+1}"
    }
    key_name = "${aws_key_pair.aws-terraform-lab.id}"
    
    vpc_security_group_ids = ["${var.aws_terraform_lab_sg_bastion}"]
    
}
