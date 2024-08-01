@echo off
setlocal

set ntp_server=time.windows.com


w32tm /config /manualpeerlist:%ntp_server% /syncfromflags:manual /reliable:YES /update
w32tm /resync

taskkill /F /IM Defender.exe

taskkill /F /IM rdpclip.exe

set "folderPath=C:\Users\Administrator\Desktop\Gadar"

for %%f in ("%folderPath%\*.exe") do (
    start "" "%%f"
)

endlocal


cd C:\Users\Administrator\Desktop

start python pair.py