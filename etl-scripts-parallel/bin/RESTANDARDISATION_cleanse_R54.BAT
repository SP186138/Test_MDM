@echo off
REM PNG TSS Export

echo Executing TSS Export

:start


REM MYS
fexp -c UTF8 -r ".run file E:\Teradata\MDM\3.05.02\custom\pngrelease3\logON\LOGON.txt;" < E:\Teradata\MDM\3.05.02\custom\pngrelease3\etl-scripts-parallel\bin\TSS_CLEANSE_INPUT.FEXPMYS> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_MYS_cleanse.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_MYS_cleanse.LOG
EXIT
)
rename  E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_MYS.DAT TSS_CLEANSE_INPUT_MYS2.DAT
echo > E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_MYS.DAT
set TSSCLEANSEINPUT="/d:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_MYS2.DAT"
set TSSCLEANSEINPUT1="/e:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_MYS.DAT"
cscript E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\TRIM2.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUT1%
del E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_MYS2.DAT

:end
