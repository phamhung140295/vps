@echo off
:start
taskkill /f /im explorer.exe
timeout 1
start explorer.exe
timeout 2
:kill_firefox
taskkill /IM firefox.exe /F
if not errorlevel 1 goto kill_firefox
timeout 2
taskkill /f /im explorer.exe
timeout 1
start explorer.exe
taskkill /f /im explorer.exe
timeout 1
start explorer.exe
taskkill /f /im explorer.exe
timeout 1
start explorer.exe
taskkill /f /im explorer.exe
timeout 1
start explorer.exe
timeout 5
start /min firefox.exe -p default imacros://run/?m=click_banano.js
timeout 1800
goto start