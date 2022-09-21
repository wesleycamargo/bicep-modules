
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

az deployment sub create `
    -f "$WorkingDirectory/src/solutions/resourceGroupSolution/main.bicep" `
    -l $Location `
    --parameters workloadAffix=$WorkloadAffix applicationSufix=$ApplicationSufix `
    -o json | ConvertFrom-Json
