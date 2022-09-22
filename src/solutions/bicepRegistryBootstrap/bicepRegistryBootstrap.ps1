
[CmdletBinding()]
param (
    [Parameter()]
    [string]$WorkloadAffix = "br",
    [Parameter()]
    [string]$ApplicationSufix = "mod",
    [Parameter()]
    [string]$Location = "westeurope"
)

Get-ChildItem -Recurse

Write-Host "Creating resource group..."

$resourceGroup = az deployment sub create `
    -f "./src/solutions/bicepRegistryBootstrap/resourceGroup/main.bicep" `
    -l $Location `
    --parameters workloadAffix=$WorkloadAffix applicationSufix=$ApplicationSufix `
    -o json | ConvertFrom-Json

Write-Host "Creating container registry..."

az deployment group create `
    -f "./src/solutions/bicepRegistryBootstrap/azureContainerRegistry/main.bicep" `
    -g $resourceGroup.Properties.Outputs.resourceGroupName.value `
    --parameters workloadAffix=$WorkloadAffix applicationSufix=$ApplicationSufix instanceNumber=001


    