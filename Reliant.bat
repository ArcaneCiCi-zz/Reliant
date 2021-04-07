@echo off
goto startup
:startup
set gitcommit=d941cdc
set relversion=%gitcommit%/master
set project=Reliant 1.10
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
set "DEL=%%a"
)

goto checkforupdates

:checkforupdates
echo [Reliant] Checking for updates...
if exist "Reliant-New.bat" (
    rename "Reliant-New.bat" "Reliant.bat"
)

if exist "assets\updater\updates.txt" (
    del "assets\updater\updates.txt"
)

if not exist "assets\updater\" (
    mkdir "assets\updater"
)

powershell -nologo -noprofile -command "Invoke-WebRequest 'https://arcanecici.github.io/Reliant/updates.txt' -OutFile '%CD%\assets\updater\updates.txt'"
set /p updatescommit=<"assets\updater\updates.txt"

if not %updatescommit% == %gitcommit% (
    goto updatereliant
) else (
    echo [Reliant] No updates found, starting Reliant...
    goto checks
)

:updatereliant
echo [Reliant] Downloading Update...
powershell -nologo -noprofile -command "Invoke-WebRequest 'https://arcanecici.github.io/Reliant/Reliant.bat' -OutFile '%CD%\Reliant-New.bat'"
echo [Reliant] Update Downloaded, restarting...
del "assets\updater\updates.txt"
rmdir "assets\updater\"
start cmd /k "Reliant-New.bat"
timeout /t 3 /nobreak >nul
del "Reliant.bat"
exit

:checks
title %project% (%relversion%)
if exist "assets\settings\" (
    del /f "assets\updater\updates.txt"
    goto welcome
) else (
    goto setup
    del "assets\updater\updates.txt"
)

:setup
cls
echo.
echo Welcome to Reliant! Please wait a moment...
mkdir "assets\settings"
timeout /t 2 /nobreak >nul
echo We're just setting up a few files for you to ensure you have a good experience using the tool.
echo F >> "assets\settings\color.txt"
echo F >> "assets\settings\color2.txt"
echo [Reliant] Created Color Settings.
echo 1 >> "assets\settings\update.txt"
echo [Reliant] Created Update Manager.
echo [Reliant] Downloading Changelog.

powershell -nologo -noprofile -command "Invoke-WebRequest 'https://raw.githubusercontent.com/ArcaneCiCi/Reliant/master/changelog.txt' -OutFile 'assets\settings\changelog.txt'"

echo [Reliant] Changelog Downloaded Successfully.
echo Reliant was set up successfully!
pause
timeout /t 3 /nobreak >nul
goto welcome

:welcome
set /p basecolor=<"assets\settings\color.txt"
set /p basecolor2=<"assets\settings\color2.txt"
set prevmenu=welcome
color %basecolor%
cls
set /p changelogupdate=<"assets\settings\update.txt"
if %changelogupdate%==0 ( 
    goto menubook
) else if %changelogupdate%==1 (
    goto changelogs
) else (
    echo Error! Update file is not set to 1 or 0.
    pause
    goto shutdown
)

:changelogs
cls
echo.
type "assets\settings\changelog.txt"
pause
break>"assets\settings\update.txt"
echo 0 >> "assets\settings\update.txt"
goto menubook

@rem START OF MENUBOOK PAGE

:menubook
cls
color %basecolor%
title %project% (%relversion%)
call :TextColor %basecolor2% "__________________________________________________________________"
echo.
echo.
echo                               ,   ,
echo                              /////]
echo                             ///// ]
echo                            [~~~]  ]
echo                            [===]  ]
echo                            [r  ]  ]
echo                            [ e ]  ]
echo                            [  l] /
echo                            [===]/
echo                            '---'
echo.
echo.
echo        Date is %date% - Time is %time%
echo                     Reliant Menu Booklet
call :TextColor %basecolor2% "__________________________________________________________________"
echo.
echo.
echo 1. Page 1
echo 2. Page 2
echo 3. Close Reliant
call :TextColor %basecolor2% "__________________________________________________________________"
echo.
echo Page Number:
choice /c 123 /n
if errorlevel 1 set menubookchoice=mainmenu
if errorlevel 2 set menubookchoice=mainmenu2
if errorlevel 3 set menubookchoice=shutdown
goto %menubookchoice%

@rem END OF MENUBOOK PAGE
@rem START OF FIRST MENU PAGE

:mainmenu
set prevmenu=mainmenu
cls
color %basecolor%
title %project% (%relversion%)
call :TextColor %basecolor2% "__________________________________________________________________"
echo.
echo.
echo                       Welcome to Reliant!
echo                     Date is %date%
echo                      Time is %time%
echo.
call :TextColor %basecolor% "                  [Reliant ~ ArcaneCiCi]"
echo.
call :TextColor %basecolor2% "__________________________________________________________________"
echo.
echo.
call :TextColor %basecolor% "             To exit the program, type 'exit'"
echo.
call :TextColor %basecolor% "             To edit settings, type 'settings'"
echo.
call :TextColor %basecolor% "         To return to the menu book, type 'menubook'"
echo.
call :TextColor %basecolor% "           To open the github page, type 'github'"
echo.
call :TextColor %basecolor2% "__________________________________________________________________"
echo.
echo.
echo 1. View System Info
echo 2. View all netstat
echo 3. Remote shutdown
echo 4. Open Logs Folder
echo 5. Reliant Terminal v1.0.1
echo 6. Random Number Generator
echo 7. Computer Messenger
echo 8. Disable Internet Connections
echo 9. Mass Text File Generator
echo 10. Run TracerT Commands
echo 11. Remote Desktop Connection
echo 12. Simple Calculator
echo 13. Printing Manager
echo 14. View all Computers On The Network
echo 15. File Directory Tree
echo 16. Reliant Encryption Tool
echo 17. Reliant Decryption Tool
call :TextColor %basecolor2% "__________________________________________________________________"
echo.
echo.

set /p "input=Selection:"
if %input%==menubook (
    goto menubook
) else if %input%==1 (
    goto 1
) else if %input%==2 (
    goto 2
) else if %input%==3 (
    goto 3
) else if %input%==4 (
    goto 4
) else if %input%==5 (
    goto 5
) else if %input%==6 (
    goto 6
) else if %input%==7 (
    goto 7
) else if %input%==8 (
    goto 8
) else if %input%==9 (
    goto 9
) else if %input%==10 (
    goto 10
) else if %input%==11 (
    goto 11
) else if %input%==12 (
    goto 12
) else if %input%==13 (
    goto 13
) else if %input%==14 (
    goto 14
) else if %input%==15 (
    goto 15
) else if %input%==16 (
    goto 16
) else if %input%==17 (
    goto 17
) else if %input%==settings (
    goto reliantsettings
) else if %input%==github (
    start https://github.com/ArcaneCiCi/Reliant
) else if %input%==exit (
    goto shutdown
) else (
    goto failed
)

:mainmenu2
set prevmenu=mainmenu2
cls
color %basecolor%
title %project% (%relversion%)
call :TextColor %basecolor2% "__________________________________________________________________"
echo.
echo.
echo                       Welcome to Reliant!
echo                     Date is %date%
echo                      Time is %time%
echo.
call :TextColor %basecolor2% "                  [Reliant ~ ArcaneCiCi]"
echo.
call :TextColor %basecolor2% "__________________________________________________________________"
echo.
echo.
call :TextColor %basecolor% "             To exit the program, type 'exit'"
echo.
call :TextColor %basecolor% "             To edit settings, type 'settings'"
echo.
call :TextColor %basecolor% "         To return to the menu book, type 'menubook'"
echo.
call :TextColor %basecolor% "           To open the github page, type 'github'"
echo.
call :TextColor %basecolor2% "__________________________________________________________________"
echo.
echo.
echo 18. File Renamer
echo 19. Reliant Cryptographic Signing Tool
echo 20. Run Java commands via command line
echo 21. Re-enable Internet
echo 22. Reliant Task Manager
echo 23. Reliant FTP Mode
echo 24. Reliant SSH Mode
echo 25. Build a Maven project
echo 26. Event Creator
call :TextColor %basecolor2% "__________________________________________________________________"
echo.
echo.
set /p "input=Selection:"

if %input%==menubook (
    goto :menubook
) else if %input%==exit (
    goto :mainexit
) else if %input%==settings (
    goto reliantsettings
) else if %input%==github (
    goto opengit
) else if %input%==18 (
    goto 18
) else if %input%==19 (
    goto 19
) else if %input%==20 (
    goto 20
) else if %input%==21 (
    goto 21
) else if %input%==22 (
    goto 22
) else if %input%==23 (
    goto 23
) else if %input%==24 (
    goto 24
) else if %input%==25 (
    goto 25
) else if %input%==26 (
    goto 26
) else (
    goto failed
)

@rem END OF SECOND MAIN MENU PAGE

:opengit
start https://github.com/ArcaneCiCi/Reliant

:1
set prevmenu=1
title %project% (%relversion%) 
cls
systeminfo
pause
goto mainmenu

:2
set prevmenu=2
color %basecolor%
cls
title %project% (%relversion%) 
echo.
netstat -a
timeout /t 5 /nobreak >nul
cls
color %basecolor%
echo.
echo.
echo Done!
timeout /t 5 >nul
echo Returning to the main menu.
timeout /t 3 /nobreak >nul
goto mainmenu

:3
set prevmenu=3
cls
title %project% (%relversion%) 
color %basecolor%
echo.
echo.
echo Enter computer name.
set /p "pcinput=>"
if %pcinput%=='' goto sendshutdown

:sendshutdown
shutdown /s /p /m \\computer %pcinput% > "assets\settings\remote_shutdown_logs.txt"
timeout /t 5 /nobreak >nul
echo Successfully shutdown %pcinput%! Returning to main menu.
timeout /t 10 /nobreak >nul
goto mainmenu
cls

:4
set prevmenu=4
title %project% (%relversion%) 
cls
color %basecolor%
echo.
echo Enter the path file where your logs folder is located.
set /p "logopeninput=> "
cls
echo Loading logs file, please wait a second.
timeout /t 1 /nobreak >nul
start explorer "%logopeninput%
cls
echo Log file folder opened, returning to the main menu.
timeout /t 2 /nobreak >nul
goto mainmenu

:5
set prevmenu=5
cls
echo.
title Reliant Terminal v1.0.1
echo To return to the main menu, type "goto mainmenu".
ver
echo Reliant Terminal v1.0.1
cd C:\
goto devmode

:devmode
color f
title Reliant Terminal v1.0.1
set /p "devinput=%cd%>"
%devinput%
goto devmode


:6
cls
color %basecolor%
title Reliant ad66d04 
echo.
echo ============================
echo Generated Number: %random%
echo ============================
echo.
echo Press any key to return to the main menu.
pause >nul
goto mainmenu

:7
cls
title Reliant ad66d04 
echo Enter Computer name you want to message
set /p "MsgName="
if %MsgName%=='' goto 7_2
:7_2
cls
echo Enter message you want to send:
set /p "MsgMessage="
if %MsgMessage%=='' goto 7_3
:7_3
cls
msg %MsgName% %MsgMessage%
timeout /t 5 /nobreak >nul
cls
echo Message Sent! Returning to the main menu...
timeout /t 5 /nobreak >nul
goto mainmenu

:8
cls
title Reliant ad66d04 
echo.
echo To reverse this, run tool "21".
timeout /t 5 >nul
ipconfig /release >nul
if ERRORLEVEL1 ipconfig /release all >nul
timeout /t 3 >nul
goto mainmenu

:9
cls
title Reliant ad66d04 
echo.
echo Enter the file path you want to generate files to.
set /p "filespaminput=>"
mkdir %filespaminput%\"reliant_output_folder"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
echo %random% >> "%filespaminput%\reliant_output_folder\%random%.txt"
cls
echo.
echo Done.
timeout /t 3 /nobreak >nul
goto mainmenu

:10
cls
title Reliant ad66d04 
echo Enter the IP you would like to run "tracert" on.
set /p "tracertinput=>"
tracert -d %tracertinput%
timeout /t 1 /nobreak >nul
echo Done.
timeout /t 3
goto mainmenu

:11
cls
echo.
MSTSC
echo Press any key to return to the main menu.
pause >nul
goto mainmenu

:restartreliant
cls
echo.
echo Restarting...
timeout /t 3 /nobreak >nul
goto startup

:12
cls
title Reliant ad66d04 
echo ---------------------------
echo Reliant Calculator
echo.
echo Previous Answer: %ans%
echo.
echo Example: 2+2 and hit enter.
echo ---------------------------
echo.
set /p sum=
set /a ans=%sum%
echo.
echo = %ans%
echo --------------------------------------------------------------
pause
cls
goto 12

:14
cls
title Reliant ad66d04 
color %basecolor%
echo.
echo Enter the domain name you would like to view.
set /p "networkviewinput=>"
net view /all /domain %networkviewinput%
echo.
echo Press any key to return to the main menu.
pause >nul
goto mainmenu

:15
cls
title Reliant ad66d04 
set /p "treeinput=File Path:"
tree %treeinput%
pause >nul
echo Process:%input% Done!
echo Returning to main menu.
timeout /t 5 /nobreak >nul
goto mainmenu

:reloadreliant
cls
echo.
echo [%time%]: Reloading.
timeout /t 1 /nobreak >nul
goto mainmenu

:reportbug
cls
color %basecolor%
echo.
echo To report a bug, please create an issue on the github repository we have opened for you.
start "" https://github.com/ArcaneCiCi/Reliant/issues
echo.
pause
goto mainmenu

:18
cls
echo.
echo Enter the file path of the file you want to rename, please include the file and the proper file extension.
set /p "reliantfilerenamerpath=> "
echo.
echo Enter the name you want to rename the file to.
set /p "filerenameinput=> "
ren "%reliantfilerenamerpath%" %filerenameinput%
cls
echo.
echo File renamed! Returning to the main menu.
timeout /t 3 /nobreak >nul
goto mainmenu

:19
cls
set prevmenu=19
title Reliant Cryptographic Signing Tool. 
echo Make sure your file is on your desktop.
cd %USERPROFILE%\desktop
echo Enter the file name of which you want to sign.
set /p "signinput=>"
echo Enter the alias you want to use when signing "%signinput%".
set /p "sign2input=>"
echo Do you want to sign the file with the current date and time?
echo 1. Yes
echo 2. No
set /p "signinput3=>"
if %signinput3%==1 goto signinput3yes
if %signinput3%==2 goto signinput3no

:signinput3yes
echo [CRYPTOGRAPHIC SIGNITURE]: Signed by %sign2input% at %time% on %date%. >> %signinput%
echo Signed!
echo Press any key to return to the main menu.
pause >nul
goto mainmenu2

:signinput3no
echo [CRYPTOGRAPHIC SIGNITURE]: Signed by %sign2input%. >> %signinput%
echo Signed!
echo Press any key to return to the main menu.
pause >nul
goto mainmenu2

:16
cls
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
title Reliant Encryption v%relversion% 
color %basecolor%
set savefile=on

(set CHAR[a]=UDFM45) & (set CHAR[b]=H20DGF) & (set CHAR[c]=FDH56D) & (set CHAR[d]=FGS546) & (set CHAR[e]=JUK4JH)
(set CHAR[f]=ERG54S) & (set CHAR[g]=T5H4FD) & (set CHAR[h]=RG641G) & (set CHAR[i]=RG4F4D) & (set CHAR[j]=RT56F6)
(set CHAR[k]=VCBC3B) & (set CHAR[l]=F8G9GF) & (set CHAR[m]=FD4CJS) & (set CHAR[n]=G422FG) & (set CHAR[o]=F45GC2)
(set CHAR[p]=TH5DF5) & (set CHAR[q]=CV4F6R) & (set CHAR[r]=XF64TS) & (set CHAR[s]=X78DGT) & (set CHAR[t]=TH74SJ)
(set CHAR[u]=BCX6DF) & (set CHAR[v]=FG65SD) & (set CHAR[w]=4KL45D) & (set CHAR[x]=GFH3F2) & (set CHAR[y]=GH56GF)
(set CHAR[z]=45T1FG) & (set CHAR[1]=D4G22D) & (set CHAR[2]=GB56FG) & (set CHAR[3]=SF45GF) & (set CHAR[4]=P4FF12)
(set CHAR[5]=F6DFG1) & (set CHAR[6]=56FG4G) & (set CHAR[7]=USGFDG) & (set CHAR[8]=FKHFDG) & (set CHAR[9]=IFGJH6)
(set CHAR[0]=87H8G7) & (set CHAR[@]=G24GHF) & (set CHAR[#]=45FGFH) & (set CHAR[$]=75FG45) & (set CHAR[*]=54GDH5)
(set CHAR[(]=45F465) & (set CHAR[.]=HG56FG) & (set CHAR[,]=DF56H4) & (set CHAR[-]=F5JHFH) & (set CHAR[ ]=SGF4HF)
(set CHAR[\]=45GH45) & (set CHAR[/]=56H45G)

echo Enter a string to encrypt:
set /p Encrypt=
cls
set Encrypt2=%Encrypt%
set "EncryptOut="
:encrypt2
set char=%Encrypt2:~0,1%
set Encrypt2=%Encrypt2:~1%
set EncryptOut=%EncryptOut%!CHAR[%char%]!
if not "%Encrypt2%"=="" goto encrypt2
echo Input string: %Encrypt%
echo.
echo Output string: %EncryptOut%
set string=%EncryptOut%
set temp_str=%string%
set str_len=0

:lengthloop
if defined temp_str (
set temp_str=%temp_str:~1%
set /A str_len += 1
goto lengthloop )
echo.
echo Output string is %str_len% characters long!
if "%savefile%"=="on" echo.%EncryptOut%>>"assets\settings\encrypted.txt"
echo.
pause >nul
cls
goto mainmenu

:17
cls
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
title Reliant Decryption v%relversion% 
color %basecolor%
set savefile=on
(set CHAR[UDFM45]=a) & (set CHAR[H20DGF]=b) & (set CHAR[FDH56D]=c) & (set CHAR[FGS546]=d) & (set CHAR[JUK4JH]=e)
(set CHAR[ERG54S]=f) & (set CHAR[T5H4FD]=g) & (set CHAR[RG641G]=h) & (set CHAR[RG4F4D]=i) & (set CHAR[RT56F6]=j)
(set CHAR[VCBC3B]=k) & (set CHAR[F8G9GF]=l) & (set CHAR[FD4CJS]=m) & (set CHAR[G422FG]=n) & (set CHAR[F45GC2]=o)
(set CHAR[TH5DF5]=p) & (set CHAR[CV4F6R]=q) & (set CHAR[XF64TS]=r) & (set CHAR[X78DGT]=s) & (set CHAR[TH74SJ]=t)
(set CHAR[BCX6DF]=u) & (set CHAR[FG65SD]=v) & (set CHAR[4KL45D]=w) & (set CHAR[GFH3F2]=x) & (set CHAR[GH56GF]=y)
(set CHAR[45T1FG]=z) & (set CHAR[D4G22D]=1) & (set CHAR[GB56FG]=2) & (set CHAR[SF45GF]=3) & (set CHAR[P4FF12]=4)
(set CHAR[F6DFG1]=5) & (set CHAR[56FG4G]=6) & (set CHAR[USGFDG]=7) & (set CHAR[FKHFDG]=8) & (set CHAR[IFGJH6]=9)
(set CHAR[87H8G7]=0) & (set CHAR[G24GHF]=@) & (set CHAR[45FGFH]=#) & (set CHAR[75FG45]=$) & (set CHAR[54GDH5]=*)
(set CHAR[45F465]=() & (set CHAR[HG56FG]=.) & (set CHAR[DF56H4]=,) & (set CHAR[F5JHFH]=-) & (set CHAR[SGF4HF]= )
(set CHAR[45GH45]=\) & (set CHAR[56H45G]=/)
echo Enter a string to decrypt:
set /p Decrypt=
cls
set Decrypt2=%Decrypt%
set "DecryptOut="
:decrypt2
set char=%Decrypt2:~0,6%
set Decrypt2=%Decrypt2:~6%
set DecryptOut=%DecryptOut%!CHAR[%char%]!
if not "%Decrypt2%"=="" goto decrypt2
echo Input string: %Decrypt%
echo.
echo Output string: %DecryptOut%
set string=%DecryptOut%
set temp_str=%string%
set str_len=0

:lengthloop
if defined temp_str (
set temp_str=%temp_str:~1%
set /A str_len += 1
goto lengthloop )
echo.
echo Output string is %str_len% characters long!
if "%savefile%"=="on" echo.%DecryptOut%>>"assets\settings\decrypted.txt"
echo.
pause >nul
cls
goto mainmenu

:reliantsettings
cls
set prevmenu=reliantsettings
echo.
echo -----------------
echo Reliant Settings.
echo -----------------
echo.
echo 1. Change text colors
echo 2. Change menu barrier colors
echo 3. Restart Reliant
echo 4. Update Reliant
echo 5. Reload Reliant
echo 6. Report Bugs
choice /c 123456 /n
if errorlevel 1 set menubookchoice=reliantsettings_2
if errorlevel 2 set menubookchoice=reliantsettings_3
if errorlevel 3 set menubookchoice=restartreliant
if errorlevel 4 set menubookchoice=update
if errorlevel 5 set menubookchoice=reloadreliant
if errorlevel 6 set menubookchoice=reportbug
goto %menubookchoice%

:reliantsettings_2
cls
echo.
echo What color would you like to change the text to?
echo.
type "assets\settings\colors.txt"
echo.
echo.
echo Enter a color.
echo.
set /p "relcolorchangeinput=>"
break>"assets\settings\color.txt"
echo %relcolorchangeinput% >> "assets\settings\color.txt"
set /p basecolor=<"assets\settings\color.txt"
cls
echo.
echo Color changed to %relcolorchangeinput%! Exiting to the main menu
timeout /t 3 /nobreak >nul
goto mainmenu

:reliantsettings_3
cls
echo.
echo What color would you like to change the barriers to?
echo.
type "assets\settings\colors.txt"
echo.
echo.
echo Enter a color.
echo.
set /p "relcolorchangeinput2=>"
break>"assets\settings\color2.txt"
echo %relcolorchangeinput2% >> "assets\settings\color2.txt"
set /p basecolor2=<"assets\settings\color2.txt"
cls
echo.
echo Color changed to %relcolorchangeinput2%! Exiting to the main menu
timeout /t 3 /nobreak >nul
goto mainmenu

:21
cls
echo.
echo Reverting release adapter.
echo.
ipconfig /renew >nul
echo Fixed.
timeout /t 3 >nul
goto mainmenu

:22
cls
title Reliant ad66d04 
color %basecolor%
echo.
echo ----------------------------------------------------------------
echo.
echo           Welcome to Reliant Task Manager 1.0!
echo.
echo                       Date is %date%.
echo.
echo                       Time is %time%.
echo.
echo ----------------------------------------------------------------
echo.
echo.
goto choice
exit /b
:list
wmic process get Name, ProcessID
goto choice
:kill
set /p "relianttaskmanagerinput=Enter the process name/PID you wish to terminate: "
taskkill /pid %relianttaskmanagerinput%
goto choice
:close
cls
color %basecolor%
echo.
echo ----------------------------------------------------------------
echo.
echo       You have been using Reliant Task Manager 1.0!
echo.
echo                       Date is %date%.
echo.
echo                       Time is %time%.
echo.
echo ----------------------------------------------------------------
echo.
pause >null
DEL null
goto mainmenu2
:choice
echo Choose from the following:
echo 1. List processes currently running
echo 2. Kill a process by name/PID
echo 3. Exit Reliant Task Manager
choice /c 123 /n
if errorlevel 1 set gt=list
if errorlevel 2 set gt=kill
if errorlevel 3 set gt=mainmenu2
goto %gt%
goto choice

:23
cls
title %project% (%relversion%) (FTP Mode)
echo.
echo Entering FTP mode.
FTP
pause
goto mainmenu2

:24
cls
title %project% (%relversion%) (SSH Mode)
echo.
echo Entering SSH Mode, Purely runs SSH commands.
SSH
goto 24_2
:24_2
set /p "sshinput=> "
SSH %sshinput%
pause
goto 24_2

:25
cls
title Reliant ad66d04 
echo.
echo Enter the file path of the project.
set /p "mavenbuildinput=>"
cd %mavenbuildinput%
title Building Project...
mvn clean install
cls
title Reliant ad66d04 
echo.
echo If the project was not built correctly, there might be an issue in your code or pom.xml.
echo We do not accept support for issues in your project.
echo Press a key to return to the main menu.
echo.
pause >nul
goto mainmenu2

:20
cls
title Reliant ad66d04 
echo.
color f
echo Here you can run any java command via the command prompt.
echo To successfully build the project, drag your project folder to the folder "Reliant".
echo.
echo We also did you a favor and output everything you enter into 'javalog.txt' file, just so you can see what you did previously.
echo.
echo You can now type java commands, if you need to see what you previously entered you can always check 'assets\logs\javalog.txt'.
echo.
:javatop
set /p "javacmdinput=%cd%>"
java %javacmdinput%
echo %javacmdinput% >> "assets\logs\javalog.txt"
break>"assets\logs\javalog.txt"
goto javatop


:13
cls
title Reliant ad66d04 
echo.
echo What would you like to do?
echo.
echo 1. Type a string out and print it.
echo 2. Print a file.
echo 3. Return to the menubook.
set /p "reliantprintinput=Selection: "
if %reliantprintinput%==1 (
    goto 13_1
) else if %reliantprintinput%==2 (
    goto 13_2
) else if %reliantprintinput%==3 (
    goto menubook
) else (
    goto failed
)

:13_2
cls
echo.
echo Enter the string you want to print.
set /p "printstringinput=Input: "
cls
echo Enter the correct printing device name.
set /p "printdeviceinput=Device: "
echo %printstringinput% >> Desktop\print.txt
timeout /t 3 /nobreak >nul
print /d %printdeviceinput% Desktop\print.txt
timeout /t 10 /nobreak >nul
echo String Printed! Returning to the menu book.
del Desktop\print.txt
timeout /t 3 /nobreak >nul
goto menubook

:13_3
cls
echo.
echo Enter the file path for the file you want to print. (Include file name and file extension)
set /p "fileprintinput=Path: "
cls
echo Enter the correct printing device name.
set /p "printdeviceinput2=Device: "
print /d %printdeviceinput2% %fileprintinput%
echo.
timeout /t 5 /nobreak >nul
echo Printed %fileprintinput%! Returning to the menu book.
timeout /t 3 /nobreak >nul
goto menubook

:26
cls
echo.
eventcreate /?
echo.
echo.
:26top
echo Type an event creation command.
set /p "eventcreateinput=> "
eventcreate %eventcreateinput%
goto mainmenu

:failed
cls
color 4
echo.
echo Error: Invalid selection or invalid syntax!
echo Press any key to return to the menubook.
pause >nul
goto menubook



:reliantsettings_2
cls
echo.
echo What color would you like to change the text to?
echo.
type "assets\settings\colors.txt"
echo.
echo.
echo Enter a color.
echo.
set /p "relcolorchangeinput=>"
break>"assets\settings\color.txt"
echo %relcolorchangeinput% >> "assets\settings\color.txt"
set /p basecolor=<"assets\settings\color.txt"
cls
echo.
echo Color changed to %relcolorchangeinput%! Exiting to the main menu
timeout /t 3 /nobreak >nul
goto mainmenu

:reliantsettings_3
cls
echo.
echo What color would you like to change the barriers to?
echo.
type "assets\settings\colors.txt"
echo.
echo.
echo Enter a color.
echo.
set /p "relcolorchangeinput2=>"
break>"assets\settings\color2.txt"
echo %relcolorchangeinput2% >> "assets\settings\color2.txt"
set /p basecolor2=<"assets\settings\color2.txt"
cls
echo.
echo Color changed to %relcolorchangeinput2%! Exiting to the main menu
timeout /t 3 /nobreak >nul
goto mainmenu

:shutdown
cls
color %basecolor%
echo.
echo Saving Settings
echo %relcolorchangeinput2% >> "assets\settings\color2.txt"
echo %relcolorchangeinput% >> "assets\settings\color.txt"
echo.
timeout /t 3 /nobreak >nul
exit

:TextColor
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1