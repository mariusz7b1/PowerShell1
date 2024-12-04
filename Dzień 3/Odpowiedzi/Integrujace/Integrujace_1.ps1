# Wersja  bez zastosowania zmiennych 

# 1 ilosc
Get-ADUser -Filter {name -like 'c*' -or name -like 'r*'} | Measure-Object 

#2 Formatownie
Get-ADUser -Filter {name -like 'c*' -or name -like 'r*'} | FT -Property name,DistinguishedName
Get-ADUser -Filter {name -like 'c*' -or name -like 'r*'} | Select-Object -Property name,DistinguishedName |FT

#3 zapisanie do pliku
Get-ADUser -Filter {name -like 'c*' -or name -like 'r*'} | Select-Object -Property name,DistinguishedName | Out-File d:\user2.txt -Encoding utf8

#4 zmiana wlasciwosci
Get-ADUser -Filter {name -like 'c*' -or name -like 'r*'} | Set-ADUser -City "Opole"

#5 zmiana wlasciowosci
Get-ADUser -Filter {name -like 'c*' -or name -like 'r*'} | Set-ADUser -Department "Utajniony"

# spr 4,5
Get-ADUser -Filter {name -like 'c*' -or name -like 'r*'}   -Properties City, Department | FT -Property name,city,department

#6  nowa OU
New-ADOrganizationalUnit -Name "TESTERZY" -Path "OU=KejaMain,DC=keja,DC=msft" 

#7 Nowa Grupa
New-ADGroup -Name "TESTERZY" -Path "ou=testerzy,OU=KejaMain,DC=keja,DC=msft"  -GroupCategory Security -GroupScope Global

#8 Przeniesienie do innego OU
Get-ADUser -Filter {name -like 'c*' -or name -like 'r*'} | Move-ADObject -TargetPath "ou=testerzy,OU=KejaMain,DC=keja,DC=msft" 

#9
Add-ADGroupMember -Identity "TESTERZY" -Members (Get-ADUser -Filter * -SearchBase "ou=testerzy,OU=KejaMain,DC=keja,DC=msft" )

# spr
Get-ADUser -Filter * -SearchBase "ou=testerzy,OU=KejaMain,DC=keja,DC=msft" | Get-ADPrincipalGroupMembership | FT

#10
Get-ADUser -Filter * -SearchBase "ou=testerzy,OU=KejaMain,DC=keja,DC=msft" | Set-ADUser -PasswordNeverExpires:$false 


