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

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PEIGHTZERO%\scripts\runProject18.cmd" "%PEIGHTZERO%\scripts\TSSKoreaCleanse.cmd" >> %MDM%\log\TSSEnvSet_KOR.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_KOR.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PFOURI%\scripts\runProject23.cmd" "%PFOURI%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet_KOR.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_KOR.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%PEIGHTONE%\scripts\runProject19.cmd" "%PEIGHTONE%\scripts\TSSKoreaMatch.cmd" >> %MDM%\log\TSSEnvSet_KOR.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_KOR.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PFOURI%\settings\config batch.tbl" "%PFOURI%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_KOR.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_KOR.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PEIGHTZERO%\settings\config batch.tbl" "%PEIGHTZERO%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_KOR.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_KOR.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\configbatchset.tbl"+"%PEIGHTONE%\settings\config batch.tbl" "%PEIGHTONE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet_KOR.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_KOR.LOG
set errorlevel=1
exit 1
)

