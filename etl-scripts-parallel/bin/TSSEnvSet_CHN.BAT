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

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PSIXEIGHT%\settings\config batch.tbl" "%PSIXEIGHT%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_CHN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_CHN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PSIXNINE%\settings\config batch.tbl" "%PSIXNINE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_CHN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_CHN.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PSIXEIGHT%\scripts\runProject16.cmd" "%PSIXEIGHT%\scripts\TSSChinaCleanse.cmd" >> %MDM%\log\TSSEnvSet_CHN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_CHN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURH%\scripts\runProject23.cmd" "%PFOURH%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet_CHN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_CHN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PSIXNINE%\scripts\runProject17.cmd" "%PSIXNINE%\scripts\TSSChinaMatch.cmd" >> %MDM%\log\TSSEnvSet_CHN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_CHN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURH%\settings\config batch.tbl" "%PFOURH%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_CHN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_CHN.LOG
set errorlevel=1
exit 1
)