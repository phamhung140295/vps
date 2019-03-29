@echo off
:start
start firefox.exe -p default imacros://run/?m=click_banano.iim
timeout 120
goto start