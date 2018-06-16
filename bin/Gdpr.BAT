@echo off
REM TSS Route and Cleanse

echo Executing TSS Route and Cleanse

:start
call .\mdmcustomenv-parallel.bat 

call "%PROJECTGDPR%\scripts\Gdpr.cmd" > %MDM%\log\TSS_Gdpr.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Route >> %MDM_CUSTOM_DIR%\log\TSS_Gdpr.log
set errorlevel=1
exit 1
)

del %MDM_INPUT%\TSS_GDPR_INPUT.DAT

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Route > %TS_LOGS%\TSS_Gdpr.LOG
set errorlevel=1
exit 1
)

:end