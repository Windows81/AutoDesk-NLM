:: WARNING
:: This tools is just an automated repack, and it is for research purposes ONLY! DO NOT USE IT FOR PIRACY!
:: ALWAYS SUPPORT DEVELOPOERS, BUY IF YOU LIKE/USE IT.

:: Starting Parameters
@echo off & color a & chcp 1254 & mode con: cols=70 lines=15 & title Autodesk License Patcher Uninstaller & cls
SET liveincolor=1 & SET "c_underline=[4m" & SET "c_reset=[0m" & SET "c_Red_Blak=[91;40m" & SET "c_Gre_Blak=[92;40m" & SET "c_Yel_Blak=[93;40m" & SET "c_Blu_Blak=[94;40m" & SET "c_Mag_Blak=[95;40m" & SET "c_Cya_Blak=[96;40m" & SET "c_Whi_Blak=[97;40m"

:: Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                Autodesk License Patcher Uninstaller              _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo          %c_Cya_Blak%...Welcome To Autodesk License Patcher Uninstaller...%c_Gre_Blak%
echo.
echo  %c_Red_Blak%This tool will uninstall and revert all the changes made%c_Gre_Blak%
echo  Run with administrator privileges and UAC disabled.
echo  Check "ReadMe" before using.
ping 127.0.0.1 -n 15 >Nul 2>&1
cls

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                Autodesk License Patcher Uninstaller              _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo  %c_Cya_Blak%Stopping ADSK Licensing Service And Reverting Changes%c_Gre_Blak%
ping 127.0.0.1 -n 5 >Nul 2>&1
echo.

regedit.exe /s "%SystemDrive%\AutodeskLicensePatcherUninstaller\Tweak.reg" >Nul 2>&1
schtasks.exe /Delete /tn "\Microsoft\Windows\Autodesk\Autodesk" /f >Nul 2>&1
netsh advfirewall firewall delete rule name="AutodeskNLM" >Nul 2>&1
cd "C:\Program Files (x86)\Common Files\Autodesk Shared\AdskLicensing" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
)
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
MsiExec.exe /X {4BE91685-1632-47FC-B563-A8A542C6664C} /qn >Nul 2>&1
@RD /S /Q "%SystemDrive%\Autodesk\Network License Manager\" >Nul 2>&1
del /f /q "%SystemDrive%\Autodesk\Network License Manager\" >Nul 2>&1
@RD /S /Q "%SystemDrive%\Autodesk\Network License Manager" >Nul 2>&1
del /f /q "%SystemDrive%\Autodesk\Network License Manager" >Nul 2>&1
@RD /S /Q "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\" >Nul 2>&1
del /f /q "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager\" >Nul 2>&1
@RD /S /Q "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager" >Nul 2>&1
del /f /q "%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager" >Nul 2>&1
@RD /S /Q "%SystemDrive%\AutodeskLicensePatcherInstaller" >Nul 2>&1
del /f /q "%SystemDrive%\AutodeskLicensePatcherInstaller" >Nul 2>&1
net start AdskLicensingService >Nul 2>&1
cls

DATE /T
TIME /T

echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%_                Autodesk License Patcher Uninstaller              _%c_Gre_Blak%
echo  %c_Red_Blak%_                                                                  _%c_Gre_Blak%
echo  %c_Red_Blak%____________________________________________________________________%c_Gre_Blak%
echo.
echo  %c_Cya_Blak%Autodesk License Patcher Uninstallation Completed%c_Gre_Blak%
echo  %c_Cya_Blak%Support Developers, Buy If You Like/Use It.
echo.
ping 127.0.0.1 -n 5 >Nul 2>&1

@RD /S /Q "%SystemDrive%\AutodeskLicensePatcherUninstaller" >Nul 2>&1
del /f /q "%SystemDrive%\AutodeskLicensePatcherUninstaller" >Nul 2>&1

:: CleanUp And Exit
cd \
(goto) 2>nul&rd /s /q "%~dp0"
del /q /f "%0"
cls & exit