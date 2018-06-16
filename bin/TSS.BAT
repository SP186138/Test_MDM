@echo off
REM TSS Route and Cleanse

echo Executing TSS

:start

call .\mdmcustomenv.bat 

call %MDM_CUSTOM_DIR%\bin\TSSEnvSet.BAT

call %MDM_CUSTOM_DIR%\bin\TSSRouteCleanse.BAT

call %MDM_CUSTOM_DIR%\bin\TSSMatch.BAT


:end