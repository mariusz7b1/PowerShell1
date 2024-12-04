Clear-Host
$today=(get-date).AddDays(30)
$users=Get-ADUser -Filter{name -like 'c*' -and Enabled -eq $True -and PasswordNeverExpires -eq $False} -Properties name,msDS-UserPasswordExpiryTimeComputed 



$pass=ConvertTo-SecureString "P@ssw0rd67766##" -AsPlainText -Force
foreach($user in $users){
    Set-ADAccountPassword $user -NewPassword $pass
}


# czas wyswietlany jako FileTime
$users | Select-Object -Property name,msDS-UserPasswordExpiryTimeComputed | FT

# czas przekkonwertowany


$users | Select-Object -Property name,@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}

# rownica czasu dzisiaj a czas uplywu hasla
$users | Select-Object -Property name,`
@{Name="DaysTo";Expression={[int]([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $today).totaldays}}


# cala comenda w jednej lini
$users=Get-ADUser -Filter{name -like 'c*' -and Enabled -eq $True -and PasswordNeverExpires -eq $False}`
–Properties name,msDS-UserPasswordExpiryTimeComputed | Select-Object -Property name,@{Name="ExpiryDate";Expression={[int]([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $today).totaldays}}

# i jeszcze out-gridview
$users=Get-ADUser -Filter{name -like 'c*' -and Enabled -eq $True -and PasswordNeverExpires -eq $False}`
–Properties name,msDS-UserPasswordExpiryTimeComputed | Select-Object -Property name,@{Name="ExpiryDate";Expression={[int]([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $today).totaldays}} | Out-GridView


    
    
