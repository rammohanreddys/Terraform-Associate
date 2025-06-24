# Terraform Provisioners and Log Level for debug:

## Terraform Provisioners:

#### What are Terraform Provisioners?

Terraform's primary purpose is to define and manage infrastructure declaratively. This means you describe the desired state of your infrastructure, and Terraform figures out how to achieve it. Provisioners, however, introduce an imperative element, allowing you to perform specific actions that might not be directly supported by a Terraform provider.
<p align="center">
  <img src="images/provisioners.JPG" alt="Description of my awesome image" width="600">
</p>

**They are generally used for:**

* **Bootstrapping:** Performing initial setup on newly created resources (e.g., installing software, configuring services).
* **Post-deployment configuration:** Customizing resources after they've been provisioned.
* **Cleanup operations:** Running commands before a resource is destroyed.

#### Types of Terraform Provisioners:

<p align="center">
  <img src="images/provisioner2.JPG" alt="Description of my awesome image" width="600">
</p>

**There are three main types of built-in provisioners:**

#### 1. local-exec:

Executes a command on the machine running Terraform (your local machine or CI/CD runner).

<p align="center">
  <img src="images/provisioner3.JPG" alt="Description of my awesome image" width="600">
</p>

```
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo Instance ${self.public_ip} created"
  }
}
```
#### 2. remote-exec:

Runs commands on the remote resource (e.g., a VM) using SSH or WinRM.

<p align="center">
  <img src="images/provisioner4.JPG" alt="Description of my awesome image" width="600">
</p>

```
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx"
    ]
  }
}

```

#### 3. file:

Uploads files from your local machine to the remote instance.

```
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "my-ssh-key"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./my-ssh-key.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
}
```

#### Additonal provisioner Types:

* **Creation-Time Provisioner(default):** 

   Runs after the resource is created.

   <p align="center">
     <img src="images/provisioner6.JPG" alt="Description of my awesome image" width="600">
   </p>

* **Destroy:** (Destroy time provisioner)

  Runs when the resource is destroyed.
     <p align="center">
     <img src="images/provisioner11.JPG" alt="Description of my awesome image" width="600">
   </p>

  ```
  provisioner "local-exec" {
    when    = "destroy"
    command = "echo Instance is being destroyed"
  }
  ```

### Note: 

1. It is not necessary to define a aws_instance resource block for provisioner to run. They can be defined inside other resource types as well.
2. We can define multiple provisioners block in a single resource block.
   <p align="center">
     <img src="images/provisioner5.JPG" alt="Description of my awesome image" width="600">
   </p>

### Failure Behaviour in Provisioners:

By default, provisioners that fail will also cause the terraform apply itself to fail. This will lead to resource being tainted and we have to re-create the resource.

<p align="center">
  <img src="images/provisioner7.JPG" alt="Description of my awesome image" width="600">
</p>

<p align="center">
  <img src="images/provisioner8.JPG" alt="Description of my awesome image" width="600">
</p>

**The on_failure setting can be used to change the default behaviour.**

|Allowed Values|Description|
|-|-|
|continue|Ignore the error and continue with creation or destruction.|
|fail|Raise an error and stop applying (the default behavior). If this is a creation provisioner, taint the resource.|

<p align="center">
  <img src="images/provisioner9.JPG" alt="Description of my awesome image" width="600">
</p>

**Reference screenshot:**
<p align="center">
  <img src="images/provisioner10.JPG" alt="Description of my awesome image" width="600">
</p>
