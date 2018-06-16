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


copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURG%\settings\config batch.tbl" "%PFOURG%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_AUS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_AUS.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PSIXSIX%\settings\config batch.tbl" "%PSIXSIX%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_AUS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_AUS.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PSIXSEVEN%\settings\config batch.tbl" "%PSIXSEVEN%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_AUS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_AUS.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PSIXSIX%\scripts\runProject14.cmd" "%PSIXSIX%\scripts\TSSAustraliaCleanse.cmd" >> %MDM%\log\TSSEnvSet_AUS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_AUS.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURG%\scripts\runProject23.cmd" "%PFOURG%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet_AUS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_AUS.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PSIXSEVEN%\scripts\runProject15.cmd" "%PSIXSEVEN%\scripts\TSSAustraliaMatch.cmd" >> %MDM%\log\TSSEnvSet_AUS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_AUS.LOG
set errorlevel=1
exit 1
)

