
@description('Resource Group location.')
param location string = deployment().location

module naming '../../modules/common/namingConvention/main.bicep' = {
  name: 'naming'

  params: {
    workloadAffix: 'wc'
  }
}

module acr '../../modules/Microsoft.ContainerRegistry/registry/main.bicep' = {
  name: 'acr'
  params: {
    name: naming.outputs.azContainerRegistryName
  }
}
