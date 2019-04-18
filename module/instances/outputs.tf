output "instance_ip_public" {
    value =  "${aws_instance.aws-terraform-lab-instance.public_ip}"
}