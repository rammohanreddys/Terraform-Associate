#### Terraform fill in the blank questions #####

1. To list all resources in the current state, you can use the command __
   ```
   Ans. terraform show
   ```
2. To specify a specific Terraform workspace named "production" when running commands, you can use the command __
   ```
   Ans. terraform workspace select production
   ```
3. The __ or the __ commands are available to delete all of your managed infrastructure.
   ```
   Ans. terraform destroy, terraform apply -destroy
   ```
4. You have the following code snippet as part of your Terraform configuration. How would you reference the id of the s3_bucket?
   ```
   data "aws_s3_bucket" "data_bucket" {
     bucket = "my-data-lookup-bucket-bk"
   }
   ```
   ```
   Ans. data.aws_s3_bucket.data_bucket.id
   ```
5. The command __ can be used to ensure your code is syntactically valid and internally consistent.
   ```
   Ans. terraform validate
   ```
6. In order to check the current version of Terraform you have installed, you can use the command __
   ```
   Ans. terraform version
   ```
7. You have recently added new resource blocks from a different provider to your configuration. Type in the command you need to run before you can run a terraform plan/apply? __
   ```
   Ans. terraform init
   ```
8. You want Terraform to redeploy a specific resource that it is managing. Type the command you should use to mark the resource for replacement. __
   ```
   Ans. terraform apply -replace
   ```
9. The __ command can be used to get an interactive console to evaluate expressions in your Terraform code.
    ```
    Ans. terraform console
    ```
10. To skip the refresh step during a terraform apply, you can use the command __
    ```
    Ans. terraform apply -refresh=skip
    ```
11. You are using Terraform Cloud to store your state file. Before you can use Terraform Cloud, you should run the command __ to obtain and save credentials for the remote backend.
    ```
    Ans. terraform login
    ```
12. To automatically apply changes without interactive confirmation, you can use the command __
    ```
    Ans. terraform apply -auto-approve
    ```
13. To force the destruction of resources without being prompted for confirmation, you can use the command __
    ```
    Ans. terraform destroy -auto-approve
    ```
14. What command can be used to perform a dry-run of your changes and save the proposed changes to a file named bryan for future use? __
    ```
    Ans. terraform plan -out=bryan
    ```
15. You need to access the attributes of a data source in your Terraform configuration for the following code. How should you reference the ID of the returned data? __
    ```
    data "aws_ami" "ubuntu" {
      most_recent = true
 
      filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
      }
 
      owners = ["099720109477"] 
    }
    ```
    ```
    Ans. data.aws_ami.ubuntu.id
    ```
16. By default, Terraform stores its state in a file named __
    ```
    Ans. terraform.tfstate
    ```
17. The command __ is used to extract the output variables defined in the Terraform configuration.
    ```
    Ans. terraform output
    ```
18. You can use the command __ to reformat your configuration files in the standard canonical style for HCL.
    ```
    Ans. terraform fmt
    ```
19. What command can you use to display details about the resource as shown below?
    ```
    resource "aws_internet_gateway" "demo" {
      vpc_id = aws_vpc.vpc.id
      tags = {
        Name = "demo_igw"
      }
    }
    ```
    ```
    Ans. terraform state show aws_internet_gateway.demo
    ```
20. You have the following resource block that creates subnets using for_each from a variable. How would you reference subnet_b in an output block? _______
    ```
    variable "private_subnets" {
      type = map(number)
      default = {
        subnet_a = 1
        subnet_b = 2
      }    
    }
 
    resource "aws_subnet" "private_subnets" {
      for_each          = var.private_subnets
      vpc_id            = aws_vpc.vpc.id
      cidr_block        = cidrsubnet(var.vpc_cidr, 8, each.value)
      availability_zone = tolist(data.aws_availability_zones.available.names)[each.value]
 
      tags = {
        Name      = each.key
        Terraform = "true"
      }
    }
    ```

    ```
    Ans. aws_subnet.private_subnets[subnet_b].id
    ```
21. Given the code snippet below, how would you identify the arn to be used in the output block that was retrieved by the data block?
    ```
    data "aws_s3_bucket" "data_bucket" {
      bucket = "my-data-lookup-bucket-btk"
    }
    ...
 
    output "s3_bucket_arn" {
      value = ????
    }
    ```

    ```
    Ans data.aws_s3_bucket.data_bucket.arn
    ```
22. You need to start managing an existing AWS S3 bucket with Terraform that was created manually outside of Terraform. Which block type should you use to incorporate this existing resource into your Terraform configuration? ___________ and ______________ ?
    ```
    Ans. import block & resource block
    ```
23. What feature does Terraform use to map configuration to resources in the real world? _______
    ```
    Ans. terraform state
    ```
24. A Terraform module (usually the root module of a configuration) can call other modules to include their resources into the configuration. A module that has been called by another module is often referred to as _______________.
    ```
    Ans. child module
    ```
25. What Terraform command can be used to evaluate and experiment with expressions in your configuration? _______
    ```
    Ans. terraform console
    ```
26. What CLI command and flag can you use to delete a resource named azurerm_resource_group.production that is managed by Terraform?_______________
    ```
    Ans. terraform destroy -target=azurerm_resource_group.production
    ```
27. In order to make a Terraform configuration file dynamic and/or reusable, static values should be converted to use what? ______________
    ```
    Ans. input variables
    ```
28. HCP Terraform can be managed from the CLI but requires __________?
    ```
    Ans. An API token
    ```
29. What is the best and easiest way for Terraform to read and write secrets from HashiCorp Vault? _________
    ```
    Ans. Vaultprovider
    ```
30. By default, where does Terraform Community/CLI store its state file? ____________
    ```
    Ans. in current working directory
    ```
31. What Terraform command can be used to inspect the current state file for a provider resource? ____________
    ```
    Ans. terraform show <provider_resource>.name
    ```

    
    
    
