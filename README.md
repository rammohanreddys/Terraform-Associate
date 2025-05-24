# Terraform-Associate

**********
Credentials: 
Kodekloud Community login: moh*****7@gmail.com/Ra*@K****2526
**********

## HCL Basics:

https://utlabs.kodekloud.com/courses/udemy-labs-terraform-for-beginners/

**********
Credentials: 
Kodekloud Lab login: moh*****7@gmail.com/Ra*@K****2526
**********

### Resouce_types:
local_file
local_sensitive_file

### Providers

1. Official Provider - AWS, GCP, AZURE etc..
2. Partner Provider  - Heroku, digital ocean, bigip etc..
3. Community Provider - Active Directory, ucloud, netapp-gcp ect..

### Multiple providers

random provider


### variable data types:

1. string
2. number
3. boolean
4. list
5. map
6. object
7. set
8. tuple

Try an example for each data type with variable call

### types of variables in terraform

#### variable definition precedence

1. from envrionment variables (TF_VAR_filename or export 
2. from terraform.tfvars
3. from *.auto.tfvars
4. from command line arguments

precedence order -> 

### Resource dependencies (implicit /explicit) reference expression

### how to call resource dependency from one resource to another resource attribute

### output variables

### terraform statefile / remote backend

### terraform command examples

terraform init
terraform plan
terraform apply
terraform validate
terraform fmt
terraform providers
terraform output
terraform apply -refresh-only
terraform refresh
terraform graph
terraform providers mirror 

### immutable vs mutable infrastructure

configuration drift

### life cycle rules

- create_before_destroy    (create resource fisrt and then destroy older)

```
lifecycle {
  create_before_destroy = true
}
```
- prvent_destroy             (Prevents destroy of a resource)

```
lifecycle {
  prvent_destroy = true
}
```

- ingore_changes            (Ingroe chnages to resource attributes (specific/all)

```
lifecycle {
  ignore_changes = [tags]
 }
```






















   


