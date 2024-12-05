# Zadanie 1: Tworzenie Prostego Zadania w Tle
$job1 = Start-Job -ScriptBlock { 1..10 | Measure-Object -Sum }

# Zadanie 2: Zarządzanie Zadaniami w Tle
Get-Job | Format-Table
Get-Job | Stop-Job

# Zadanie 3: Pobieranie Wyników Zadania
$job2 = Start-Job -ScriptBlock { "Hello, world!" }
Wait-Job $job2
Receive-Job $job2

# Zadanie 4: Zadanie z Parametrami
$job3 = Start-Job -ScriptBlock { param($number) $number * $number } -ArgumentList 5
Wait-Job $job3
Receive-Job $job3

# Zadanie 5: Zadanie z Dłuższym Procesem
$job4 = Start-Job -ScriptBlock { Start-Sleep -Seconds 10; "Done" }
Wait-Job $job4
Receive-Job $job4
