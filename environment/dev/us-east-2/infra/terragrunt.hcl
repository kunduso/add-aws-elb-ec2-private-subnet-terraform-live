include {
    path = "../../../../common.hcl"
}

terraform {
    source = "https://github.com/kunduso/add-aws-elb-ec2-private-subnet-terraform"
}
inputs = {
        #vpc_address_space = "10.20.20.0/28"
}