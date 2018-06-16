@ECHO OFF
::........................................
::
:: Generated Batch file for windows
:: 2011/01/03 14:35:36
::
::........................................


::........................................
::
:: User may need to modify the value of TS_QUALITY
:: before running the script on a different machine
::
::........................................

call .\mdmcustomenv-parallel.bat 


copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURL%\scripts\runProject23.cmd" "%PFOURL%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet_OTH.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_OTH.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURL%\settings\config batch.tbl" "%PFOURL%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_OTH.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_OTH.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PTWOSEVEN%\scripts\runProject32.cmd" "%PTWOSEVEN%\scripts\TSSZzCleanse.cmd" >> %MDM%\log\TSSEnvSet_OTH.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_OTH.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PTWOEIGHT%\scripts\runProject33.cmd" "%PTWOEIGHT%\scripts\TSSZzMatch.cmd" >> %MDM%\log\TSSEnvSet_OTH.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_OTH.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PTWOSEVEN%\settings\config batch.tbl" "%PTWOSEVEN%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_OTH.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_OTH.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PTWOEIGHT%\settings\config batch.tbl" "%PTWOEIGHT%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_OTH.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_OTH.LOG
set errorlevel=1
exit 1
)
