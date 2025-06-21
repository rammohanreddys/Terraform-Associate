#### Terraform Basic Commands ####

### terraform version
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

### terraform apply
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
### terraform destroy


















