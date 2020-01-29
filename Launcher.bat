@echo off
title Reliant Launcher 1.0.2
color a
echo.
echo [%time%]: Running file check..
if exist assets\reliant-1.3.bat goto :launch_2
if not exist assets\reliant-1.3.bat goto :failedlaunch
:launch_2
timeout /t 1 /nobreak >nul
cls
echo.
echo [%time%]: Launching Reliant...
timeout /t 1 /nobreak >nul
start /max assets\reliant-1.3.bat
exit

:failedlaunch
cls
echo.
echo [%time%]: FAILED TO LAUNCH. FILE DOES NOT EXIST.
echo [%time%]: EXITING.
timeout /t 5 /nobreak >nul
exit