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


copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PSEVENZERO%\scripts\runProject20.cmd" "%PSEVENZERO%\scripts\TSSNewZealandCleanse.cmd" >> %MDM%\log\TSSEnvSet_NZL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_NZL.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURJ%\scripts\runProject23.cmd" "%PFOURJ%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet_NZL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_NZL.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PSEVENONE%\scripts\runProject21.cmd" "%PSEVENONE%\scripts\TSSNewZealandMatch.cmd" >> %MDM%\log\TSSEnvSet_NZL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_NZL.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURJ%\settings\config batch.tbl" "%PFOURJ%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_NZL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_NZL.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PSEVENZERO%\settings\config batch.tbl" "%PSEVENZERO%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_NZL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_NZL.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PSEVENONE%\settings\config batch.tbl" "%PSEVENONE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_NZL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_NZL.LOG
set errorlevel=1
exit 1
)

