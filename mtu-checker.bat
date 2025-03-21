@echo off
REM Copyright (C) 2025 Paweł 'felixd' Wojciechowski 
REM FlameIT - Immersion Cooling
REM https://flameit.io
REM 
REM USAGE: ./mtu-cheker.sh HOST
REM 
REM  Description: Simple script to check optimal MTU size (for site-to-site VPN tunnels for example)

setlocal enabledelayedexpansion

if "%1"=="" (
    echo Usage: %0 ^<host^>
    exit /b 1
)

set HOST=%1
set MTU=1500
set HEADER=28
set /a SIZE=%MTU% - %HEADER%

:check
if %SIZE% LEQ 0 (
    echo Unable to determine optimal MTU size. Try manual check.
    exit /b 1
)

echo|set /p=Checking MTU size !SIZE!+!HEADER!: 

ping -n 1 -f -l %SIZE% %HOST% > nul 2>&1

if %errorlevel%==0 (
    echo Success
    set /a OPTIMAL=%SIZE% + %HEADER%
    echo Optimal MTU size: !OPTIMAL!
    exit /b 0
) else (
    echo Too large
)

set /a SIZE=%SIZE% - 8
goto check
