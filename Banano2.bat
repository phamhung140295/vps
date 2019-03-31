@echo off
:start
timeout 1
taskkill /f /im explorer.exe
timeout 1
start explorer.exe
timeout 1
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


For /l %%a In (1,1,30) Do (
cls
timeout 60
tasklist | find /i "crashreporter.exe"  >nul
if not errorlevel 1 goto kill_firefox_crashreporter
)
goto start


:kill_firefox_crashreporter
taskkill /IM crashreporter.exe /F
if not errorlevel 1 goto taskkill /IM crashreporter.exe /F
timeout 2
goto start

