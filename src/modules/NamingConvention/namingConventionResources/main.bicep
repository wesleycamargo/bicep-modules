// parameters

@description('Business workload affix.')
@minLength(1)
@maxLength(3)
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

@minLength(3)
@maxLength(3)
param instanceNumber string = '001'

// variables
var sharedNamePrefixes = loadJsonContent('./prefixes.json')
var globalAffix = '${workloadAffix}-${applicationSufix}-${environment}'
var globalAffixNoDashes = replace(globalAffix, '-', '')

output azContainerRegistryName string = '${globalAffixNoDashes}${sharedNamePrefixes.containerRegistryPrefix}${instanceNumber}'
