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
Creating the RG and storage account.
[![Watch the video](https://img.youtube.com/vi/YOUTUBE_VIDEO_ID/hqdefault.jpg)](https://www.youtube.com/watch?v=TzFqgdMwaJk)


**3**
From here, I logged into my Azure account to confirm creation of RG.
<img width="845" height="305" alt="6 proof-of-RG-in-azure" src="https://github.com/user-attachments/assets/bb0b84b8-3307-49d3-80b8-fc7dc5ee7cb4" />
<img width="1683" height="925" alt="7 proof-of-storage-account-in-azure" src="https://github.com/user-attachments/assets/f6602d03-3f29-45fc-b827-002b52168f6e" />

*4*
In Azure, using Cloudshell to deploy the VMs with a specified NSG.
<img width="953" height="395" alt="12 deployment-in-azure-cloud-shell" src="https://github.com/user-attachments/assets/37af4a92-7eef-4678-a973-1bb42d0a7b0b" />






