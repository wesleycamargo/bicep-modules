function Remove-ResourceGroupByName {
    param (
        [string]$name
    )

    $resourceGroups = (az group list --query "[].[name]" -o tsv) 
    
    if ($resourceGroups.Count -eq 0) {
        Write-Error "No resource groups found"
    } else {       
        az group delete -n $name -y
    }
    
    return $resourceGroup
}
