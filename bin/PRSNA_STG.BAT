@echo off
REM PNG TSS Export

echo Executing TSS Export

:start

fexp -c UTF8 -r ".run file E:\Teradata\MDM\3.05.02\custom\pngrelease3\logON\LOGON.txt;" < E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\prsna_stg.fexp >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\USA_file.LOG

REM mload -c UTF8 < C:\TSS\SCRIPTS\test.fld >> C:\TSS\LOG\testtt.log

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> C:\TSS\LOG\TEST.LOG
EXIT
)

:end