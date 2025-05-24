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
terraform show / terraform state show
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
### resource creation order in terraform

### Datasources

|Resource| Data source|
|:--|:--|
|Keywords: resource| keyword: data|
|creates, updates, destroys infrastructure| Only reads infrastructure|
|Also calles Managed Resources|Also called Data sources|


## Meta Arguments:

- depends_on
- lifecycle
- count     -> list(string) uses index pattern to create resouces
- for_each  -> set(string) uses map to create resources  
---
### Count
example:


```
main.tf
---
  resource local_file pet {
  filename = var.filename[count.index]
  count = 3
  }

variables.tf
---

  variable filename {
  default = [
   "/root/pets.txt",
   "/root/dogs.txt",
   "/root/cats.txt",
    ]
  }
```

  **Explanantion:** 
  * Terraform apply gives 3 files created and variables of file names were store in this order - index[0] = /root/pets.txt, index[1]= /root/dogs.txt, index[2]= /root/cats.txt 
  * when you remove one value from variable index (/root/pets.txt), it will delete removed index value and adjust other two variable index values index[1] = index[0], index[2]=index[1]
  * Finally two files were created and its index value are index[0]=/root/dogs.txt, index[1]=/root/cats.txt.

  ### Other way to create the multiple files with count with repsect to variable block:
  

``` 
main.tf
---
  resource local_file pet {
  filename = var.filename[count.index]
  count = length(var.filename)
  }

variables.tf
---
  variable filename {
  type = list(string)
  default = [
   "/root/pets.txt",
   "/root/dogs.txt",
   "/root/cats.txt",
   "/root/cows.txt",
   "/root/ducks.txt"
    ]
  }
``` 

Note: This time it will create total number of files equal to length of the variable index, which is 5

### for_each:
example:

```
main.tf
---
  resource local_file pet {
  filename = each.value
  for_each = var.filename
  }

variables.tf
---
  variable filename {
  type = set(string)
  default = [
   "/root/pets.txt",
   "/root/dogs.txt",
   "/root/cats.txt",
    ]
  }
```
### Other way to define for_each main.tf file:

```
main.tf
---
  resource local_file pet {
  filename = each.value
  for_each = toset(var.filename)
  }

variables.tf
---
  variable filename {
  type = list(string)
  default = [
   "/root/pets.txt",
   "/root/dogs.txt",
   "/root/cats.txt",
    ]
  }
```

**Explanation:**
Terraform apply gives creation of 3 files with map function. (key:value pair). When you remove one of file name from variable list, it will just delete matched key file and keep other files same.
















   


