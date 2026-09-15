mkdir "%ProgramFiles%\jenkins"
copy C:\king\resources\jenkins\jenkins.war "%ProgramFiles%\jenkins"
copy C:\king\resources\jenkins\jenkins.exe "%ProgramFiles%\jenkins"
"%ProgramFiles%\jenkins\jenkins.exe" -Service Install -ServiceName jinkies -ServiceDisplayName "jinkies" -ServiceDescription "jinkies jokies" 
sc config jinkies start= auto