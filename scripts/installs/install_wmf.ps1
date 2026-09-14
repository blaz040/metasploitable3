$Logfile = "C:\Windows\Temp\wmf-install.log"
function LogWrite {
   Param ([string]$logstring)
   $now = Get-Date -format s
   Add-Content $Logfile -value "$now $logstring"
   Write-Host $logstring
}


LogWrite "Extracting Archive..."

$extractLocation = "C:\king\resources\windows_pre_downloads\wmf_install"
New-Item -Path $extractLocation -ItemType Directory

$shell = New-Object -ComObject shell.application
$zip = $shell.NameSpace("C:\king\resources\windows_pre_downloads\wmf.zip")
foreach ($item in $zip.items()) {
  $shell.Namespace($extractLocation).CopyHere($item)
}

Set-Location -Path $extractLocation -PassThru
$installCmd = "powershell.exe -ExecutionPolicy Bypass -Command " + '"' + ${extractLocation} + "\Install-WMF5.1.ps1 -AcceptEula" + '"'

LogWrite "Starting installation process..."

New-Item C:\king\resources\windows_pre_downloads\wmf_install\install_wmf.bat -ItemType "file"
Set-Content C:\king\resources\windows_pre_downloads\wmf_install\install_wmf.bat $installCmd

$Taskname = "updatepsh"

SCHTASKS /CREATE /sc ONCE /st 00:00 /TN $Taskname /RU SYSTEM /RL HIGHEST /TR "C:\king\resources\windows_pre_downloads\wmf_install\install_wmf.bat"
schtasks /Run /TN $Taskname
start-sleep -s 5
schtasks /delete /tn $Taskname /f
start-sleep -s 30
