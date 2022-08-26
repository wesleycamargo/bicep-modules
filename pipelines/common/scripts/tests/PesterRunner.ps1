$config = New-PesterConfiguration
$config.TestResult.Enabled = $true
$config.TestResult.OutputFormat = "NUnitXML"

$config.TestResult.OutputPath = Join-Path "./" -ChildPath "testResults.xml" 

$config.Run.Container = $container
$config.Output.Verbosity = "Detailed"

$env:modulesDiretory

Invoke-Pester -Configuration $config