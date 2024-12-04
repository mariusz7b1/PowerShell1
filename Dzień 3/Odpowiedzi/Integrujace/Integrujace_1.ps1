
# 1 ilosc
$users=Get-ADUser -Filter {name -like 'e*' -or name -like 's*'} -SearchBase "ou=marketing,dc=adatum,dc=com" 
$users | Measure-Object 

#2 Formatownie
$users | FT -Property name,DistinguishedName
$users | Select-Object -Property name,DistinguishedName |FT

#3 zapisanie do pliku
$users | Select-Object -Property name,DistinguishedName | Out-File e:\user2.txt

#4 zmiana wlasciwosci
$users | Set-ADUser -City "Opole" 

#5 zmiana wlasciowosci
$users | Set-ADUser -Department "Utajniony" 

# spr 4,5
Get-ADUser -Filter {name -like 'e*' -or name -like 's*'} -SearchBase "ou=marketing,dc=adatum,dc=com"  -Properties City, Department

#6  nowa OU
New-ADOrganizationalUnit -Name "TESTERZY" -Path "dc=adatum,dc=com" 

#7 Nowa Grupa
New-ADGroup -Name "TESTERZY" -Path "ou=testerzy,dc=adatum,dc=com"  -GroupCategory Security -GroupScope Global

#8 Przeniesienie do innego OU
$users | Move-ADObject -TargetPath "ou=testerzy,dc=adatum,dc=com"  

#9
Add-ADGroupMember -Identity "TESTERZY" -Members (Get-ADUser -Filter * -SearchBase "ou=testerzy,dc=adatum,dc=com" )

#10
Remove-ADGroupMember -Identity "marketing" -Members (Get-ADUser -Filter * -SearchBase "ou=testerzy,dc=adatum,dc=com" ) -Confirm:$false

# spr 9, 10
Get-ADUser -Filter * -SearchBase "ou=testerzy,dc=adatum,dc=com" | Get-ADPrincipalGroupMembership 

#11
Get-ADUser -Filter * -SearchBase "ou=testerzy,dc=adatum,dc=com" | Set-ADUser -PasswordNeverExpires:$false
