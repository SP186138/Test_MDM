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


copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFIVESIX%\scripts\runProject8.cmd" "%PFIVESIX%\scripts\TSSSingaporeCleanse.cmd" >> %MDM%\log\TSSEnvSet_SGP.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_SGP.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURD%\scripts\runProject23.cmd" "%PFOURD%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet_SGP.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_SGP.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PSIXTHREE%\scripts\runProject9.cmd" "%PSIXTHREE%\scripts\TSSSingaporeMatch.cmd" >> %MDM%\log\TSSEnvSet_SGP.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_SGP.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURD%\settings\config batch.tbl" "%PFOURD%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_SGP.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_SGP.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFIVESIX%\settings\config batch.tbl" "%PFIVESIX%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_SGP.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_SGP.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PSIXTHREE%\settings\config batch.tbl" "%PSIXTHREE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_SGP.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_SGP.LOG
set errorlevel=1
exit 1
)
