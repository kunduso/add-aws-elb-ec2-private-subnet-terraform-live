[![Deploy-to-multiple-environments](https://github.com/kunduso/add-aws-elb-ec2-private-subnet-terraform-live/actions/workflows/terragrunt.yml/badge.svg)](https://github.com/kunduso/add-aws-elb-ec2-private-subnet-terraform-live/actions/workflows/terragrunt.yml) [![checkov-static-analysis-scan](https://github.com/kunduso/add-aws-elb-ec2-private-subnet-terraform-live/actions/workflows/code-scan.yml/badge.svg)](https://github.com/kunduso/add-aws-elb-ec2-private-subnet-terraform-live/actions/workflows/code-scan.yml)
![Image](https://skdevops.files.wordpress.com/2023/08/80-image-0.png)
## Motivation
In this note, I demonstrate how to use Terragrunt to deploy the same Terraform configuration code (with environment-specific configurations) across two separate AWS accounts using GitHub Actions. The process can be classified into three high-level steps. These are:
1. Create the pre-requisites in AWS and GitHub Actions,
2. Add the environment-specific Terragrunt HCL code to the GitHub repository, and
3. Run the HCL code via GitHub Actions.

Checkout my detailed note on that at -[Deploy Across AWS Accounts Like a Pro: Terragrunt, Terraform, and GitHub Actions](https://skundunotes.com/2023/08/17/deploy-across-aws-accounts-like-a-pro-terragrunt-terraform-and-github-actions/)

## AWS Account Layout
![Image](https://skdevops.files.wordpress.com/2023/08/80-image-2.png)
## Prerequisites
Since I follow the setup above  -a central automation account and two separate accounts for each environment- there are a few prerequisites to arrange before I can let the GitHub Actions automation run. These are:
<br />(a) Configure OpenID Connect in the Automation AWS account to authenticate with GitHub actions,
<br />(b) Create a role with appropriate permissions in the target AWS account (Dev and Test),
<br />(c) Set up a trust relation between the AWS IAM roles (automation account and dev account roles and automation account and test account roles), and
<br />(d) Create Environments in GitHub for each product environment.
## Usage
The logic to manage the deployment is stored in the [`terragrunt.hcl`](./.github/workflows/terragrunt.yml) file. Since deploying to multiple environments is the same, I am utilizing a reusable workflow. You can read about that at  –[using-reusable-workflows-github-actions.](https://github.blog/2022-02-10-using-reusable-workflows-github-actions/)
## Folder Structure
There are two top-level folders – [`.github`](./.github/workflows/) folder to store the pipeline workflow YAML files and the [`environment`](./environment/) folder to store the environment-specific (dev and test) HCL configuration. I could have had another folder in the GitHub repository as `infrastructure` and kept the terraform code (.tf files) in the same repository; I do not have it that way. <br />Instead, I am (partially) following the recommendations made in the article  –[infrastructure-live for Terragrunt](https://github.com/gruntwork-io/terragrunt-infrastructure-live-example), where the Terraform code is stored independently of the Terragrunt configuration.
## License
This code is released under the Unlincse License. See [LICENSE](LICENSE).