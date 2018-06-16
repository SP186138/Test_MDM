@ECHO OFF
::........................................
::
:: Generated Batch file for windows
:: 
::
::........................................


::........................................
::
:: User may need to modify the value of TS_QUALITY
:: before running the script on a different machine
::
::........................................

call .\mdmcustomenv-parallel.bat 


copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%POPTOUT%\settings\config batch.tbl" "%POPTOUT%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_Gdpr.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_Gdpr.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%POPTOUT%\scripts\runProject47.cmd" "%POPTOUT%\scripts\Gdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_Gdpr.LOG
set errorlevel=1
exit 1
)

