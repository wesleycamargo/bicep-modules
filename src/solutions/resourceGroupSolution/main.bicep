targetScope = 'subscription'

@description('Resource Group location.')
param location string = deployment().location

@description('Resource Group tags.')
param tags object = {}

@description('Workload affix of the Resource Group.')
param workloadAffix string = 'wl'

@description('Application sufix.')
@minLength(1)
@maxLength(3)
param applicationSufix string = 'app'

@allowed([
  'exp'
  'dev'
  'qua'
  'uat'
])
param environment string = 'exp'
 

module naming 'br/CoreModules:namingconvention/namingconventionresourcegroup:v0.1.0' = {
  name: 'naming'

  params: {
    workloadAffix: workloadAffix
    applicationSufix: applicationSufix
    environment: environment
  }
}

// module naming '../../modules/NamingConvention/namingConventionResourceGroup/main.bicep' = {
//   name: 'naming'

//   params: {
//     workloadAffix: workloadAffix
//     applicationSufix: applicationSufix
//     environment: environment
//   }
// }

module resourceGroup '../../modules/Microsoft.Resources/resourceGroup/main.bicep' = {
  name: 'resourceGroup'
  params: {
    name: naming.outputs.resourceGroupName
    location: location
    tags: tags
  }
}

output resourceGroupName string = resourceGroup.outputs.name
