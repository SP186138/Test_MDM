@echo off
REM PNG TSS Export

echo Executing TSS Export

:start

fexp -c UTF8 -r ".run file E:\Teradata\MDM\3.05.02\custom\pngrelease3\logON\LOGON.txt;" < E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\R55_PRT_cleanse.fexp > E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\R55_PRT_cleanse.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\R55_PRT_cleanse.LOG
EXIT
)
echo > E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_PRT.DAT

set TSSCLEANSEINPUT="/d:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_PRT.DATTMPL"

set TSSCLEANSEINPUT1="/e:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_PRT.DAT"

cscript E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\TRIM2.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUT1%

:end