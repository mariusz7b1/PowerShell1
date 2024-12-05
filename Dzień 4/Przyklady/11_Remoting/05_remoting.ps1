$computers=Get-Content C:\computers.txt

foreach($komp in $computers){
    Write-Host "Instalacja na  $komp" -ForegroundColor Yellow
    Invoke-Command –ComputerName $komp –ScriptBlock{ 
        #Install-WindowsFeature nlb -WhatIf
        Install-WindowsFeature RSAT-AD-Tools -IncludeAllSubFeature -IncludeManagementTools
    } -AsJob
}
