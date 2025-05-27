## Exam Curriculum:

  <details>
    <summary>1. Understand Infrastructure as Code (IaC) concepts</summary>
    
        - Explain what IAC is
        - Describe advantages of IAC pattern
  </details>
  
  
  <details>
  <summary>2. Understand the purpose of Terraform (vs Other IAC)</summary>
  
        - Explain multi-cloud and provider-agnostic benefits
        - Explain the benefits of state
  </details>
  
  <details>
    <summary>3. Understand Terraform basics</summary>
  
        - Install and version terraform providers
        - Describe plugin-based architecture
        - Write Terraform configuration using multiple providers
        - Describe how terraform finds and fetches providers
  </details>
  
  <details>
    <summary>4.  Use Terraform outside the core workflow</summary>
    
        - Describe when to use 'terraform import' to import existing infrastructure into your terraform state
        - Use 'terraform state' to view terraform state
        - Describe when to enable verbose logging and what the outcome/value is 
  </details>
  
  <details>
    <summary>5. Interact with Terraform Modules</summary>
    
        - Contrast and use different module source options including the public Terraform Registry
        - Interact with module inputs and outputs
        - Describe variable scope within modules/child modules
        - Set module version
  </details>
  
  <details>
    <summary>6. Use the core Terraform workflow</summary>
    
        - Describe Terraform workflow ( Write -> Plan -> Create )
        - Initialize a Terraform working directory (terraform init)
        - Validate a Terraform configuration (terraform validate)
        - Generate and review an execution plan for Terraform (terraform plan)
        - Execute changes to infrastructure with Terraform (terraform apply)
        - Destroy Terraform managed infrastructure (terraform destroy)
        - Apply formatting and style adjustments to a configuration (terraform fmt)
  </details>
  
  <details>
    <summary>7. Implement and maintain state</summary>
    
        - Describe default local backend
        - Describe state locking
        - Handle backend and cloud integration authentication methods
        - Differentiate remote state back end options
        - Manage resource drift and Terraform state
        - Describe backend block and cloud integration in configuration
        - Understand secret management in state files
  </details>
  
  <details>
    <summary>8. Read, generate, and modify configuration</summary>
  
        - Demonstrate use of variables and outputs
        - Describe secure secret injection best practice
        - Understand the use of collection and structural types
        - Create and differentiate resource and data configuration
        - Use resource addressing and resource parameters to connect resources together
        - Use HCL and Terraform functions to write configuration
        - Describe built-in dependency management (order of execution based)
  </details>
  
  <details>
    <summary>9. Understand HCP Terraform capabilities</summary>
    
        - Explain how HCP Terraform helps to manage infrastructure
        - Describe how HCP Terraform enables collaboration and governance  
  </details>
  
<hr style="height:3px;border:none;color:#333;background-color:#333;" />

# Terraform Configuration Language:

* Files and Directories
* Syntax
* Resources
* Data Sources
* Providers
* Variables & Outputs
* Modules
* Expressions
* Functions
* Terraform settings
* State
* Upgrade Guidlines

# 1. Understand Infrastructure as Code (IaC) concepts:

## What is Terraform?

HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. You can then use a consistent workflow to provision and manage all of your infrastructure throughout its lifecycle. Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.

## How does Terraform work?

Terraform creates and manages resources on cloud platforms and other services through their application programming interfaces (APIs). Providers enable Terraform to work with virtually any platform or service with an accessible API.

![image](https://github.com/user-attachments/assets/5ced781a-2ce3-4d36-8e33-413fb80af114)

HashiCorp and the Terraform community have already written thousands of providers to manage many different types of resources and services. You can find all publicly available providers on the Terraform Registry, including Amazon Web Services (AWS), Azure, Google Cloud Platform (GCP), Kubernetes, Helm, GitHub, Splunk, DataDog, and many more.

The core Terraform workflow consists of three stages:

* **Write:** You define resources, which may be across multiple cloud providers and services. For example, you might create a configuration to deploy an application on virtual machines in a Virtual Private Cloud (VPC) network with security groups and a load balancer.
* **Plan:** Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration.
* **Apply:** On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies. For example, if you update the properties of a VPC and change the number of virtual machines in that VPC, Terraform will recreate the VPC before scaling the virtual machines.

![image](https://github.com/user-attachments/assets/165ec32b-4add-4baf-afe0-a98731042a59)

## Why Terraform?

- Manage any infrastructure
- Track your infrastructure
- Automate changes
- Standardize configurations
- Collaborate

## What is Infrastructure as Code with Terraform?

Infrastructure as Code (IaC) tools allow you to manage infrastructure with configuration files rather than through a graphical user interface. IaC allows you to build, change, and manage your infrastructure in a safe, consistent, and repeatable way by defining resource configurations that you can version, reuse, and share.

Terraform is HashiCorp's infrastructure as code tool. It lets you define resources and infrastructure in human-readable, declarative configuration files, and manages your infrastructure's lifecycle. Using Terraform has several advantages over manually managing your infrastructure:

* Terraform can manage infrastructure on multiple cloud platforms.
* The human-readable configuration language helps you write infrastructure code quickly.
* Terraform's state allows you to track resource changes throughout your deployments.
* You can commit your configurations to version control to safely collaborate on infrastructure.

### Manage any infrastructure:

Terraform plugins called providers let Terraform interact with cloud platforms and other services via their application programming interfaces (APIs). HashiCorp and the Terraform community have written over 1,000 providers to manage resources on Amazon Web Services (AWS), Azure, Google Cloud Platform (GCP), Kubernetes, Helm, GitHub, Splunk, and DataDog, just to name a few. Find providers for many of the platforms and services you already use in the Terraform Registry. If you don't find the provider you're looking for, you can write your own.

### Standardize your deployment workflow:

Providers define individual units of infrastructure, for example compute instances or private networks, as resources. You can compose resources from different providers into reusable Terraform configurations called modules, and manage them with a consistent language and workflow.

Terraform's configuration language is declarative, meaning that it describes the desired end-state for your infrastructure, in contrast to procedural programming languages that require step-by-step instructions to perform tasks. Terraform providers automatically calculate dependencies between resources to create or destroy them in the correct order.

![image](https://github.com/user-attachments/assets/f34f00ff-ab93-47ae-a9b9-74cd058d400e)

To deploy infrastructure with Terraform:

* **Scope** - Identify the infrastructure for your project.
* **Author** - Write the configuration for your infrastructure.
* **Initialize** - Install the plugins Terraform needs to manage the infrastructure.
* **Plan** - Preview the changes Terraform will make to match your configuration.
* **Apply** - Make the planned changes.

### Track your infrastructure:

Terraform keeps track of your real infrastructure in a state file, which acts as a source of truth for your environment. Terraform uses the state file to determine the changes to make to your infrastructure so that it will match your configuration.

### Collaborate:

Terraform allows you to collaborate on your infrastructure with its remote state backends. When you use HCP Terraform (free for up to five users), you can securely share your state with your teammates, provide a stable environment for Terraform to run in, and prevent race conditions when multiple people make configuration changes at once.

You can also connect HCP Terraform to version control systems (VCSs) like GitHub, GitLab, and others, allowing it to automatically propose infrastructure changes when you commit configuration changes to VCS. This lets you manage changes to your infrastructure through version control, as you would with application code.

## Terraform Editions:

### Terraform Editions Overview

As your organization adopts infrastructure as code (IaC), you will encounter increasingly complex technical and collaboration challenges. We offer three Terraform editions designed to help you solve them.

### Terraform Community Edition

Terraform Community Edition is a free, downloadable tool that you interact with on the command line. It lets you provision infrastructure on any cloud provider and manages configuration, plugins, infrastructure, and state.

### Why Terraform Community Edition?

Terraform Community Edition lets you:

* Adopt infrastructure as code and use a common configuration language to provision thousands of different types of resources and services.
* Codify your infrastructure so that you can check configuration files into a version control system (VCS) to safely manage contributions. Manually pull the most up-to-date version to perform Terraform operations.
* Use and publish public infrastructure templates called modules to implement industry and organization best practices, group your infrastructure into logically-related components, and deploy infrastructure more quickly.

### HCP Terraform

HCP Terraform is a SaaS application that runs Terraform in a stable, remote environment and securely stores state and secrets. It includes a rich user interface that helps you better understand your Terraform operations and resources, allows you to define role-based access controls, and offers a private registry for sharing modules and providers. HCP Terraform also integrates with the Terraform CLI and connects to common version control systems (VCS) like GitHub, GitLab, and Bitbucket. When you connect an HCP Terraform workspace to a VCS repository, new commits and changes can automatically trigger Terraform plans. HCP Terraform also offers an API, allowing you to integrate it into existing workflows.

Many HCP Terraform features are free for small teams; we offer paid plans for larger organizations with additional collaboration and governance features.

#### Why HCP Terraform?

HCP Terraform lets you:

* Run Terraform from the local CLI or in a remote environment, trigger operations through your version control system, or use an API to integrate HCP Terraform into your existing workflows.
* Ensure that only approved teams can access, edit, and provision infrastructure with HCP Terraform workspaces, single sign-on, and role-based access controls.
* Securely store and version Terraform state remotely, with encryption at rest. Versioned state files allow you to access state file history.
* Publish configuration modules in the HCP Terraform private registry that define approved infrastructure patterns. For example, a module may allow users to choose the cloud provider on which to deploy their Java application. This allows consumers to implement your organization’s best practices without becoming infrastructure or cloud experts.
* Enforce best practices and security rules with the Sentinel embedded policy as code framework. For example, policies may restrict regions for production deployments.

## Terraform Enterprise

Terraform Enterprise allows you to set up a self-hosted distribution of HCP Terraform. It offers customizable resource limits and is ideal for organizations with strict security and compliance requirements.

### Why Terraform Enterprise?

Terraform Enterprise lets you:

* Set up a private instance of HCP Terraform with dedicated support from HashiCorp.
* Accommodate advanced security and compliance requirements. Terraform Enterprise supports several types of installations, including air gapped and active/active architecture, and allows private networking and job scaling for better performance.

# 2. Understand the purpose of Terraform (vs Other IAC)

### Multi-Cloud Deployment

Provisioning infrastructure across multiple clouds increases fault-tolerance, allowing for more graceful recovery from cloud provider outages. However, multi-cloud deployments add complexity because each provider has its own interfaces, tools, and workflows. Terraform lets you use the same workflow to manage multiple providers and handle cross-cloud dependencies. This simplifies management and orchestration for large-scale, multi-cloud infrastructures.

#### Resources

Try our Deploy Federated Multi-Cloud Kubernetes Clusters tutorial to provision Kubernetes clusters in both Azure and AWS environments, configure Consul federation with mesh gateways across the two clusters, and deploy microservices across the two clusters to verify federation.
Browse the Terraform Registry to find thousands of publicly available providers.

## Terraform versus Alternatives Overview:

Terraform provides a flexible abstraction of resources and providers. This model allows for representing everything from physical hardware, virtual machines, and containers, to email and DNS providers. Because of this flexibility, Terraform can be used to solve many different problems. This means there are a number of existing tools that overlap with the capabilities of Terraform. We compare Terraform to a number of these tools, but it should be noted that Terraform is not mutually exclusive with other systems. It can be used to manage a single application, or the entire datacenter.

Learn how Terraform compares to:

* Chef, Puppet, etc.
* CloudFormation, Heat, etc.
* Boto, Fog, etc.
* Custom Solutions

### Terraform vs. Chef, Puppet, etc.

Configuration management tools install and manage software on a machine that already exists. Terraform is not a configuration management tool, and it allows existing tooling to focus on their strengths: bootstrapping and initializing resources.

Terraform focuses on the higher-level abstraction of the datacenter and associated services, while allowing you to use configuration management tools on individual systems. It also aims to bring the same benefits of codification of your system configuration to infrastructure management.

If you are using traditional configuration management within your compute instances, you can use Terraform to configure bootstrapping software like cloud-init to activate your configuration management software on first system boot.

## 🎯 Purpose of Terraform State

Terraform state is a crucial component of how Terraform operates. It's essentially a snapshot of the infrastructure that Terraform manages, mapping the resources defined in your configuration files to the real-world resources that exist in your cloud provider or on-premises environment.

### Core Purpose: Tracking and Mapping Infrastructure
The primary purpose of Terraform state is to:

#### 1. Map Configuration to Real Infrastructure: 
Terraform needs to know which real-world resources (e.g., an AWS EC2 instance, an Azure Virtual Machine, a Kubernetes deployment) correspond to the resource blocks defined in your .tf configuration files. The state file provides this mapping.

#### 2. Track Metadata: 
It stores metadata about your resources, such as their IDs, attributes, and dependencies, which are necessary for Terraform to manage them effectively.

### Key Functions and Benefits of Terraform State:

| Key Function | Benefits of Terraform State|
|:---|:---|
|**Resource Mapping and Identification:**|When you run terraform apply, Terraform consults the state file to understand the current state of your infrastructure. It then compares this to your desired state (defined in your .tf files) to determine what changes need to be made. It allows Terraform to know, for instance, that aws_instance.web_server in your code refers to a specific EC2 instance with a particular ID in AWS.|
|**Performance Optimization (Diffing):**|Instead of querying your cloud provider for the full details of every resource every time you run terraform plan or terraform apply, Terraform uses the state file as a cached representation of your infrastructure. This significantly speeds up the planning and application process by allowing Terraform to quickly identify differences.|
|**Dependency Management:**|Terraform builds a dependency graph based on your configuration. The state file helps in understanding these relationships, ensuring resources are created, updated, or destroyed in the correct order. For example, a database instance must exist before an application server can connect to it.|
|**Preventing Resource Conflicts:**|In collaborative environments, state locking (when using remote state) prevents multiple users from making conflicting changes to the same infrastructure simultaneously. If one user is applying changes, the state file is locked, preventing others from initiating an apply until the first operation completes.|
|**Enabling Remote State for Collaboration and Durability:**|While you can use a local terraform.tfstate file, it's highly recommended for teams to use remote state (e.g., stored in an S3 bucket, Azure Blob Storage, HashiCorp Cloud, etc.).Remote state provides a centralized, shared, and versioned record of your infrastructure, making collaboration possible and reducing the risk of state corruption or loss.|
|**Managing Sensitive Data (with caution):**|By default, some sensitive data (like database passwords or API keys) might be stored in the state file. While Terraform attempts to mark these as sensitive and redact them from console output, it's crucial to understand that the state file itself can contain them. Best practice dictates using secret management tools (like HashiCorp Vault) and referencing secrets in your configuration rather than hardcoding them or relying solely on state file redaction.|


### How it Works (Briefly):

When you run terraform apply, Terraform performs the following steps:

* **Reads Configuration**: Parses your .tf files to understand the desired state.
* **Reads Current State:** Reads the existing terraform.tfstate file (or fetches it from remote state).
* **Refreshes State (Optional but common):** Connects to the cloud provider to verify the actual current state of resources and updates the in-memory state representation.
* **Compares States:** Diffs the desired state with the current actual state to determine what changes (create, update, delete) are needed.
* **Applies Changes:** Executes the necessary API calls to the cloud provider.
* **Updates State File:** After successful application, it writes the new, updated state of the infrastructure back to the terraform.tfstate file (or remote state backend).

### Important Considerations:

* **Never Manually Edit State:** Directly modifying the terraform.tfstate file is highly discouraged and can lead to inconsistencies and infrastructure drift. Always use terraform state commands for any state manipulation.
**Secure State:** The state file contains sensitive information about your infrastructure. Ensure your remote state backend is properly secured with access controls and encryption.
**State Locking:** Always use a backend that supports state locking when working in a team to prevent concurrent modifications.

### 📦 Where State Lives

* **Local backend:** A terraform.tfstate file stored locally.

* **Remote backend (recommended for teams):**
  * AWS S3, Azure Blob, GCS, or Terraform Cloud (HCP)
  * Supports state locking and collaboration

### 🛠️ Example: Viewing State

```
# terraform show
# terraform state list
# terraform state show <resource>
```

## Managing Resources in Terraform State:

Terraform state management is essential when you're dealing with changes to infrastructure that aren’t always reflected through configuration changes. It gives you tools to inspect, modify, or recover resources within the state file, without touching the actual infrastructure.

### 🧰 Core Commands to Manage Terraform State:

|Command|Purpose|
|:--|:--|
|terraform state list|Lists all tracked resources|


Example:
```
1. Viewing All Resources:
# terraform state list

2. Removing a Resource from State (without destroying it)
# terraform state rm aws_instance.example

3. Renaming or Refactoring a Resource
# terraform state mv aws_instance.old aws_instance.new

4. Importing Existing Infrastructure
# terraform import aws_instance.example i-0ab1234567890cdef

5. Inspecting Resource Details
terraform state show aws_instance.example

6. terraform taint <resource_address> / terraform untaint <resource_address>
terraform taint aws_instance.web_server[0]
```

* **Taint**: Explicitly marks a managed resource for recreation during the next apply. Terraform will plan to destroy and then create this resource, even if its configuration hasn't changed.
* **Untaint**: Removes the tainted status, meaning the resource will only be modified if its configuration changes.

### Note:
**When to use:** When you suspect a resource is in a bad state and needs to be rebuilt from scratch, but you don't want to manually destroy it first.








