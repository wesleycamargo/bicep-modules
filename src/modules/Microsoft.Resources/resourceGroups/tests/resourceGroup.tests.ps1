Describe "Resource Group" -Tag resourceGroup {
    Context "Validate Resource Group" {
        It "Should be created successfully" {
            
            # az deployment sub create 
            # --template-file ./src/modules/Microsoft.Resources/resourceGroups/main.bicep 
            # -l westeurope 
            # --parameters ./src/modules/Microsoft.Resources/resourceGroups/examples/resourceGroup.parameters.json

            New-AzSubscriptionDeployment -Location westeurope `
                -TemplateFile ./src/modules/Microsoft.Resources/resourceGroups/main.bicep `
                -TemplateParameterFile ./src/modules/Microsoft.Resources/resourceGroups/examples/resourceGroup.parameters.json

            # $resourceGroup = (az group list --query "[?name == 'rg-test']" -o json) | ConvertFrom-Json

            $resourceGroup = Get-AzResourceGroup -Name "rg-test"
            
            
            $resourceGroup.name | Should -Be "rg-test"
        }
    }
}

AfterAll {
    Write-Host "Removing resources..."

    Import-Module ./pipelines/common/scripts/helpers/AzureHelpers.psm1

    Remove-ResourceGroupByName -name "rg-test"
}