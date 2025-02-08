:: WARNING
:: This tools is just an automated repack, and it is for research purposes ONLY! DO NOT USE IT FOR PIRACY!
:: ALWAYS SUPPORT DEVELOPOERS, BUY IF YOU LIKE/USE IT.

:: Starting Parameters
@echo off & color a & chcp 1254 & mode con: cols=70 lines=15 & title Autodesk License Patcher & cls
SET liveincolor=1 & SET "c_underline=[4m" & SET "c_reset=[0m" & SET "c_Red_Blak=[91;40m" & SET "c_Gre_Blak=[92;40m" & SET "c_Yel_Blak=[93;40m" & SET "c_Blu_Blak=[94;40m" & SET "c_Mag_Blak=[95;40m" & SET "c_Cya_Blak=[96;40m" & SET "c_Whi_Blak=[97;40m"
SET PatcherLocation=%~dp0

:: Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                      Autodesk License Patcher                    _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo                %c_Cya_Blak%...Welcome To Autodesk License Patcher...%c_Gre_Blak%
echo.
echo  %c_Red_Blak%This tool will permenantly license all Autodesk products via NLM%c_Gre_Blak%
echo  Supports any autodesk product with any ADSK Licensing.
echo  Run with administrator privileges and UAC disabled.
echo  Check "ReadMe" before using.
ping 127.0.0.1 -n 15 >Nul 2>&1
cls

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                      Autodesk License Patcher                    _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo  %c_Cya_Blak%Stopping ADSK Licensing Service And Cleaning Up%c_Gre_Blak%
ping 127.0.0.1 -n 5 >Nul 2>&1

echo.
net stop AdskLicensingService >Nul 2>&1
taskkill /F /IM "AdskLicensingService.exe" >Nul 2>&1
taskkill /F /IM "AdskLicensingAgent.exe" >Nul 2>&1
taskkill /F /IM "ADPClientService.exe" >Nul 2>&1
taskkill /F /IM "AdskLicensingAnalyticsClient.exe" >Nul 2>&1
taskkill /F /IM "AdskLicensingInstHelper.exe" >Nul 2>&1
taskkill /F /IM "lmgrd.exe" >Nul 2>&1
taskkill /F /IM "adskflex.exe" >Nul 2>&1
taskkill /F /IM "lmutil.exe" >Nul 2>&1
taskkill /F /IM "lmtools.exe" >Nul 2>&1
@RD /S /Q "%SystemDrive%\Autodesk\Network License Manager\" >Nul 2>&1
del /f /q "%SystemDrive%\Autodesk\Network License Manager\" >Nul 2>&1
@RD /S /Q "%SystemDrive%\Autodesk\Network License Manager" >Nul 2>&1
del /f /q "%SystemDrive%\Autodesk\Network License Manager" >Nul 2>&1
@RD /S /Q "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\" >Nul 2>&1
del /f /q "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\" >Nul 2>&1
@RD /S /Q "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager" >Nul 2>&1
del /f /q "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager" >Nul 2>&1
>nul Powershell -nop -c "Get-WmiObject -Query ' select * from Win32_Product where Name like \"%%Autodesk Network License Manager%%\" ' | ForEach-Object { ($_).Uninstall()}"
:: Dism /Online /Add-Capability /CapabilityName:WMIC~~~~ >Nul 2>&1
:: WMIC Product Where "Name='Autodesk Network License Manager'" Call Uninstall /NoInteractive >Nul 2>&1
regedit.exe /s "%PatcherLocation%\Files\Tweak\Tweak.reg" >Nul 2>&1
cls

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                      Autodesk License Patcher                    _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo  %c_Cya_Blak%Placing And Replacing Necessary Files%c_Gre_Blak%
ping 127.0.0.1 -n 5 >Nul 2>&1

xcopy "%PatcherLocation%\Files\NetworkLicenseManager\adskflex.exe" "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\" /Y /K /R /S /H /i >Nul 2>&1
xcopy "%PatcherLocation%\Files\NetworkLicenseManager\lmgrd.exe" "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\" /Y /K /R /S /H /i >Nul 2>&1
xcopy "%PatcherLocation%\Files\NetworkLicenseManager\License.lic" "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\" /Y /K /R /S /H /i >Nul 2>&1
xcopy "%PatcherLocation%\Files\Service\Service.exe" "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\" /Y /K /R /S /H /i >Nul 2>&1
xcopy "%PatcherLocation%\Files\PatchedFiles\version.dll" "%CommonProgramFiles(x86)%\Autodesk Shared\AdskLicensing\Current\AdskLicensingAgent\" /Y /K /R /S /H /i >Nul 2>&1
xcopy "%PatcherLocation%\Files\PatchedFiles\netapi32.dll" "%CommonProgramFiles(x86)%\Autodesk Shared\AdskLicensing\Current\AdskLicensingAgent\" /Y /K /R /S /H /i >Nul 2>&1
xcopy "%PatcherLocation%\Files\PatchedFiles\netapi32.dll" "%CommonProgramFiles(x86)%\Autodesk Shared\Adlm\R28\" /Y /K /R /S /H /i >Nul 2>&1
xcopy "%PatcherLocation%\Files\Tweak\UnNamed.json" "%appdata%\Autodesk\ADPSDK\UserConsent\" /Y /K /R /S /H /i >Nul 2>&1
cls

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                      Autodesk License Patcher                    _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo  %c_Cya_Blak%Editing Hostname And MAC Address in License File%c_Gre_Blak%
ping 127.0.0.1 -n 5 >Nul 2>&1

cd "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager" >Nul 2>&1

:: Get HostName
:: Reg Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v RegisteredOwner /d Administrator /f >NUL 2>&1
:: Reg Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v RegisteredOrganization /d Administrator /f >NUL 2>&1
:: >nul Powershell Rename-Computer -NewName "Administrator"
:: for /f "usebackq" %%i IN (`hostname`) DO SET HOSTNAME=%%i>Nul 2>&1

:: Get MacAddress
:: for /f "tokens=3 skip=1" %%a in ('wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%%%USB%%%%' AND AdapterTypeID='0'" get MacAddress^,AdapterType') do (set "MacAddress=%%a") >Nul 2>&1
:: for /f "tokens=3 skip=1" %%a in ('wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%%%PCI%%%%' AND AdapterTypeID='0'" get MacAddress^,AdapterType') do (set "MacAddress=%%a") >Nul 2>&1
:: set MAC=%MacAddress::=% >Nul 2>&1
for /f "delims=" %%a in ('Powershell -noprofile -executionpolicy bypass -command "((Get-NetAdapter -Physical | ? PnPDeviceID -match '^PCI|^USB' | Sort PnPDeviceID -Descending).MacAddress | Select -Last 1) -replace '-'"') do (set "MAC=%%a") >Nul 2>&1

:: Edit License
:: >nul Powershell -Command "(gc License.lic) -replace 'MAC', '%MAC%' -replace 'HOSTNAME', '%HOSTNAME%' | Out-File -encoding ASCII License.lic"
>nul Powershell -Command "(gc License.lic) -replace 'MAC', '%MAC%' | Out-File -encoding ASCII License.lic"
cls

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                      Autodesk License Patcher                    _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo  %c_Cya_Blak%Creating Task To Start Licensing Services At Boot%c_Gre_Blak%
ping 127.0.0.1 -n 5 >Nul 2>&1

sc config "AdskLicensingService" Start= Auto >Nul 2>&1
schtasks.exe /Delete /tn "\Microsoft\Windows\Autodesk\Autodesk" /f >Nul 2>&1
schtasks.exe /Create /XML %PatcherLocation%\Files\Task\Autodesk.xml /tn "\Microsoft\Windows\Autodesk\Autodesk" >Nul 2>&1
cls

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                      Autodesk License Patcher                    _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo  %c_Cya_Blak%Blocking In And Out Internet Traffic To Autodesk Licensing Files%c_Gre_Blak%
ping 127.0.0.1 -n 5 >Nul 2>&1

netsh advfirewall firewall add rule name="AutodeskNLM" dir=in action=block profile=any program="%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\adskflex.exe" >Nul 2>&1
netsh advfirewall firewall add rule name="AutodeskNLM" dir=in action=block profile=any program="%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\lmgrd.exe" >Nul 2>&1
netsh advfirewall firewall add rule name="AutodeskNLM" dir=out action=block profile=any program="%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\adskflex.exe" >Nul 2>&1
netsh advfirewall firewall add rule name="AutodeskNLM" dir=out action=block profile=any program="%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\lmgrd.exe" >Nul 2>&1
cd "C:\Program Files (x86)\Common Files\Autodesk Shared\AdskLicensing" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=out action=block profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=in action=block profile=any program="%%a" >Nul 2>&1
)
cls

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                      Autodesk License Patcher                    _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo  %c_Cya_Blak%Starting Licensing Service%c_Gre_Blak%
ping 127.0.0.1 -n 5 >Nul 2>&1

echo.
net start AdskLicensingService >Nul 2>&1
cls

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                      Autodesk License Patcher                    _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo  %c_Cya_Blak%Starting Network License Manager%c_Gre_Blak%
ping 127.0.0.1 -n 5 >Nul 2>&1

"%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\Service.exe" >Nul 2>&1
cls

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                      Autodesk License Patcher                    _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo  %c_Cya_Blak%Autodesk License Patcher Completed%c_Gre_Blak%
echo  %c_Cya_Blak%Support Developers, Buy If You Like/Use It.
echo.
ping 127.0.0.1 -n 5 >Nul 2>&1

:: CleanUp And Exit
cls & exit