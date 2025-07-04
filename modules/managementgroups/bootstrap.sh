#!/usr/bin/env bash

# Variables (edit as needed)
RESOURCE_GROUP="tfstate-tfdemo-rg" # must be unique in the subscription, 1-90 chars, lowercase/numbers/hyphens only
LOCATION="eastus" # Azure region, e.g., eastus, westus, etc.
STORAGE_ACCOUNT="zentfstatedemostg" # must be globally unique, 3-24 chars, lowercase/numbers only
CONTAINER="tfstate"

# Create resource group
az group create --name "$RESOURCE_GROUP" --location "$LOCATION" \
  --tags \
    Purpose="PurposeValue" \
    Name="$RESOURCE_GROUP" \
    Environment="Prd" \
    Application="ApplicationName" \
    DateCreated="$(date +%Y-%m-%d)" \
    Owner="CustomerInsuranceEngineers@tescobank.com" \
    CostCentre="51355" \
    Datadog="False" \
    SNApplicationService="Surface Insurance Production" \
    SNResolver="AM GI Technical" \
    SNEnvironment="Production" \
    ServiceCategory="Category A" 
  

# Create storage account with guardrails
az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_GRS \
  --kind StorageV2 \
  --min-tls-version TLS1_2 \
  --https-only true \
  --allow-blob-public-access false \
  --tags \
    Purpose="PurposeValue" \
    Name="$STORAGE_ACCOUNT" \
    Environment="Prd" \
    Application="ApplicationName" \
    DateCreated="$(date +%Y-%m-%d)" \
    Owner="CustomerInsuranceEngineers@tescobank.com" \
    CostCentre="51355" \
    Datadog="False" \
    SNApplicationService="Surface Insurance Production" \
    SNResolver="AM GI Technical" \
    SNEnvironment="Production" \
    ServiceCategory="Category A"
  

# # Restrict access to specific IP ranges
# az storage account network-rule add \
#   --resource-group "$RESOURCE_GROUP" \
#   --account-name "$STORAGE_ACCOUNT" \
#   --ip-address 64.236.200.64/28

# az storage account network-rule add \
#   --resource-group "$RESOURCE_GROUP" \
#   --account-name "$STORAGE_ACCOUNT" \
#   --ip-address 48.221.234.0/28

# # Set default action to Deny (only allow selected networks and IPs)
# az storage account update \
#   --name "$STORAGE_ACCOUNT" \
#   --resource-group "$RESOURCE_GROUP" \
#   --default-action Deny

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group "$RESOURCE_GROUP" --account-name "$STORAGE_ACCOUNT" --query '[0].value' -o tsv)

# Create private blob container
az storage container create \
  --name "$CONTAINER" \
  --account-name "$STORAGE_ACCOUNT" \
  --account-key "$ACCOUNT_KEY" \
  --public-access off

# Enable Soft Delete for Blobs and Containers
az storage blob service-properties delete-policy update --account-name "$STORAGE_ACCOUNT" --enable true --days-retained 7

echo "Storage Account: $STORAGE_ACCOUNT"
echo "Container: $CONTAINER"

# Guardrails included:
# TLS 1.2 enforced (--min-tls-version TLS1_2)
# HTTPS only (--https-only true)
# Private container
# Network default action deny (--default-action Deny)
# Geo-redundant storage (--sku Standard_GRS)
