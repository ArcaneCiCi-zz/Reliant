@echo off
set relversion=main
:launch_1
    title Reliant Launcher 1.0.11
        color a
            echo.
            echo [%time%]: Running file check..
                if exist main\reliant-%relversion%.bat goto :launch_2
                if not exist main\reliant-%relversion%.bat goto :failedlaunch

:launch_2
    timeout /t 1 /nobreak >nul
        cls
            echo.
            echo [%time%]: Launching Reliant %relversion%...
                    start /max main\reliant-%relversion%.bat
                    exit

:failedlaunch
    cls
        echo.
        echo [%time%]: FAILED TO LAUNCH. FILE DOES NOT EXIST.
        echo [%time%]: EXITING.
            timeout /t 5 /nobreak >nul
            exit