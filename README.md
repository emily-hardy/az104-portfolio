This project is a quick deployment in Azure using IAC principals. 
I practiced scripting specifications for the deployment in place of manually building-out the resources and settings in Azure.

GOAL: Deploy two virtual machines with their own network security group in a resource group with dedicted containers.

Considerations:
~COST - free resources created in Microsoft Azure, resources deleted upon completion of deployment
~TOOLS - Powershell, Cloudshell, assistance from Claude for fixes to the scripting

The scope of the project changed as I decided to move from completing the infrstructure entirely in Powershell, to initiating the RG in Powershell and finishing out the VMs and NSG in AzureCloudShell. Because this was completed over a few days, I kept running into the issue of needing to log back in and sync with az login everytime I walked away from my computer and the session in powershell timed out. This constraint was the main reason for my decision: time saved. From a business perspective, it is also more likely I'd be logged into my enterprise Azure account to access cloud resources and run any quick changes or updates. I've provided screenshots and videos of each step below.

**1.** 
Initially, I was going to use powershell to run azure and bicep to back up the infrastructure in a repository. After needing to repeatedly restart sessions and sync with accounts, I chose to move forward with an initial deployment of an RG. 
<img width="1350" height="767" alt="1 powershell_installs" src="https://github.com/user-attachments/assets/f9488126-a1be-46a8-850d-824206228e8f" />

**2.** 
Creating the RG.
<iframe src="https://drive.google.com/file/d/1YFLB10kqHf37LenT7P6ip7hHc3E8yYux/preview" width="640" height="480"></iframe>


