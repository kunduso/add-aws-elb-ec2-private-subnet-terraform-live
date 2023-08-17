include {
    path = "../../../../common.hcl"
}

terraform {
    source = "git::https://github.com/kunduso/add-aws-elb-ec2-private-subnet-terraform.git?ref=main"
}
inputs = {
    vpc_cidr = "129.87.10.0/24"
    subnet_cidr_private = ["129.87.10.0/27", "129.87.10.32/27", "129.87.10.64/27"]
    subnet_cidr_public = ["129.87.10.96/27", "129.87.10.128/27", "129.87.10.160/27"]
}