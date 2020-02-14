@echo off
goto startup
:startup
mode 1000
set relversion=1.8
set /p clientid=<"assets\logs\ClientID.txt"
set project=Reliant-1.8
set /p reliantcolorinput=<"assets\logs\color.txt"
echo Currently running on version v%relversion% - %date% - %time%! > "assets\logs\version_logs.txt"
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
    set "DEL=%%a"
)

title Reliant Updater
if exist "assets\logs\" goto bootcheck3
if exist "assets\logs\" goto failedboot

:failedboot
cls
color 4
echo.
echo Important folder not detected! Shutting down.
timeout /t 5 /nobreak >nul
exit

:bootcheck3
if exist "assets\logs\ClientID.txt" goto startup1 >nul
if not exist "assets\logs\ClientID.txt" goto giveclientid >nul

:startup1
if %~n0%~x0==reliant-%relversion%.bat goto ClientAUTHID
if not %~n0%~x0==reliant-%relversion%.bat ren %~n0%~x0==reliant-%relversion%.bat


:giveclientid
cls
echo.
echo No Client ID found! Giving you one.
echo %random% >> "assets\logs\ClientID.txt"
set /p clientid=<"assets\logs\ClientID.txt"
echo Client ID given successfully! Your new Client ID is %clientid%.
timeout /t 5 /nobreak >nul
goto ClientAUTHID

:ClientAUTHID
set prevmenu=ClientAUTHID
cls
color %reliantcolorinput%
echo.              
echo Authorizing Client ID: %clientid%
echo. 
if exist "assets\logs\ClientID.txt" goto ClientAUTHID2
if not exist "assets\logs\ClientID.txt" goto giveclientid
timeout /t 1 /nobreak >nul
:ClientAUTHID2
echo.
echo Checking Client Version.
timeout /t 1 /nobreak >nul
if %relversion%==1.8 goto welcome
if NOT %relversion%==1.8 goto client_updater

:failedclientauth
set prevmenu=failedclientauth
cls
color 4
echo Incorrect Client Version, please update your "relversion" variable.
pause >nul
exit

:welcome
set prevmenu=welcome
color %reliantcolorinput%
cls
set /p changelogupdate=<"assets\logs\update.txt"
if %changelogupdate%==0 goto menubook
if %changelogupdate%==1 goto changelogs
if NOT %changelogupdate%==0 goto failed
if NOT %changelogupdate%==1 goto failed

:changelogs
cls
echo.
echo v%relversion%
type "assets\logs\changelogs.txt"
pause
break>"assets\logs\update.txt"
echo 0 >> "assets\logs\update.txt"
goto menubook

:menubook
set prevmenu=menubook
cls
color %reliantcolorinput%
title Reliant Menu Book v%relversion% (menu_booklet.bat)                                                                   
call :ColorText 5 "------------------------------------------------------------------"
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
call :ColorText 5 "------------------------------------------------------------------"
echo.
echo 1. Page 1
echo 2. Page 2
call :ColorText 5 "------------------------------------------------------------------"
echo.
set /p "menubookinput=Page Number:"
if %menubookinput%==1 goto mainmenu
if %menubookinput%==2 goto mainmenu2
if not %menubookinput%==1 goto failed
if not %menubookinput%==2 goto failed

:mainmenu
set prevmenu=mainmenu
cls
color %reliantcolorinput%
title Reliant Main Menu v%relversion% (main_menu_wrapper.bat)                                                                       
call :ColorText 5 "------------------------------------------------------------------"
echo.
echo.
echo                       Welcome to Reliant!
echo                  Your client ID is: %clientid%
echo                     Date is %date%
echo                      Time is %time%
echo.
call :ColorText 5 "                  [Reliant ~ ArcaneCiCi]"
echo.
call :ColorText 5 "------------------------------------------------------------------"
echo.
call :ColorText a "             To exit the program, type 'exit'"
echo.
call :ColorText a "             To edit settings, type 'settings'"
echo.
call :ColorText a "         To return to the menu book, type 'menubook'"
echo.
call :ColorText a "           To open the github page, type 'github'"
echo.
call :ColorText 5 "------------------------------------------------------------------"
echo.
echo 1. View System Info.
echo 2. View all netstat.
echo 3. Remote shutdown.
echo 4. Open log text file(s).
echo 5. Open Reliant Command Prompt.
echo 6. Random Number Generator.
echo 7. Reliant Computer Messenger.
echo 8. Release Adapter.
echo 9. Text file generator.
echo 10. TracerT Menu.
echo 11. Restart Reliant.
echo 12. Simple Calculator.
echo 13. Client Updater.
echo 14. View all computers on the network.
echo 15. File Directory Tree.
echo 16. Client Reloader.
echo 17. Report Bugs (outputs to a text file, which you can then create an issue on Reliant's repository).
call :ColorText 5 "------------------------------------------------------------------"
echo.
set /p "input=Selection:"
if %input%==menubook goto :menubook
if %input%==1 goto 1
if %input%==2 goto 2
if %input%==3 goto 3
if %input%==4 goto 4
if %input%==5 goto 5 
if %input%==6 goto 6
if %input%==7 goto 7
if %input%==8 goto 8
if %input%==9 goto 9
if %input%==10 goto 10
if %input%==11 goto 11
if %input%==12 goto 12
if %input%==13 goto 13
if %input%==14 goto 14 
if %input%==15 goto 15 
if %input%==16 goto 16
if %input%==17 goto 17
if %input%==settings goto reliantsettings
if %input%==github goto githubpage1
if %input%==exit goto :mainexit
if not %input%==1 goto failed
if not %input%==2 goto failed
if not %input%==3 goto failed
if not %input%==4 goto failed
if not %input%==5 goto failed
if not %input%==6 goto failed
if not %input%==7 goto failed
if not %input%==8 goto failed
if not %input%==9 goto failed
if not %input%==10 goto failed
if not %input%==12 goto failed
if not %input%==13 goto failed
if not %input%==14 goto failed
if not %input%==15 goto failed
if not %input%==16 goto failed
if not %input%==17 goto failed
if not %input%==menubook goto failed
if not %input%==settings goto failed
if not %input%==github goto failed
if not %input%==exit goto failed

:mainmenu2
set prevmenu=mainmenu2
cls
color %reliantcolorinput%
title Reliant Main Menu Page 2 v%relversion% (main_menu_wrapper.bat)                                                                   
call :ColorText 5 "------------------------------------------------------------------"
echo.
echo.
echo                       Welcome to Reliant!
echo                  Your client ID is: %clientid%
echo                     Date is %date%
echo                      Time is %time%
echo.
call :ColorText 5 "                  [Reliant ~ ArcaneCiCi]"
echo.
call :ColorText 5 "------------------------------------------------------------------"
echo.
call :ColorText a "             To exit the program, type 'exit'"
echo.
call :ColorText a "             To edit settings, type 'settings'"
echo.
call :ColorText a "         To return to the menu book, type 'menubook'"
echo.
call :ColorText a "           To open the github page, type 'github'"
echo.
call :ColorText 5 "------------------------------------------------------------------"
echo.
echo 18. File Renamer.
echo 19. Encrypt any string.
echo 20. Decrypt any string.
echo 21. ReEnable Internet.
echo 22. Reliant Task Manager.
echo 23. Reliant FTP Mode.
echo 24. Reliant SSH Mode.
echo 25. Reliant Printing Manager.
call :ColorText 5 "------------------------------------------------------------------"
echo.
set /p "input=Selection:"
if %input%==menubook goto :menubook
if %input%==exit goto :mainexit
if %input%==settings goto reliantsettings
if %input%==github goto githubpage2
if %input%==18 goto 18
if %input%==19 goto 19
if %input%==20 goto 20
if %input%==21 goto 21
if %input%==22 goto 22
if %input%==23 goto 23
if %input%==24 goto 24
if %input%==25 goto 25
if not %input%==exit goto failed
if not %input%==settings goto failed
if not %input%==github goto failed
if not %input%==menubook goto failed
if not %input%==18 goto failed
if not %input%==19 goto failed
if not %input%==20 goto failed
if not %input%==21 goto failed
if not %input%==22 goto failed
if not %input%==23 goto failed
if not %input%==24 goto failed
if not %input%==25 goto failed


:1
set prevmenu=1
title Reliant v%relversion% (systeminfo_user.bat)
cls
systeminfo
pause
goto mainmenu

:2
set prevmenu=2
color %reliantcolorinput%
cls
title Reliant v%relversion% (process-%input%) (netstat_wrapper.bat)
echo.
netstat -a
timeout /t 5 /nobreak >nul
cls
color %reliantcolorinput%
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
title Reliant v%relversion% (process-%input%) (shutdown_wrapper.bat)
color %reliantcolorinput%
echo.
echo.
echo Enter computer name.
set /p "pcinput=>" 
if %pcinput%=='' goto sendshutdown

:sendshutdown
shutdown /s /p /m \\computer %pcinput% > "assets\logs\remote_shutdown_logs.txt"
timeout /t 5 /nobreak >nul
echo Successfully shutdown %pcinput%! Returning to main menu.
timeout /t 10 /nobreak >nul
goto mainmenu
cls

:4
set prevmenu=4
title Reliant v%relversion% (log_folder_viewer.bat)
cls
color %reliantcolorinput%
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
title Reliant Terminal v1.0.1 (terminal.bat)
echo To return to the main menu, type "goto mainmenu".
ver
echo Reliant Terminal v1.0.1
cd C:\
goto devmode
:devmode
color f
title Reliant Terminal v1.0.1 (terminal.bat)
set /p "devinput=%cd%>"
%devinput%
goto devmode

:failed
cls
color 4
echo.
echo Error: Invalid selection or invalid syntax!
echo Press any key to return to area you were in.
pause >nul
goto %prevmenu%

:6
cls
color %reliantcolorinput%
title Reliant v%relversion% (number_generator.bat)
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
title Reliant v%relversion% (process-%input%) (msg.bat)
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
title Reliant v%relversion% (process-%input%) (internet_disabler.bat)
echo.
echo To reverse this, run tool "21".
timeout /t 5 >nul
ipconfig /release >nul
if ERRORLEVEL1 ipconfig /release all >nul
timeout /t 3 >nul
goto mainmenu

:9
cls
title Reliant v%relversion% (text_file_generator.bat)
echo.
echo Enter the file path you want to generate.
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
cls
echo.
echo Done.
timeout /t 3 /nobreak >nul
goto mainmenu

:10
cls
title Reliant v%relversion% (tracert_mode).bat)
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
echo Restarting...
timeout /t 3 /nobreak >nul
goto startup

:12
cls
title Reliant v%relversion% (process-%input%) (reliant_calculator.bat)
echo ---------------------------
echo Reliant Calculator 
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
echo Previous Answer: %ans%
pause >nul
goto 12

:13
cls
title Reliant Updater v%relversion% (process-%input%) (client_updater.bat)
color f
echo Welcome to Client Updater v1.0.2 If an update is required, Reliant will crash, if it does not it will return to the main menu.
timeout /t 2 /nobreak >nul
if %~n0%~x0==reliant-%relversion%.bat ren %~n0%~x0==reliant-%relversion%.bat
if not %~n0%~x0==reliant-%relversion%.bat goto 13_2

:13_3
echo No updated needed.. Returning to the main menu.
timeout /t 5 /nobreak >nul
goto prevmenu

:14
cls
title Reliant v%relversion% (process-%input%) (network_view.bat)
color %reliantcolorinput%
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
title Reliant v%relversion% (process-%input%) (tree_path_viewer.bat)
set /p "treeinput=File Path:"
tree %treeinput%
pause >nul
echo Process-%input% Done!
echo Returning to main menu.
timeout /t 5 /nobreak >nul
goto mainmenu

:16
cls
echo.
echo [%time%]: Reloading.
goto mainmenu

:17
cls
color %reliantcolorinput%
echo.
echo What bug would you like to report?
echo.
echo 1. Graphical issue.
echo 2. Crash issue (Provide crash report located in assets\logs\crash_reports.txt).
echo 3. Code issue.
echo 4. Feature not working.
echo 5. Other.
echo.
set /p "bugtypeinput=> "
if %bugtypeinput%==1 set %bugtypeinput%=Graphical Issue
if %bugtypeinput%==2 set %bugtypeinput%=Crash Issue
if %bugtypeinput%==3 set %bugtypeinput%=Code Issue
if %bugtypeinput%==4 set %bugtypeinput%=Feature Issue
if %bugtypeinput%==5 set %bugtypeinput%=Other Issue.
cls
echo.
echo Please detail what the issue is.
set /p "bugdetailinput=> "
break "assets\logs\bug_report.txt"
echo Bug issue %bugtypeinput% received at %time% on %date%, bug is detailed as %bugdetailinput%. >> "assets\bug_report.txt"
echo Done! Wait 3 seconds and press any key to return to the main menu.
timeout /t 3 /nobreak >nul
pause >nul
goto mainmenu

:mainexit
cls
color %reliantcolorinput%
echo.
echo Shutting down %project% running on v%relversion%, running on process %input% (shutdown_launch_protocol.bat)...
echo Project: %project%-%relversion%.
echo.
timeout /t 3 /nobreak >nul
exit

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
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
title Reliant Encryption v%relversion% (process-%input%) (reliant_string_encryption.bat)
color %reliantcolorinput%
set savefile=on
::set Encrypt=Nothing
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
if "%savefile%"=="on" echo.%EncryptOut%>>"assets\logs\encrypted.txt"
echo.
pause >nul
cls
goto mainmenu2

:20
cls
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
title Reliant Decryption v%relversion% (process-%input%) (reliant_string_decryption.bat)
color %reliantcolorinput%
set savefile=on
::set Decrypt=Nothing
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
if "%savefile%"=="on" echo.%DecryptOut%>>"assets\logs\decrypted.txt"
echo.
pause >nul
cls
goto mainmenu2

:reliantsettings
cls
set prevmenu=reliantsettings
echo.
echo -----------------
echo Reliant Settings.
echo -----------------
echo.
echo 1. Change text colors
set /p "relsettingsinput=> "
if %relsettingsinput%==1 goto reliantsettings_2
if not %relsettingsinput%==1 goto failed

:reliantsettings_2
cls
echo.
echo What color would you like to change the text to?
echo.
color /?
echo.
echo Enter a color.
echo.
set /p "relcolorchangeinput=>"
break>"assets\logs\color.txt"
echo %relcolorchangeinput% >> "assets\logs\color.txt"
set /p reliantcolorinput=<"assets\logs\color.txt"
cls
echo.
echo Color changed to %relcolorchangeinput%! Exiting to the main menu
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
title Reliant v%relversion% (process-%input%) (task_manager.bat)
color %reliantcolorinput%
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
color %reliantcolorinput%
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
echo 1.) List processes currently running
echo 2.) Kill a process by name/PID
echo 3.) Exit Reliant Task Manager
choice /c 123 /n
if errorlevel 1 set gt=list
if errorlevel 2 set gt=kill
if errorlevel 3 set gt=mainmenu2
goto %gt%
goto choice

:23
cls
title Reliant v%relversion% (process-%input%) (FTP_mode.bat)
echo.
echo Entering FTP mode.
FTP
pause
goto mainmenu2

:24
cls
title Reliant v%relversion% (process-%input%) (SSH_mode.bat)
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
title Reliant v%relversion% (process-%input%) (printing_tool.bat)
echo.
echo What would you like to do?
echo.
echo 1. Type a string out and print it.
echo 2. Print a file.
echo 3. Return to the menubook.
set /p "reliantprintinput=Selection: "

if %reliantprintinput%==1 goto 25_1
if %reliantprintinput%==2 goto 25_2
if %reliantprintinput%==3 goto menubook
if not %reliantprintinput%==1 goto failed
if not %reliantprintinput%==2 goto failed
if not %reliantprintinput%==3 goto failed

:25_2
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

:25_3
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
echo Type an event creation command.
set /p "eventcreateinput=> "
eventcreate %eventcreateinput%
goto 26

:githubpage1
start https://github.com/ArcaneCiCi/Reliant
goto mainmenu

:githubpage2
start https://github.com/ArcaneCiCi/Reliant
goto mainmenu2

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1