$config = New-PesterConfiguration
$config.TestResult.Enabled = $true
$config.TestResult.OutputFormat = "NUnitXML"

$config.TestResult.OutputPath = Join-Path "./" -ChildPath "testResults.xml" 

$config.Run.Container = $container
$config.Output.Verbosity = "Detailed"

$env:modulesDiretory

$config.Filter.Tag = "namingConventionResourceGroup"

Invoke-Pester -Configuration $config