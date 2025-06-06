# Introduction
This project sets up a tiered management group structure in Azure using Terraform. It aims to provide a clear hierarchy for managing resources and policies across different environments and departments within an organization.

# Getting Started
To get started with this project, follow the steps below:

1. **Installation Process**
   - Ensure you have Terraform installed on your machine. You can download it from the [Terraform website](https://www.terraform.io/downloads.html).
   - Clone this repository to your local machine.

2. **Software Dependencies**
   - Terraform (version 1.0 or higher)
   - Azure CLI (for authentication)

3. **Authentication**
   - Authenticate to Azure using the Azure CLI:
     ```
     az login
     ```

4. **Configuration**
   - Update the `variables.tf` file with your specific configuration values, such as management group names and display names.

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

# Contribute
Contributions are welcome! If you would like to contribute to this project, please fork the repository and submit a pull request. Ensure that your code adheres to the project's coding standards and includes appropriate tests.

For any questions or issues, feel free to open an issue in the repository.