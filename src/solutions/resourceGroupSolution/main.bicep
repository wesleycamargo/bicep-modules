targetScope = 'subscription'

@description('Resource Group location.')
param location string = deployment().location

@description('Resource Group tags.')
param tags object = {}

module naming '../../modules/common/namingConventionResourceGroup/main.bicep' = {
  name: 'naming'

  params: {
    workloadAffix: 'wc'
  }
}

module resourceGroup '../../modules/Microsoft.Resources/resourceGroup/main.bicep' = {
  name: 'resourceGroup'
  params: {
    name: naming.outputs.resourceGroupName
    location: location
    tags: tags
  }
}



// resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
//   name: naming.outputs.resourceGroupName
//   location: location
//   tags: tags
// }
