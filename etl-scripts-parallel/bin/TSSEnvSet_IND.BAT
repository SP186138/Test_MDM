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

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PTHIRTYSEVEN%\scripts\runproject5.cmd" "%PTHIRTYSEVEN%\scripts\TSSIndiaMatch.cmd" > %MDM%\log\TSSEnvSet_IND.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_IND.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PTEN%\scripts\runProject4.cmd" "%PTEN%\scripts\TSSIndiaCleanse.cmd" >> %MDM%\log\TSSEnvSet_IND.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_IND.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURB%\scripts\runProject23.cmd" "%PFOURB%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet_IND.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_IND.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURB%\settings\config batch.tbl" "%PFOURB%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_IND.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_IND.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PTEN%\settings\config batch.tbl" "%PTEN%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_IND.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_IND.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PTHIRTYSEVEN%\settings\config batch.tbl" "%PTHIRTYSEVEN%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_IND.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_IND.LOG
set errorlevel=1
exit 1
)


