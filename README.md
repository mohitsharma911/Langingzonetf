# Introduction
This project sets up a tiered management group structure in Azure using Terraform. It provides a clear hierarchy for managing resources and policies across different environments and departments within an organization.

# Folder Structure

```
Langingzonetf/
├── .github/
│   └── workflows/
│       └── workflowpipeline.yml      # GitHub Actions CI/CD pipeline
├── modules/
│   └── managementgroups/
│       ├── main.tf                  # Terraform resources for management groups
│       ├── variables.tf             # Input variables for the module
│       └── bootstrap.sh             # Script to create secure storage for state file
├── state_storage.tf                 # (Optional) Storage account and container for state
├── README.md                        # Project documentation
```

# Getting Started

1. **Installation Process**
   - Ensure you have Terraform installed on your machine. Download it from the [Terraform website](https://www.terraform.io/downloads.html).
   - Clone this repository to your local machine.

2. **Software Dependencies**
   - Terraform (version 1.0 or higher)
   - Azure CLI (for authentication)
   - Bash (for running `bootstrap.sh`)

3. **Authentication**
   - Authenticate to Azure using the Azure CLI:
     ```
     az login
     ```

4. **Configuration**
   - Update the `modules/managementgroups/variables.tf` file with your specific configuration values, such as management group names and display names.

5. **Bootstrap State Storage**
   - Run the bootstrap script to create a secure storage account and blob container for the Terraform state file:
     ```
     cd modules/managementgroups
     chmod +x bootstrap.sh
     ./bootstrap.sh
     ```

# Build and Test

To build and apply the Terraform configuration, run the following commands in the root directory of the project:

1. Initialize the Terraform configuration:
   ```
   terraform init
   ```

2. Validate the configuration:
   ```
   terraform validate
   ```

3. Plan the deployment:
   ```
   terraform plan
   ```

4. Apply the configuration:
   ```
   terraform apply
   ```

# CI/CD

- The workflow in `.github/workflows/workflowpipeline.yml` automates linting, security scanning, and deployment using GitHub Actions.

# Contribute

Contributions are welcome! If you would like to contribute to this project, please fork the repository and submit a pull request. Ensure that your code adheres to the project's coding standards and includes appropriate tests.

For any questions or issues, feel free to open an issue in the repository.