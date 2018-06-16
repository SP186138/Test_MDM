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

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURK%\scripts\runProject23.cmd" "%PFOURK%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet_PHL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_PHL.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURK%\settings\config batch.tbl" "%PFOURK%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_PHL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_PHL.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PTWOFIVE%\scripts\runProject30.cmd" "%PTWOFIVE%\scripts\TSSPhCleanse.cmd" >> %MDM%\log\TSSEnvSet_PHL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_PHL.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PTWOSIX%\scripts\runProject31.cmd" "%PTWOSIX%\scripts\TSSPhMatch.cmd" >> %MDM%\log\TSSEnvSet_PHL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_PHL.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PTWOFIVE%\settings\config batch.tbl" "%PTWOFIVE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_PHL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_PHL.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PTWOSIX%\settings\config batch.tbl" "%PTWOSIX%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_PHL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_PHL.LOG
set errorlevel=1
exit 1
)