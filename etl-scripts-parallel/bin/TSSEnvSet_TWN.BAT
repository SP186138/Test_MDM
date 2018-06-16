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


copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURE%\scripts\runProject23.cmd" "%PFOURE%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet_TWN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_TWN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURE%\settings\config batch.tbl" "%PFOURE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_TWN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_TWN.LOG
set errorlevel=1
exit 1
)



copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PEIGHTFOUR%\scripts\runProject10.cmd" "%PEIGHTFOUR%\scripts\TSSTaiwanCleanse.cmd" >> %MDM%\log\TSSEnvSet_TWN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_TWN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PEIGHTFIVE%\scripts\runProject11.cmd" "%PEIGHTFIVE%\scripts\TSSTaiwanMatch.cmd" >> %MDM%\log\TSSEnvSet_TWN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_TWN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PEIGHTFOUR%\settings\config batch.tbl" "%PEIGHTFOUR%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_TWN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_TWN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PEIGHTFIVE%\settings\config batch.tbl" "%PEIGHTFIVE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_TWN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_TWN.LOG
set errorlevel=1
exit 1
)

