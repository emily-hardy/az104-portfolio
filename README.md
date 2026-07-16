This project is a quick deployment in Azure using IAC principals. 
I practiced scripting specifications for the deployment in place of manually building-out the resources and settings in Azure.

GOAL: Deploy two virtual machines with their own network security group in a resource group with dedicted containers.

Considerations:
~COST - free resources created in Microsoft Azure, resources deleted upon completion of deployment
~TOOLS - Powershell, Cloudshell, assistance from Claude for fixes to the scripting

The scope of the project changed as I decided to move from completing the infrstructure entirely in Powershell, to initiating the RG in Powershell and finishing out the VMs and NSG in AzureCloudShell. Because this was completed over a few days, I kept running into the issue of needing to log back in and sync with az login everytime I walked away from my computer and the session in powershell timed out. This constraint was the main reason for my decision: time saved. From a business perspective, it is also more likely I'd be logged into my enterprise Azure account to access cloud resources and run any quick changes or updates. I've provided screenshots and videos of each step below.

