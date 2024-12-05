function Czysc-Slowo ($slowo) {
    $slowo = $slowo -replace "\W" 
    $slowo = $slowo -replace "\d"
    return $slowo
}

Czysc-Slowo "##alama@@kota3453"
