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


copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURC%\scripts\runProject23.cmd" "%PFOURC%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet_JPN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_JPN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PTWOTHREE%\scripts\runProject6.cmd" "%PTWOTHREE%\scripts\TSSJapanCleanse.cmd" >> %MDM%\log\TSSEnvSet_JPN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_JPN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURFOUR%\scripts\runProject7.cmd" "%PFOURFOUR%\scripts\TSSJapanMatch.cmd" >> %MDM%\log\TSSEnvSet_JPN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_JPN.LOG
set errorlevel=1
exit 1
)



copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURC%\settings\config batch.tbl" "%PFOURC%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_JPN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_JPN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PTWOTHREE%\settings\config batch.tbl" "%PTWOTHREE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_JPN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_JPN.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURFOUR%\settings\config batch.tbl" "%PFOURFOUR%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_JPN.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_JPN.LOG
set errorlevel=1
exit 1
)

