:: Starting Parameters
@echo off & color a & chcp 1254 & mode con: cols=55 lines=11 & title Internet Connection & cls
SET liveincolor=1 & SET "c_underline=[4m" & SET "c_reset=[0m" & SET "c_Red_Blak=[91;40m" & SET "c_Gre_Blak=[92;40m" & SET "c_Yel_Blak=[93;40m" & SET "c_Blu_Blak=[94;40m" & SET "c_Mag_Blak=[95;40m" & SET "c_Cya_Blak=[96;40m" & SET "c_Whi_Blak=[97;40m"

:: Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

:: Start From Here
:begin
cd "C:\Program Files\Autodesk" >Nul 2>&1
mode con: cols=55 lines=11
cls

echo  %c_Red_Blak%_____________________________________________________%c_Gre_Blak%
echo.
echo                   %c_Red_Blak%Internet Connection%c_Gre_Blak%
echo       %c_Red_Blak%Please Run As Administrator And Disable UAC%c_Gre_Blak%
echo  %c_Red_Blak%_____________________________________________________%c_Gre_Blak%
echo.
echo  In And Out Internet Connection To Autodesk Products
echo  1) %c_Red_Blak%Block%c_Gre_Blak%
echo  2) %c_Red_Blak%UnBlock%c_Gre_Blak%
echo.


SET INPUT=
SET /P INPUT= Type Your Decision:

IF /I '%INPUT%'=='1' GOTO block
IF /I '%INPUT%'=='2' GOTO unblock
IF /I '%INPUT%'=='exit' GOTO exit
IF /I '%INPUT%'=='close' GOTO exit
GoTo Begin

:: Block Autodesk
:block
cls
mode con: cols=55 lines=3
echo.
echo  This may take a while, please wait...
cd "C:\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=out action=block profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=in action=block profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files (x86)\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=out action=block profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=in action=block profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files (x86)\Common Files\Autodesk Shared" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=out action=block profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=in action=block profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files (x86)\Common Files\Macrovision Shared" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=out action=block profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=in action=block profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=out action=block profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=in action=block profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files\Common Files\Autodesk Shared" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=out action=block profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=in action=block profile=any program="%%a" >Nul 2>&1
)
cd "C:\ProgramData\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=out action=block profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=in action=block profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files\NREL" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=out action=block profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=in action=block profile=any program="%%a" >Nul 2>&1
)
cd "%appdata%\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=out action=block profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=in action=block profile=any program="%%a" >Nul 2>&1
)
cd "%localappdata%\Programs\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=out action=block profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Blocked %%a" dir=in action=block profile=any program="%%a" >Nul 2>&1
)
cls
echo.
echo  Completed & ping 127.0.0.1 -n 5 >Nul 2>&1 & exit

:: UnBlock Autodesk
:unblock
cls
mode con: cols=55 lines=3
echo.
echo  This may take a while, please wait...
cd "C:\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=out action=allow profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=in action=allow profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files (x86)\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=out action=allow profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=in action=allow profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files (x86)\Common Files\Autodesk Shared" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=out action=allow profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=in action=allow profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files (x86)\Common Files\Macrovision Shared" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=out action=allow profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=in action=allow profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=out action=allow profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=in action=allow profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files\Common Files\Autodesk Shared" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=out action=allow profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=in action=allow profile=any program="%%a" >Nul 2>&1
)
cd "C:\ProgramData\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=out action=allow profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=in action=allow profile=any program="%%a" >Nul 2>&1
)
cd "C:\Program Files\NREL" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=out action=allow profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=in action=allow profile=any program="%%a" >Nul 2>&1
)
cd "%appdata%\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=out action=allow profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=in action=allow profile=any program="%%a" >Nul 2>&1
)
cd "%localappdata%\Programs\Autodesk" >Nul 2>&1
for /R %%a in (*.exe) do (
netsh advfirewall firewall delete rule name="Allowed %%a" >Nul 2>&1
netsh advfirewall firewall delete rule name="Blocked %%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=out action=allow profile=any program="%%a" >Nul 2>&1
netsh advfirewall firewall add rule name="Allowed %%a" dir=in action=allow profile=any program="%%a" >Nul 2>&1
)
cls
echo.
echo  Completed & ping 127.0.0.1 -n 5 >Nul 2>&1 & exit

:: CleanUp And Exit
cls & exit