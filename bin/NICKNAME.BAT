@echo off
REM PNG TSS Export

echo Executing TSS Export

:start

mload -c UTF8 < E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\NICKNAME.fld > E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\NICKNAME.log

:end