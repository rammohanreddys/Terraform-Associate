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

# 1. Understand Infrastructure as Code (IaC) concepts:

## What is Terraform?

HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. You can then use a consistent workflow to provision and manage all of your infrastructure throughout its lifecycle. Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.


