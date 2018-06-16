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


copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFIVEFIVE%\scripts\runProject12.cmd" "%PFIVEFIVE%\scripts\TSSMalaysiaCleanse.cmd" >> %MDM%\log\TSSEnvSet_MYS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_MYS.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURF%\scripts\runProject23.cmd" "%PFOURF%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet_MYS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_MYS.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PSIXFOUR%\scripts\runProject13.cmd" "%PSIXFOUR%\scripts\TSSMalaysiaMatch.cmd" >> %MDM%\log\TSSEnvSet_MYS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_MYS.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURF%\settings\config batch.tbl" "%PFOURF%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_MYS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_MYS.LOG
set errorlevel=1
exit 1
)



copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFIVEFIVE%\settings\config batch.tbl" "%PFIVEFIVE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_MYS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_MYS.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PSIXFOUR%\settings\config batch.tbl" "%PSIXFOUR%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_MYS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_MYS.LOG
set errorlevel=1
exit 1
)

