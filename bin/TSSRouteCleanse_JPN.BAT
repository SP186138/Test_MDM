@echo off
REM TSS Route and Cleanse

echo Executing TSS Route and Cleanse

:start
call .\mdmcustomenv-parallel.bat 

call "%PROJECTFOURC%\scripts\TSSGlobalRouter.cmd" > %MDM%\log\TSSRouteCleanse_JPN.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Route >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_JPN.log
set errorlevel=1
exit 1
)

call "%PROJECTTWOTHREE%\scripts\TSSJapanCleanse.cmd" >> %MDM%\log\TSSRouteCleanse_JPN.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_JPN.log
set errorlevel=1
exit 1
)


del %MDM_INPUT%\TSS_CLEANSE_INPUT_JPN.DAT

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Route > %TS_LOGS%\TSSGlobalRouter.LOG
set errorlevel=1
exit 1
)
:end