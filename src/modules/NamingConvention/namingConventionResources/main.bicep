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

@minValue(001)
@maxValue(999)
param instanceNumber int = 001

// variables
var sharedNamePrefixes = loadJsonContent('./prefixes.json')
var globalAffix = '${workloadAffix}-${applicationSufix}-${environment}'
var globalAffixNoDashes = replace(globalAffix, '-', '')

output azContainerRegistryName string = '${globalAffixNoDashes}${sharedNamePrefixes.containerRegistryPrefix}${instanceNumber}'
