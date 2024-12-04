Clear-Host
# symulujemy uplyw czasu
$today=(get-date).AddDays(32)

# pobieramy dane do zmiennej
$users=Get-ADUser -Filter{name -like 'c*' -and Enabled -eq $True -and PasswordNeverExpires -eq $False}`
  –Properties name,msDS-UserPasswordExpiryTimeComputed |  Select-Object -Property name,`
  @{Name="ExpiryDate";Expression={[int]([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $today).totaldays}} 

foreach ($user in $ExpirePass){
 
    [int]$passtime=$user.ExpiryDate
    $username=$user.name
   
    if ($passtime -lt 0){
        Write-Host "Dla użytkownika $username hasło jest NIEAKTUALNE"
    }
    elseif($passtime -eq 0){
        Write-Host "Dla użytkownika $username hasło wygasa Dzisiaj"
    }
    elseif($passtime -gt 0 -and  $passtime -le 7){
        Write-Host "Dla użytkownika $username halo wygasa w ciagu tygodnia"
    }
}