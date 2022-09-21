
@description('Azure Container Registry location.')
param location string = resourceGroup().location

@description('Workload affix of the Azure Container.')
param workloadAffix string = 'wc'

@description('Application sufix.')
@minLength(1)
@maxLength(3)
param applicationSufix string = 'app'

@minLength(3)
@maxLength(3)
param instanceNumber string = '001'

module naming '../../../modules/NamingConvention/namingConventionResources/main.bicep' = {
  name: 'naming'

  params: {
    workloadAffix: workloadAffix
    instanceNumber: instanceNumber
    applicationSufix: applicationSufix
  }
}

module acr '../../../modules/Microsoft.ContainerRegistry/registry/main.bicep' = {
  name: 'acr'
  params: {
    name: naming.outputs.azContainerRegistryName
    location: location

  }
}

output acrName string = naming.outputs.azContainerRegistryName
output acrId string = acr.outputs.loginServer
