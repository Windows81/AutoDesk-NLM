:: Starting Parameters
@echo off & color a & chcp 1254 & mode con: cols=55 lines=12 & title Bloatware CleanUp & cls
SET liveincolor=1 & SET "c_underline=[4m" & SET "c_reset=[0m" & SET "c_Red_Blak=[91;40m" & SET "c_Gre_Blak=[92;40m" & SET "c_Yel_Blak=[93;40m" & SET "c_Blu_Blak=[94;40m" & SET "c_Mag_Blak=[95;40m" & SET "c_Cya_Blak=[96;40m" & SET "c_Whi_Blak=[97;40m"

:: Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

:: Start From Here
:begin
cd "C:\Program Files\Autodesk" >Nul 2>&1
mode con: cols=55 lines=12
cls

echo  %c_Red_Blak%_____________________________________________________%c_Gre_Blak%
echo.
echo                    %c_Red_Blak%Bloatware CleanUp%c_Gre_Blak%
echo       %c_Red_Blak%Please Run As Administrator And Disable UAC%c_Gre_Blak%
echo  %c_Red_Blak%_____________________________________________________%c_Gre_Blak%
echo.
echo  Removal of Genuine Service, Access Service, IM,
echo  Single Sing On Component, Desktop App, NLM, DSI.
echo  1) %c_Red_Blak%Continue%c_Gre_Blak%
echo  2) %c_Red_Blak%Revert%c_Gre_Blak%
echo.

SET INPUT=
SET /P INPUT= Type Your Decision:

IF /I '%INPUT%'=='1' GOTO Continue
IF /I '%INPUT%'=='2' GOTO Revert
IF /I '%INPUT%'=='exit' GOTO exit
IF /I '%INPUT%'=='close' GOTO exit
goto begin

:Continue
:: Set To Use High Performance GPU
For /F "Delims=" %%A In ('Where /R "C:\Program Files\Autodesk" "Acad.exe" /F 2^>Nul') Do Set "ELC=%%A" >Nul 2>&1
Reg.exe Add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v %ELC% /t REG_SZ /d "GpuPreference=2;" /f >Nul 2>&1
For /F "Delims=" %%A In ('Where /R "C:\Program Files\Autodesk" "Revit.exe" /F 2^>Nul') Do Set "ELC=%%A" >Nul 2>&1
Reg.exe Add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v %ELC% /t REG_SZ /d "GpuPreference=2;" /f >Nul 2>&1
For /F "Delims=" %%A In ('Where /R "C:\Program Files\Autodesk" "3dsMax.exe" /F 2^>Nul') Do Set "ELC=%%A" >Nul 2>&1
Reg.exe Add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v %ELC% /t REG_SZ /d "GpuPreference=2;" /f >Nul 2>&1

:: Genuine Service
sc stop "AdskLicensingService" >Nul 2>&1
taskkill /F /IM "GenuineService*" >Nul 2>&1
tskill /a "GenuineService*" >Nul 2>&1
ren "C:\ProgramData\Autodesk\Adlm\ProductInformation.pit" "ProductInformation.pit.bak" >Nul 2>&1
del /f /q "%localappdata%\Autodesk\Genuine Autodesk Service\id.dat" >Nul 2>&1
:: Dism /Online /Add-Capability /CapabilityName:WMIC~~~~ >Nul 2>&1
:: WMIC Product Where "Name='Autodesk Genuine Service'" Call Uninstall /NoInteractive >Nul 2>&1
>nul Powershell -nop -c "Get-WmiObject -Query ' select * from Win32_Product where Name like \"%%Autodesk Genuine Service%%\" ' | ForEach-Object { ($_).Uninstall()}"
taskkill /F /IM "Message_Router*" >Nul 2>&1
tskill /a "Message_Router*" >Nul 2>&1
ren "C:\ProgramData\Autodesk\Adlm\ProductInformation.pit.bak" "ProductInformation.pit" >Nul 2>&1
del /f /q "%localappdata%\Autodesk\Genuine Autodesk Service" >Nul 2>&1
@RD /S /Q "%localappdata%\Autodesk\Genuine Autodesk Service" >Nul 2>&1
del /f /q "%localappdata%\Programs\Autodesk\Genuine Service" >Nul 2>&1
@RD /S /Q "%localappdata%\Programs\Autodesk\Genuine Service" >Nul 2>&1
del /f /q "C:\ProgramData\Autodesk\Genuine Autodesk Service" >Nul 2>&1
@RD /S /Q "C:\ProgramData\Autodesk\Genuine Autodesk Service" >Nul 2>&1
del /f /q "C:\ProgramData\Autodesk\Genuine Service" >Nul 2>&1
@RD /S /Q "C:\ProgramData\Autodesk\Genuine Service" >Nul 2>&1
del /f /q "C:\MATS" >Nul 2>&1
@RD /S /Q "C:\MATS" >Nul 2>&1

:: Autodesk Network License Manager
:: Dism /Online /Add-Capability /CapabilityName:WMIC~~~~ >Nul 2>&1
:: WMIC Product Where "Name='Autodesk Network License Manager'" Call Uninstall /NoInteractive >Nul 2>&1
>nul Powershell -nop -c "Get-WmiObject -Query ' select * from Win32_Product where Name like \"%%Autodesk Network License Manager%%\" ' | ForEach-Object { ($_).Uninstall()}"

:: Autodesk Single Sign On Component
:: Dism /Online /Add-Capability /CapabilityName:WMIC~~~~ >Nul 2>&1
:: WMIC Product Where "Name='Autodesk Single Sing On Component'" Call Uninstall /NoInteractive >Nul 2>&1
>nul Powershell -nop -c "Get-WmiObject -Query ' select * from Win32_Product where Name like \"%%Autodesk Single Sign On Component%%\" ' | ForEach-Object { ($_).Uninstall()}"

:: Autodesk Access Service Host
taskkill /F /IM "AdskAccessServiceHost*" >Nul 2>&1
tskill /a "AdskAccessServiceHost*" >Nul 2>&1
sc stop "Autodesk Access Service Host" >Nul 2>&1
sc config "Autodesk Access Service Host" start= disabled >Nul 2>&1
sc delete "Autodesk Access Service Host" >Nul 2>&1
:: sc create "Autodesk Access Service Host" binPath= "C:\Program Files\Autodesk\AdODIS\V1\Setup\AdskAccessServiceHost.exe" >Nul 2>&1
:: sc config "Autodesk Access Service Host" start= auto >Nul 2>&1
:: sc start "Autodesk Access Service Host" >Nul 2>&1

:: Desktop App
taskkill /F /IM "AdAppMgr.exe" >Nul 2>&1
taskkill /F /IM "AutodeskDesktopApp.exe" >Nul 2>&1
net stop AdAppMgrSVC >Nul 2>&1
net stop AutodeskDesktopApp >Nul 2>&1
sc delete AdAppMgrSVC >Nul 2>&1
sc delete AutodeskDesktopApp >Nul 2>&1
RD C:\ProgramData\Autodesk\SDS /S /Q >Nul 2>&1
call "C:\Program Files\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe" --mode unattended
call "C:\Program Files (x86)\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe" --mode unattended
del /f /q "C:\Program Files (x86)\Autodesk\Autodesk Desktop App" >Nul 2>&1
@RD /S /Q "C:\Program Files (x86)\Autodesk\Autodesk Desktop App" >Nul 2>&1
del /f /q "%localappdata%\Autodesk\.AdskAppManager" >Nul 2>&1
@RD /S /Q "%localappdata%\Autodesk\.AdskAppManager" >Nul 2>&1
del /f /q "%appdata%\Autodesk\.AdskAppManager" >Nul 2>&1
@RD /S /Q "%appdata%\Autodesk\.AdskAppManager" >Nul 2>&1
del /f /q "%localappdata%\Autodesk\Autodesk Desktop App" >Nul 2>&1
@RD /S /Q "%localappdata%\Autodesk\Autodesk Desktop App" >Nul 2>&1
del /f /q "%appdata%\Autodesk\Autodesk Desktop App" >Nul 2>&1
@RD /S /Q "%appdata%\Autodesk\Autodesk Desktop App" >Nul 2>&1

:: Identitiy Manager
call "C:\Program Files\Autodesk\AdskIdentityManager\uninstall.exe" --mode unattended >Nul 2>&1

:: Block EXE & Remove Leftovers
del /f /q "C:\Autodesk" >Nul 2>&1
@RD /S /Q "C:\Autodesk" >Nul 2>&1
regedit.exe /s %temp%\Bloatware\Bloatware.reg >Nul 2>&1

:: Restart Service
sc start "AdskLicensingService" >Nul 2>&1
goto Done

:: UnBlock EXE
:Revert
regedit.exe /s %temp%\Bloatware\Revert.reg >Nul 2>&1
goto Done

:Done
mode con: cols=55 lines=3
echo.
echo  Completed & ping 127.0.0.1 -n 5 >Nul 2>&1 & exit

:: CleanUp And Exit
cls & exit