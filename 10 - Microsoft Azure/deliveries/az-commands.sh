#!/bin/sh

resourceGroup="diego-gomez"
password="Pa55w0rd123-"
prefix="dg-09"

echo "##[debug]Create - Network Security Group..."
## CREATE NETWORK SECURITY GROUP
az network nsg create -g $resourceGroup -n nsgVM

echo "##[debug]Create - Public IP..."
## CREATE PUBLIC IP
az network public-ip create -g $resourceGroup -n myIPVM --sku Standard

echo "##[debug]Create - Virtual Network..."
## CREATE VNET
az network vnet create \
                    --name vnet-$prefix \
                    --resource-group $resourceGroup \
                    --network-security-group nsgVM \
                    --subnet-name mySubnet

echo "##[debug]Create - Network Security Rules..."
## CREATE NETWORK SECURITY RULES
az network nsg rule create \
                        --resource-group $resourceGroup \
                        --nsg-name nsgVM \
                        --name jenkins --access allow --protocol Tcp --direction Inbound --priority 200 \
                        --source-address-prefix "*" --source-port-range "*" --destination-address-prefix "*" \
                        --destination-port-range 8080

az network nsg rule create \
                        --resource-group $resourceGroup \
                        --nsg-name nsgVM \
                        --name ssh --access allow --protocol tcp --direction inbound --priority 100 \
                        --source-address-prefix "*" --source-port-range '*' --destination-address-prefix '*' \
                        --destination-port-range 22


echo "##[debug]Create - Load Balancer..."
## CREATE LOAD BALANCER CONFIGURATION
az network lb create --resource-group $resourceGroup \
                        --name lb-$prefix \
                        --sku Standard \
                        --public-ip-address myIPVM \
                        --frontend-ip-name myFrontEnd \
                        --backend-pool-name myBackEndPool

az network lb probe create \
                    --resource-group $resourceGroup \
                    --lb-name lb-$prefix \
                    --name lbProbe$prefix \
                    --protocol tcp \
                    --port 8080

az network lb rule create --lb-name lb-$prefix \
                                --resource-group $resourceGroup \
                                --name myLoadBalancerRuleWeb \
                                --protocol tcp \
                                --frontend-port 8080 \
                                --backend-port 8080 \
                                --frontend-ip-name myFrontEnd \
                                --backend-pool-name myBackEndPool \
                                --probe-name lbProbe$prefix

numVM=( 1 2 )
for i in "${numVM[@]}"
do
    echo "##[debug]Create - Network Interface..."
    ## CREATE NETWORK INTERFACE
    az network nic create -g $resourceGroup -n nic-$prefix-$i \
                            --vnet-name vnet-$prefix \
                            --subnet mySubnet \
                            --ip-forwarding \
                            --network-security-group nsgVM \
                            --lb-name lb-$prefix \
                            --lb-address-pools myBackEndPool

    echo "##[debug]Create - Virtual Machine..."
    ## CREATE VM
    az vm create -g $resourceGroup -n vm-$prefix-$i \
                            --image UbuntuLTS \
                            --admin-username aizadmin \
                            --admin-password $password \
                            --nics nic-$prefix-$i \
                            --size Standard_D1_v2 \
                            --storage-sku Standard_LRS \
                            --os-disk-size-gb 63 \
                            --custom-data script.yml
done
