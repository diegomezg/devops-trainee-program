## 02 – Working on teams and managing backends

Trainees will create the objects needed for a backend in Azure, using first a local backend, and then using a remote backend. 


## Part 1 - work by yourself

* Use the code from activity 1, and change the path of the state file.
* Document, with text and screenshots how you did it.

You can find some help here:

 https://www.terraform.io/docs/language/settings/backends/local.html

##### Part 2 - work in pairs

1. Create a storage account and a blob container in azure using az cli commands

```
RG_NAME=$1
STORAGE_NAME=$2
CONTAINER_NAME=$3
 
# Create storage account
az storage account create --resource-group $RG_NAME --name $STORAGE_NAME --sku Standard_LRS --encryption-services blob
 
# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RG_NAME --account-name $STORAGE_NAME --query '[0].value' -o tsv)
 
# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_NAME --account-key $ACCOUNT_KEY
```

2. Create a Service principal in azure 


```
SUB_ID="replace this"
RG_NAME="replace this"

az ad sp create-for-rbac -n "replace this" --role Contributor --scopes /subscriptions/$SUB_ID/resourceGroups/$RG_NAME

```
3. Export the env variables of the service principal 
```
export ARM_SUBSCRIPTION_ID=XXX
export ARM_TENANT_ID=XXX
export ARM_CLIENT_ID=XXX
export ARM_CLIENT_SECRET=XXX
```

4. Create the main.tf, variables.tf, provider.tf, and terraform.tf files

```
#provider.tf
provider "azurerm" {
  features {}
}

#terraform.tf
terraform {
  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = "~> 2.0"
  }
}
```
5. Add the code to build a vnet and a subnet in main.tf:

Since your resource group already exists, you need a data block instead of a resource block.
```
data "azurerm_resource_group" "my-rg" {
  name = "name of your resource group"
}


resource "azurerm_virtual_network" "network" {
  name                = "replace this"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.my-rg.location
  resource_group_name = data.azurerm_resource_group.my-rg.name
}

## add your subnet module code here
```

6. Run terraform init, plan and apply

7. Publish the code in a repo, and share the service principal credentials with your team (in pairs) 

The other person in the team must clone the repo, and modify something in the main.tf file

You could change:
- The name of the vnet
- The address space of the subnet
- You could add tags to both resources 
- You could add a second subnet
- Or all of the above!

By using the same credentials as env variables, you will be able to work on the configuration located in the Azure cloud, as a collaborative team.

8. Run terraform init, plan and apply

9. Validate the remote state:

- Take a screenshot of the details of the resources after step 6 and after step 8
2. Same trainee will run the `init` `plan` & `apply`
3. The other trainee will add another security group and run the same terraform cycle to deploy it.


##### Expected deliverables 

Code snippet for the backend configuration and proof of multiple users successfully working on the same infra using same remote state file. 


##### Measuring instrument 

| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
|  Remote backend setup | Service principal and backend are created | 40%  |
|   Configuration | Azure resources are deployed  |  40% |
|  Remote backend is used | modifications were made after the initial apply and proof is included |  20% |


