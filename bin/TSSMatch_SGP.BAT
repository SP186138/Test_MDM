@echo off
REM TSS Match

echo Executing TSS Match

:start

call .\mdmcustomenv-parallel.bat 

call "%PROJECTSIXTHREE%\scripts\TSSSingaporeMatch.cmd" >> %MDM_CUSTOM_DIR%\log\TSSMatch_SGP.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match  >> %MDM_CUSTOM_DIR%\log\TSSMatch_SGP.log
set errorlevel=1
exit 1
)

del %MDM_CUSTOM_DIR%\data\TSS_MATCH_INPUT_CRM_SGP.DAT >> %MDM_CUSTOM_DIR%\log\TSSMatch_SGP.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match >> %MDM_CUSTOM_DIR%\log\TSSMatch_SGP.log
set errorlevel=1
exit 1
)
:end