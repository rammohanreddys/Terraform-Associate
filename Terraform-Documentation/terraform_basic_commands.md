#### Terraform Basic Commands ####

### terraform version:
```
terraform version                                      # Displays the installed version of Terraform on your system
```

### terraform init: 
```
terraform init                                         # Discovers Required Providers / Downloads Providers / Stores Plugins Locally
terraform init -upgrade                                # Upgrade Backend Configuration / Upgrade Provider Plugins / Upgrade Modules
terraform init -input=false                            # Terraform to initialize your working directory, but to not prompt for any input.
terraform init -backend-config=./backend-dev.tfvars    # Terraform to load backend configuration from a specific file.
terraform init -reconfigure                            # Terraform to reinitialize the backend, effectively discarding any previously saved backend configuration.
terraform init -migrate-state -force-copy              # Read the existing state / Prompt for migration / Write to new backend.
terraform init -get=false                              # The -get=false flag tells Terraform not to download remote modules.
```

### terraform plan: 

```
terraform plan                                         # Parses Configuration/ Refreshes State / Compares Desired vs. Current State / Generates an Execution Plan.
terraform plan -var 'key=value'                        # Pass a variable inline
terraform plan -var-file="file.tfvars"                 # Pass a file with variable values.
terraform plan -out=planfile                           # Save the generated execution plan to a file
terraform plan -target=resource_name                   # Target a specific resource to plan
```

### terraform validate:
```
terraform validate                                     # terraform validate performs a static analysis of your .tf files
                                                       # Syntax errors:
                                                       # Unsupported arguments, missing fields, and type mismatches:
                                                       # Valid provider requirements
                                                       # Correct usage of resources, data sources, and modules
                                                       # Missing or invalid variable types
                                                       # Incorrect nesting or closing of brackets
```

### terraform fmt:
```
terraform fmt                                          # automatically format your Terraform configuration files (*.tf, *.tfvars) to a canonical style for better readability and consistency.
terraform fmt -recursive                               # Format files in all subdirectories.
terraform fmt -check                                   # Check if files are correctly formatted without changing them (used in CI/CD)
terraform fmt -diff                                    # Show differences between original and formatted files.
terraform fmt -check -recursive                        # Returns non-zero exit code if any file is improperly formatted.
```

### terraform apply:
```
terraform apply                                        # Command is used to provision or modify your infrastructure as described in your Terraform configuration files
                                                       # It takes the planned execution and applies the changes to real infrastructure, such as creating, updating, or destroying resources.
terraform apply tfplan                                 # If you already created a plan using "terraform plan -out=tfplan", you can run: (Non Interactive Mode, Ex: CICD pipeline)
terraform apply -auto-approve                          # Skips confirmation prompt
terraform apply -target=aws_instance.my_server         # Targeting Specific Resources
terraform apply -var="region=us-east-1" -var="instance_type=t2.micro"     # Input Variables
terraform apply -var-file="dev.tfvars"                 # use a variables file
terraform apply -parallelism=5                         # Limit the number of concurrent resource operations (default is 10). Useful for large-scale deployments.
terraform apply -refresh=false                         # Whether to update the state with real-world infrastructure before applying changes.
terraform apply -lock=false                            # Prevents Terraform from holding a state lock during the operation.
terraform apply -input=false                           # Disables all of Terraform's interactive prompts, including prompts for variable input and plan confirmation
terraform apply -replace=RESOURCE_ADDRESS              # Instructs Terraform to plan to replace the specified resource instance, even if it would normally be updated or remain unchanged.
terraform apply -destroy                               # altervative for "terraform destroy". To destroy all infrastructure resources managed by the current Terraform configuration.
```

### terraform destroy:
```
terraform destroy                                     # Command is used to destroy (tear down) all infrastructure managed by your Terraform state file
terraform destroy -auto-approve                       # Skips confirmation prompt
terraform destroy -var="region=us-central1"           # Pass variables needed by the config.
terraform destroy -refresh=false                      # Prevent refreshing state from real infrastructure before destroy.
terraform destroy -target=google_compute_instance.vm1 # Destroys a specific resource only.
```

### terraform output:

**Syntax:**
```
terraform output [options] [<NAME>]
```

```
terraform output                                      # The terraform output command is used to view the values of output variables from your Terraform state after a successful apply.
                                                      # These are defined in your .tf files using the output block and are often used to expose things like IP addresses, URLs, resource names, etc.
```

### terraform refresh:

* The terraform refresh command is used to update the Terraform state file by re-reading the real infrastructure from your cloud provider. It brings the state in sync with reality without changing any resources.
* The terraform refresh command is used to synchronize your Terraform state file with the actual current state of your infrastructure resources in the cloud or on-premises.
```
terraform plan -refresh-only                         # This command will also perform a refresh, but it will only show you the proposed changes (drift) and will not modify your state file. It acts as a "dry run" for apply -refresh-only.

terraform apply -refresh-only                        # This command will perform a refresh of your state file and then present you with a plan of the detected changes (drift).
                                                     # It will then prompt for confirmation before committing those changes to your state file
```

### terraform show:

The terraform show command displays human-readable output of Terraform state or plan files, allowing you to inspect your infrastructure configuration, outputs, resources, and their current values.

terraform show allows you to inspect:
* Current State of Resources
* Outputs
* Data Sources
* Modules
* Sensitive Data
```
terraform show                                        # Show current state
terraform show tfplan                                 # Show a saved plan file
```
      

### terraform get:
```
terraform get                                         # command is used to download and install modules needed for your Terraform configuration.
terraform get -update                                 # Re-download all modules, even if already installed. Useful if you’ve changed module source or versions.
```

### terraform env:
```
terraform env                                         # The terraform env command is used to manage Terraform workspaces in older versions of Terraform (< v0.10). In modern versions (≥ v0.10),
                                                      # Terraform env has been deprecated and replaced by terraform workspace.
```

### terraform console:
```
terraform console                                    # Command opens an interactive shell where you can evaluate Terraform expressions using the current state, variables, resources, and functions.
terraform console -state=terraform.tfstate           # You can point the console to a specific state file.
```

### terraform graph:
```
terraform graph                                      # command is used to generate a visual representation (graph) of the dependency relationships in your Terraform configuration or state.
                                                     # It outputs a DOT format (Graphviz) description that can be converted into diagrams.
```

### terraform import:

**Use Cases:**
* Migrating existing cloud infrastructure to Terraform
* Taking control of manually created resources
* Avoiding downtime during infrastructure refactoring
```
Syntax:
terraform import [options] <resource_type.resource_name> <resource_id>

Example:
terraform import aws_instance.web i-1234567890abcdef0
```
**Note:** 
* Terraform does not generate the resource block — you must already have a matching resource block in your .tf files.
* After import, run:
  ```
  terraform plan
  ```

### terraform login: (for Terraform cloud)

* The terraform login command is used to authenticate your local Terraform CLI with Terraform Cloud or Terraform Enterprise. 
* It securely stores an API token so Terraform can access your workspaces, state files, and configurations stored in the cloud.

```
terraform login                                          # command is used to authenticate your local Terraform CLI with Terraform Cloud or Terraform Enterprise
terraform login tfe.example.com                          # 
```
This will:
* Open a browser window
* Ask you to log into Terraform Cloud
* Generate a token and save it to:
```
~/.terraform.d/credentials.tfrc.json
```

### terraform state 
```
terraform state show aws_instance.my_ec2                                  # show details stored in Terraform state for the resource
terraform state pull > terraform.tfstate                                  # download and output terraform state to a file
terraform state mv aws_iam_role.my_ssm_role module.custom_module          # move a resource tracked via state to different module
terraform state replace-provider hashicorp/aws registry.custom.com/aws    # replace an existing provider with another
terraform state list                                                      # list out all the resources tracked via the current state file
terraform state rm  aws_instance.myinstace                                # unmanage a resource, delete it from Terraform state file
```

### terraform workspace:
```
terraform workspace new mynewworkspace                                    # create a new workspace
terraform workspace select default                                        # change to the selected workspace
terraform workspace list                                                  # list out all workspaces
```

### terraform taint/untaint:
```
terraform taint aws_instance.my_ec2                                       # taints resource to be recreated on next apply
terraform untaint aws_instance.my_ec2                                     # Remove taint from a resource
terraform force-unlock LOCK_ID                                            # forcefully unlock a locked state file, LOCK_ID provided when locking the State file beforehand
```


  


















