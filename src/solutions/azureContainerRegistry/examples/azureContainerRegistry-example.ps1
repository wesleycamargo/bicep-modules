
[CmdletBinding()]
param (
    [Parameter()]
    [string]$WorkloadAffix = "wl",
    [Parameter()]
    [string]$ApplicationSufix = "app",
    [Parameter()]
    [string]$Location = "westeurope",
    [Parameter()]
    [string]$WorkingDirectory = "C:\repos\bicep-modules"

)

$resourceGroup = az deployment sub create `
    -f "$WorkingDirectory/src/solutions/resourceGroupSolution/main.bicep" `
    -l $Location `
    --parameters workloadAffix=$WorkloadAffix applicationSufix=$ApplicationSufix `
    -o json | ConvertFrom-Json

az deployment group create `
    -f "$WorkingDirectory/src/solutions/azureContainerRegistry/main.bicep" `
    -g $resourceGroup.Properties.Outputs.resourceGroupName.value