Describe "Resource Group" -Tag resourceGroup {
    Context "Validate Resource Group" {
        It "Should be created successfully" {
            
            New-AzSubscriptionDeployment -Location westeurope `
                -TemplateFile ./src/modules/Microsoft.Resources/resourceGroups/main.bicep `
                -TemplateParameterFile ./src/modules/Microsoft.Resources/resourceGroups/examples/resourceGroup.parameters.json

            $resourceGroup = Get-AzResourceGroup -Name "rg-test"
            
            $resourceGroup.ResourceGroupName | Should -Be "rg-test"
        }
    }
}

AfterAll {
    Write-Host "Removing resources..."

    # TODO: Change module to use Azure PowerShell instead of Azure CLI
    Import-Module ./pipelines/common/scripts/helpers/AzureHelpers.psm1

    Remove-ResourceGroupByName -name "rg-test"
}