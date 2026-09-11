netsh advfirewall firewall add rule name="Open Port 3839" dir=in action=allow protocol=TCP localport=3839
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

setlocal

set NEWPORT=3839

echo Enabling Remote Desktop...
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

echo Changing RDP port to %NEWPORT%...
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d %NEWPORT% /f

echo Restarting Terminal Services...
net stop TermService /y
net start TermService

echo Done. RDP should now be listening on port %NEWPORT%.
endlocal
pause