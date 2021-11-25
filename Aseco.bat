@echo off

rem ****** Set here your php path *******

set INSTPHP=C:\php5

rem *************************************

PATH=%PATH%;%INSTPHP%;%INSTPHP%\ext
"%INSTPHP%\php.exe" aseco.php

pause
