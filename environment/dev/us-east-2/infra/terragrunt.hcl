include {
    path = "../../../../common.hcl"
}

terraform {
    source = "git::git@github.com:kunduso/add-aws-elb-ec2-private-subnet-terraform.git?ref=v1.0"
}
inputs = {
        #vpc_address_space = "10.20.20.0/28"
}