include {
    path = "../../../../common.hcl"
}

terraform {
    source = "git::https://github.com/kunduso/add-aws-elb-ec2-private-subnet-terraform.git?ref=main"
}
inputs = {
    vpc_cidr = "10.20.20.0/24"

}