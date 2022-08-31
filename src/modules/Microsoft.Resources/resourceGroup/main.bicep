targetScope = 'subscription'

@description('Resource Group name.')
param name string

@description('Resource Group location.')
param location string = deployment().location

@description('Resource Group tags.')
param tags object = {}

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
    name: name
    location: location
    tags: tags
}
