@echo off
REM TSS Route and Cleanse

echo Executing TSS Route and Cleanse

:start
call .\mdmcustomenv-parallel.bat 

call "%PROJECTOPTOUT%\scripts\OptOut.cmd" > %MDM%\log\TSS_OptOut.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Route >> %MDM_CUSTOM_DIR%\log\TSS_OptOut.log
set errorlevel=1
exit 1
)

del %MDM_INPUT%\TSS_OPTOUT_INPUT.DAT

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Route > %TS_LOGS%\TSS_OptOut.LOG
set errorlevel=1
exit 1
)

:end