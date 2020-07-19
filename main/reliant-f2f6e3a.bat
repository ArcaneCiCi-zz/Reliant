@echo off
goto startup
:startup
        set relversion=main
        set relprotocol=-1500
        set gitcommit=f2f6e3a
        set project=Reliant-1.10
        set /p reliantcolorinput=<"assets\logs\color.txt"
        set /p reliantcolorinput2=<"assets\logs\color2.txt"
        SETLOCAL EnableDelayedExpansion
        for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
        set "DEL=%%a"
        )

            title Reliant (%gitcommit%/%relversion%) - [Updater]
            if exist "assets\logs\" goto welcome
                if not exist "assets\logs\" goto installpatch

:installpatch
cls
color a
call :ColorText a "__________________________________________________________________"
echo.
echo.
echo Creating some important files to ensure that Reliant works properly.
echo This shouldn't take more than 5 seconds.
call :ColorText a "__________________________________________________________________"
mkdir "assets\logs"
echo 1 >> "assets\logs\update.txt"
echo a >> "assets\logs\color.txt"
echo a >> "assets\logs\color2.txt"
timeout /t 1 /nobreak >nul
echo No changelogs can be found, as the file was never created. >> "assets\logs\changelogs.txt"
timeout /t 3 /nobreak >nul
cls
echo.
echo All important files have now been created, we hope you enjoy the use of Reliant!
timeout /t 3 /nobreak >nul
goto welcome

:failedwelcome
cls
echo.
echo Incorrect value for the update file, please change it to "1 or 0".
pause
exit

:welcome
    set prevmenu=welcome
    set /p reliantcolorinput=<"assets\logs\color.txt"
    set /p reliantcolorinput2=<"assets\logs\color2.txt"
    color %reliantcolorinput%
    cls
    set /p changelogupdate=<"assets\logs\update.txt"
    if %changelogupdate%==0 goto menubook
    if %changelogupdate%==1 goto changelogs
    if NOT %changelogupdate%==0 goto failedwelcome
    if NOT %changelogupdate%==1 goto failed

:changelogs
    cls
    echo.
    type "assets\logs\changelogs.txt"
    pause
    break>"assets\logs\update.txt"
    echo 0 >> "assets\logs\update.txt"
    goto menubook

echo // START OF MENUBOOK PAGE // >nul

:menubook
    set prevmenu=menubook
        cls
            color %reliantcolorinput%
                 title Reliant (%gitcommit%/%relversion%) - [Menu Book]
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
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
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
                    echo.
                    echo.
                    echo                 Today's date is %date%
                    echo                 The current time is%time%
                    echo.
                    echo                     [ArcaneCiCi ~ %gitcommit%]
                    echo                     Reliant Menu Booklet
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
                    echo.
                    echo.
                    echo [1] Main Menu Page 1
                    echo [2] Main Menu Page 2
                    echo [3] Settings
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
                    echo.
                    echo Selection:
                    choice /c 123 /n
                    if errorlevel 1 set mbinput=mainmenu
                    if errorlevel 2 set mbinput=mainmenu2
                    if errorlevel 3 set mbinput=reliantsettings
                    goto %mbinput%

echo // END OF MENUBOOK PAGE // >nul
echo // START OF FIRST MENU PAGE // >nul

:mainmenu
    set prevmenu=mainmenu
        cls
            color %reliantcolorinput%
                title Reliant (%gitcommit%/%relversion%) - [Main Menu Page 1]
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
                    echo.
                    echo.
                    echo                       Welcome to Reliant!
                    echo.
                    echo                 Today's date is %date%
                    echo                 The current time is%time%
                    echo.
                    call :ColorText %reliantcolorinput2% "                  [Reliant ~ ArcaneCiCi]"
                    echo.
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
                    echo.
                    echo.
                    call :ColorText a "             To exit the program, type 'exit'"
                    echo.
                    call :ColorText a "             To edit settings, type 'settings'"
                    echo.
                    call :ColorText a "         To return to the menu book, type 'menubook'"
                    echo.
                    call :ColorText a "           To open the github page, type 'github'"
                    echo.
                    call :ColorText a "           To quickly switch to page 2 type 'pg2'"
                    echo.
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
                    echo.
                    echo.
                    echo  [1] View System Info
                    echo  [2] View all netstat
                    echo  [3] Remote shutdown
                    echo  [4] Open log text file(s)
                    echo  [5] Reliant Terminal v1.0.1
                    echo  [6] Random Number Generator
                    echo  [7] Computer Messenger
                    echo  [8] Disable internet connections
                    echo  [9] Mass text file generator
                    echo [10] TracerT Commands
                    echo [11] Remote Desktop Connection
                    echo [12] Simple Calculator
                    echo [13] Printing Manager
                    echo [14] View all computers on the network
                    echo [15] File Directory Tree
                    echo [16] Encrypt any string (Reliant Encryption Method)
                    echo [17] Decrypt String (Reliant Encryption Method)
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
                    echo.
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
                    if %input%==github start https://github.com/ArcaneCiCi/Reliant
                    if %input%==exit goto :mainexit
                    if %input%==pg2 goto mainmenu2
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
                    if not %input%==github goto prevmenu
                    if not %input%==pg2 goto mainmenu2
                    if not %input%==exit goto failed

echo // END OF FIRST MAIN MENU PAGE // >nul
echo // START OF SECOND MENU PAGE // >nul

:mainmenu2
    set prevmenu=mainmenu2
        cls
            color %reliantcolorinput%
                title Reliant (%gitcommit%/%relversion%) - [Main Menu Page 2]
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
                    echo.
                    echo.
                    echo                       Welcome to Reliant!
                    echo                 Today's date is %date%
                    echo                 The current time is%time%
                    echo.
                    call :ColorText %reliantcolorinput2% "                  [Reliant ~ ArcaneCiCi]"
                    echo.
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
                    echo.
                    echo.
                    call :ColorText a "             To exit the program, type 'exit'"
                    echo.
                    call :ColorText a "             To edit settings, type 'settings'"
                    echo.
                    call :ColorText a "         To return to the menu book, type 'menubook'"
                    echo.
                    call :ColorText a "           To open the github page, type 'github'"
                    echo.
                    call :ColorText a "         To switch between pages, type 'pg1' or 'pg2'"
                    echo.
                    call :ColorText a "           To quickly switch to page 1 type 'pg1'"
                    echo.
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
                    echo.
                    echo.
                    echo [18] File Renamer
                    echo [19] Reliant Cryptographic Signing Tool
                    echo [20] Run Java commands via command line
                    echo [21] ReEnable Internet
                    echo [22] Reliant Task Manager
                    echo [23] Reliant FTP Mode
                    echo [24] Reliant SSH Mode
                    echo [25] Build a Maven project via Reliant
                    echo [26] Computer Event Creator
                    echo [27] Run all Network Commands
                    echo [28] Beep
                    call :ColorText %reliantcolorinput2% "__________________________________________________________________"
                    echo.
                    echo.
                    set /p "input=Selection:"
                    if %input%==menubook goto :menubook
                    if %input%==exit goto :mainexit
                    if %input%==settings goto reliantsettings
                    if %input%==github start https://github.com/ArcaneCiCi/Reliant
                    if %input%==18 goto 18
                    if %input%==19 goto 19
                    if %input%==20 goto 20
                    if %input%==21 goto 21
                    if %input%==22 goto 22
                    if %input%==23 goto 23
                    if %input%==24 goto 24
                    if %input%==25 goto 25
                    if %input%==26 goto 26
                    if %input%==27 goto 27
                    if %input%==28 goto 28
                    if %input%==pg1 goto mainmenu
                    if not %input%==exit goto failed
                    if not %input%==settings goto failed
                    if not %input%==github goto prevmenu
                    if not %input%==menubook goto failed
                    if not %input%==18 goto failed
                    if not %input%==19 goto failed
                    if not %input%==20 goto failed
                    if not %input%==21 goto failed
                    if not %input%==22 goto failed
                    if not %input%==23 goto failed
                    if not %input%==24 goto failed
                    if not %input%==25 goto failed
                    if not %input%==26 goto failed
                    if not %input%==27 goto failed
                    if not %input%==28 goto failed
                    if not %input%==pg1 goto failed

echo // END OF SECOND MAIN MENU PAGE // >nul

:1
    set prevmenu=1
        title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
        cls
        systeminfo
        pause
        goto mainmenu

:2
    color %reliantcolorinput%
    cls
    set prevmenu=2
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
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
    cls
        set prevmenu=3
        title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
        color %reliantcolorinput%
        echo.
        echo.
        echo Enter computer name.
        set /p "pcinput=>" 
        goto 3_2

            :3_2
                shutdown /s /p /m \\computer %pcinput% > "assets\logs\remote_shutdown_logs.txt"
                timeout /t 5 /nobreak >nul
                echo Successfully shutdown %pcinput%! Returning to main menu.
                timeout /t 10 /nobreak >nul
                goto mainmenu
                cls

:4
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
    cls
    set prevmenu=4
    color %reliantcolorinput%
    echo.
    echo Enter the path file where your logs folder is located.
        set /p "logopeninput=Input:"
        cls
        echo Loading logs file, please wait a second.
            timeout /t 1 /nobreak >nul
            start explorer "%logopeninput%
            cls
            echo Log file folder opened, returning to the main menu.
            timeout /t 2 /nobreak >nul
            goto mainmenu

:5

    cls
    set prevmenu=5
    echo.
    title Reliant Terminal v1.0.1 (%gitcommit%/%relversion%) - [process: %input%]
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
    set prevmenu=6
    color %reliantcolorinput%
    title Reliant f2f6e3a (process:%input%)
        echo.
        echo ============================
        echo Generated Number: %random%
        echo ============================
        echo.
        
        pause
        goto mainmenu

:7
    cls
    set prevmenu=7
    title Reliant f2f6e3a (process:%input%)
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
    set prevmenu=8
    title Reliant f2f6e3a (process:%input%)
        echo.
        echo To reverse this, run tool "21".
            timeout /t 5 >nul
            ipconfig /release >nul
            if ERRORLEVEL1 ipconfig /release all >nul
            timeout /t 3 >nul
            goto mainmenu

:9
    cls
    set prevmenu=9
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
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
    set prevmenu=10
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
    echo Enter the IP you would like to run "tracert" on.
    set /p "tracertinput=>"
    tracert -d %tracertinput%
    timeout /t 1 /nobreak >nul
    echo Done.
    timeout /t 3
    goto mainmenu

:11
cls
set prevmenu=11
echo.
MSTSC

pause
goto mainmenu

:12
    cls
    set prevmenu=12
        title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
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

:13
    cls
    set prevmenu=13
        title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
            echo.
            echo What would you like to do?
            echo.
            echo 1. Type a string out and print it.
            echo 2. Print a file.
            echo 3. Return to the main menu.
                set /p "reliantprintinput=Selection: "
                if %reliantprintinput%==1 goto 13_1
                if %reliantprintinput%==2 goto 13_2
                if %reliantprintinput%==3 goto mainmenu
                if not %reliantprintinput%==1 goto failed
                if not %reliantprintinput%==2 goto failed
                if not %reliantprintinput%==3 goto failed

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
                    goto mainmenu

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
        goto mainmenu

:14
    cls
    set prevmenu=14
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
    color %reliantcolorinput%
        echo.
        echo Enter the domain name you would like to view.
        set /p "networkviewinput=>"
        net view /all /domain %networkviewinput%
        echo.
        
        pause
        goto mainmenu

:15
    cls
    set prevmenu=15
        title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
        set /p "treeinput=File Path:"
        tree %treeinput%
        pause
        echo Process:%input% Done!
        echo Returning to main menu.
        timeout /t 5 /nobreak >nul
        goto mainmenu

:16
    cls
    set prevmenu=16
        setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
            title Reliant (%gitcommit%/%relversion%) (process:%input%)
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
                                            pause
                                            cls
                                            goto mainmenu

:17
    cls
    set prevmenu=17
        setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
            title Reliant (%gitcommit%/%relversion%) (process:%input%)
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
                                            pause
                                            cls
                                            goto mainmenu


:18
    cls
    set prevmenu=18
        echo.
        echo Enter the file path of the file you want to rename, please include the file and the proper file extension.
            set /p "reliantfilerenamerpath=Input:"
                echo.
                echo Enter the name you want to rename the file to.
                set /p "filerenameinput=Input:"
                ren "%reliantfilerenamerpath%" %filerenameinput%
                cls
                echo.
                echo File renamed! Returning to the main menu.
                timeout /t 3 /nobreak >nul
                goto mainmenu2

:19
    cls
        set prevmenu=19
        title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
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
    
    pause
    goto mainmenu2

:signinput3no
    echo [CRYPTOGRAPHIC SIGNITURE]: Signed by %sign2input%. >> %signinput%
    echo Signed!
    
    pause
    goto mainmenu2

:20
    cls
    set prevmenu=20
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
    echo.
    color f
    echo Here you can run any java command via the command prompt.
    echo To successfully build the project, drag your project folder folder "Reliant".
    echo.
    echo We also did you a favor and output everything you enter into 'javalog.txt' file, just so you can see what you did previously.
    echo.
    echo You can now type java commands, if you need to see what you previously entered you can always check 'assets\logs\javalog.txt'.
    echo.
    :javatop
    set /p "javacmdinput=%cd%>"
    java %javacmdinput%
    goto javatop


:21
    cls
        echo.
        echo Reverting release adapter.
        echo.
            ipconfig /renew >nul
            echo Fixed. Internet for this machine should be fixed.
                timeout /t 3 >nul
                goto mainmenu2

:22
    cls
    set prevmenu=22
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
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
        pausel
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
    set prevmenu=23
        title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%] (FTP Mode)
        echo.
        echo Entering FTP mode.
        FTP
        pause
        goto mainmenu2

:24
    cls
    set prevmenu=24
        title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%] (SSH Mode)
            echo.
            echo Entering SSH Mode, Purely runs SSH commands.
                SSH
                goto 24_2
:24_2
    set /p "sshinput=Input:"
    SSH %sshinput%
    pause
    goto 24_2

:25
    cls
    set prevmenu=25
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
    echo.
    echo Enter the file path of the project.
    set /p "mavenbuildinput=>"
    cd %mavenbuildinput%
    title Building Project...
    mvn clean install
    cls
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
    echo.
    echo If the project was not built correctly, there might be an issue in your code or pom.xml.
    echo We do not accept support for issues in your project.
    echo Press a key to return to the main menu.
    echo.
    pause
    goto mainmenu2


:26
    cls
    set prevmenu=26
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
    echo.
    eventcreate /?
    echo.
    echo.
    :26top
    echo Type an event creation command.
    set /p "eventcreateinput=Input:"
    eventcreate %eventcreateinput%
    goto 26top

:27
    cls
    set prevmenu=27
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%]
    echo.
    echo You can run all default Windows network commands here, be aware this may be buggy.
    echo Keep in mind, you do not need to type "net" for the command at the start, as we have already done that for you.
    echo Here is a list of commands:
    NET
    echo.
    echo.
    goto 27_2

:27_2
    set /p "netinput=Input: net "
        NET %netinput%
        goto 27_2

:28
@echo off
cls
title Reliant Beep Machine
echo Press any key to beep, press 0 to go to the main menu.
choice /c 0 /n
if errorlevel==0 goto mainmenu2

:failed
    cls
        color %reliantcolorinput%
            echo.
            echo Error: Invalid selection or invalid syntax!
            echo Press any key to return to area you were in.
            pause >nul
            goto %prevmenu%

:mainexit
    cls
        color %reliantcolorinput%
            echo.
            echo Shutting down Reliant running on version %relversion%, running on process:%input%...
            echo Project: %project%-%relversion%.
            echo.
                timeout /t 3 /nobreak >nul
                exit

:restartreliant
    cls
        echo.
        echo Restarting...
            timeout /t 3 /nobreak >nul
            goto startup

:update
    cls
        title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%] (Client Updater)
        echo Welcome to Reliant Updater v1.0.3. If an update is required, Reliant will close, if it does not it will return to the main menu.
        timeout /t 5 /nobreak >nul
        if %~n0%~x0==reliant-%relversion%.bat goto update_2
        if not %~n0%~x0==reliant-%relversion%.bat ren %~n0%~x0==reliant-%relversion%.bat
        :update_2
        echo No updated needed.. Returning to the menu book.
        timeout /t 5 /nobreak >nul
        goto menubook



:reliantsettings
    cls
    title Reliant (%gitcommit%/%relversion%) - [Process ID: %input%] (Settings)
        set prevmenu=reliantsettings
            echo -------------------------------------
            echo.
            echo          Reliant Settings.
            echo.
            echo -------------------------------------
            echo.
            echo 0. Return to the Menu Book.
            echo.
            echo 1. Change text colors
            echo.
            echo 2. Change menu barrier colors
            echo.
            echo 3. Restart Reliant
            echo.
            echo 4. Update Reliant
            echo.
            echo 5. Reload Reliant
            echo.
            echo 6. Report Bugs (outputs to a text file, which you can then create an issue on Reliant's repository)
            echo.
            set /p "reliantsettingsinput=Selection:"
            if %reliantsettingsinput%==0 goto menubook
            if %reliantsettingsinput%==1 goto reliantsettings_2
            if %reliantsettingsinput%==2 goto reliantsettings_3
            if %reliantsettingsinput%==3 goto restartreliant
            if %reliantsettingsinput%==4 goto update
            if %reliantsettingsinput%==5 goto reloadreliant
            if %reliantsettingsinput%==6 goto reportbug
            if not %reliantsettingsinput%==0 goto failed
            if not %reliantsettingsinput%==1 goto failed
            if not %reliantsettingsinput%==2 goto failed
            if not %reliantsettingsinput%==3 goto failed
            if not %reliantsettingsinput%==4 goto failed
            if not %reliantsettingsinput%==5 goto failed
            if not %reliantsettingsinput%==6 goto failed

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
            goto menubook

            :reliantsettings_3
            cls
            echo.
            echo What color would you like to change the barriers to?
            echo.
            color /?
            echo.
            echo Enter a color.
            echo.
            set /p "relcolorchangeinput2=>"
            break>"assets\logs\color2.txt"
            echo %relcolorchangeinput2% >> "assets\logs\color2.txt"
            set /p reliantcolorinput2=<"assets\logs\color2.txt"
            cls
            echo.
            echo Color changed to %relcolorchangeinput2%! Exiting to the main menu
            timeout /t 3 /nobreak >nul
            goto menubook

:reloadreliant
    cls
        echo.
        echo [%time%]: Reloading.
            timeout /t 1 /nobreak >nul
            goto mainmenu

:reportbug
    cls
        color %reliantcolorinput%
        set prevmenu=reportbug
            echo.
            echo What bug would you like to report?
            echo.
            echo 1. Graphical issue.
            echo 2. Crash issue (Provide crash report located in assets\logs\crash_reports.txt).
            echo 3. Code issue.
            echo 4. Feature not working.
            echo 5. Other.
            echo 6. Return to the menu book.
            echo.
                set /p "bugtypeinput=Input:"
                if %bugtypeinput%==1 set %bugtypeinput%=Graphical Issue
                if %bugtypeinput%==2 set %bugtypeinput%=Crash Issue
                if %bugtypeinput%==3 set %bugtypeinput%=Code Issue
                if %bugtypeinput%==4 set %bugtypeinput%=Feature Issue
                if %bugtypeinput%==5 set %bugtypeinput%=Other Issue.
                if %bugtypeinput%==6 goto menubook
                    cls
                        echo.
                        echo Please detail what the issue is.
                            set /p "bugdetailinput=Input:"
                            break "assets\logs\bug_report.txt"
                            set /p bug_report=bug_report%random%
                                echo Bug issue %bugtypeinput% received at %time% on %date%, bug is detailed as %bugdetailinput%. >> "assets\bug_reports\%bug_report%.txt"
                                echo Done! File name is %bug_report%.
                                    timeout /t 3 /nobreak >nul
                                    goto mainmenu

:ColorText
    echo off
        <nul set /p ".=%DEL%" > "%~2"
        findstr /v /a:%1 /R "^$" "%~2" nul
        del "%~2" > nul 2>&1