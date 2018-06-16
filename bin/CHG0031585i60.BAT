@echo off
REM PNG TSS Export

echo Executing TSS Export

:start

fexp -c UTF8 -r ".run file E:\Teradata\MDM\3.05.02\custom\pngrelease3\logON\LOGON.txt;" < E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\CHG0031585i60.fexp >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\i60_file.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\i60_file.LOG
EXIT
)

echo > E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\1174_OptOut_20130704_000000.txt

set TSSCLEANSEINPUT="/d:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\1174_OptOut_20130704_000000.txtTMPL"

set TSSCLEANSEINPUT1="/e:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\1174_OptOut_20130704_000000.txt"

cscript E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\TRIM2.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUT1%

:end