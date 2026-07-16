<# steps for deploying the VM's in the RG with specifications using a script this happens after creating the RG using desktop Powershell with AZ CLI #>

<# deploy storage account #>
$rgName = "your-existing-resource-group"
$location = "eastus"
$vmNames = @("vm-web-01", "vm-web-02")
$adminUsername = "azureadmin"
  
<# create secure credential #>
$adminPassword = Read-Host -AsSecureString -Prompt "Enter admin password for VMs"
$credential = New-Object System.Management.Automation.PSCredential($adminUsername, $adminPassword)

<# create virtual network and subnet #>
$subnetConfig = New-AzVirtualNetworkSubnetConfig -Name "default-subnet" -AddressPrefix "10.0.1.0/24"

$vnet = New-AzVirtualNetwork `
  -ResourceGroupName $rgName `
  -Location $location `
  -Name "vnet-portfolio" `
  -AddressPrefix "10.0.0.0/16" `
  -Subnet $subnetConfig

<# create NSG #>
  $rdpRule = New-AzNetworkSecurityRuleConfig `
  -Name "Allow-RDP" `
  -Protocol Tcp `
  -Direction Inbound `
  -Priority 1000 `
  -SourceAddressPrefix Internet `
  -SourcePortRange * `
  -DestinationAddressPrefix * `
  -DestinationPortRange 3389 `
  -Access Allow

$nsg = New-AzNetworkSecurityGroup `
  -ResourceGroupName $rgName `
  -Location $location `
  -Name "nsg-portfolio" `
  -SecurityRules $rdpRule

  <# create NIC and PIP #>
  foreach ($vmName in $vmNames) {
    $pip = New-AzPublicIpAddress `
      -ResourceGroupName $rgName `
      -Location $location `
      -Name "$vmName-pip" `
      -AllocationMethod Static `
      -Sku Standard

    $nic = New-AzNetworkInterface `
      -ResourceGroupName $rgName `
      -Location $location `
      -Name "$vmName-nic" `
      -SubnetId $vnet.Subnets[0].Id `
      -PublicIpAddressId $pip.Id `
      -NetworkSecurityGroupId $nsg.Id

    Write-Host "Networking ready for $vmName" -ForegroundColor Cyan
}


<# deploy VMs with specifications #>
foreach ($vmName in $vmNames) {
    $nic = Get-AzNetworkInterface -ResourceGroupName $rgName -Name "$vmName-nic"

    $vmConfig = New-AzVMConfig -VMName $vmName -VMSize "Standard_B2s" |
        Set-AzVMOperatingSystem -Windows -ComputerName $vmName -Credential $credential |
        Set-AzVMSourceImage -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2022-datacenter-azure-edition" -Version "latest" |
        Add-AzVMNetworkInterface -Id $nic.Id

    Write-Host "Deploying $vmName..." -ForegroundColor Magenta

    New-AzVM -ResourceGroupName $rgName -Location $location -VM $vmConfig
}

<# confirm the VMs are running #>
Get-AzVM -ResourceGroupName $rgName -Status | Select-Object Name, PowerState
