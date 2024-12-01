$PSVersionTable

# transcript
Start-Transcript d:\dzien1.txt 

Stop-Transcript

#Help
Get-Help *net* -Category cmdlet
Get-help Get-ChildItem -ShowWindow
Get_help  *process
Get-Help *process*

# Help ABOUT
Get-Help about*
Get-Help about_aliases
Get-Help about_eventlogs -ShowWindow

#Finding (Get-command)
Get-Command *net*
Get-Command -Verb Get -Noun event* 

#PS CORE
Get-winEvent -logName application