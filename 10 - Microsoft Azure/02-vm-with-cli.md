# Microsoft Azure
# 02 - Creating a Virtual Machine


[This tutorial](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-cli) guides you on how to create a VM using the azure cli.

Please follow the tutorial as a guide, but do the following things different from the tutorial:

| Tutorial | You| 
| - | - |
| Image used: win2016datacenter | Image to use: Redhat|
| Uses the shell in a browser | Use the cli in your computer |
| Creates a new resource group | Use the one you already have |
| Connects via password| Connect via SSH key |
| Installs a windows web server | Install nginx web server |

How to install nginx
```
sudo apt-get -y update
sudo apt-get -y install nginx
```

## Deliverables

Upload a MD file with the following content:

* Document the commands that you used to achieve the instructions.
* Take a screenshot of the output of when you run the `vm create` command.
* Modify the html file for nginx to include your name in the welcome page
* Take a screenshot of the webpage in your browser, displaying your modified html landing page.

## Extra points (optional)

1. Replace the entire HTML directory with a colorful and fun template that you can get from [html5up](https://html5up.net/)

2. Install nginx using the custom-data attribute instead of manual commands after launch.

# Evaluation

| Metric name        | Metric description                                | % Value |
|:------------------ |:--------------------------------------------------|:--:|
| OS image  | Command with a redhat image is documented| 25% |
| ssh key | Command that uses a ssh key as authentication for the VM is documented | 25% |
| Public IP | Output of azcli where the vm is created is included as a screenshot | 25%|
| Public IP | Browser with modified landing page and visible public IP is included in a screenshot | 25%|


| Metric name        | Metric description                                | % Value |
|:------------------ |:--------------------------------------------------|:--:|
| extra points  | Any of the two extra points tasks can be used towards any activity in the azure module (where you need it most, maybe it will not be this same activity) | 25% |

*If you do both extra points tasks, you will have 50% spare points on any activity.

