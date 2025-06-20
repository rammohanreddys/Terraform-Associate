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

