function Get-Miasto($adres)
{
    $zm1=$adres
    $zm2=$zm1.split(",")
    $miasto=$zm2[1].Substring(7)
    return $miasto
}

Get-Miasto "pl. Cisowa 82/15,07-007 Stalowa Wola"