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

FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS_ASIA%\TSSOtherAsiaCleansetmpl.cmd" "%TSS_SCRIPTS_ASIA%\TSSOtherAsiaCleanse.cmd" > %MDM%\log\TSSEnvSet_OTH.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_OTH.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSSEnvSet_OTH.LOG TSSEnvSet_OTH_%currentdate%_%currenttime%.LOG
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS_ASIA%\TSSOtherAsiaMatchtmpl.cmd" "%TSS_SCRIPTS_ASIA%\TSSOtherAsiaMatch.cmd" >> %MDM%\log\TSSEnvSet_OTH.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_OTH.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSSEnvSet_OTH.LOG TSSEnvSet_OTH_%currentdate%_%currenttime%.LOG
exit 1
)

ren %MDM_CUSTOM_DIR%\log\TSSEnvSet_OTH.LOG TSSEnvSet_OTH_%currentdate%_%currenttime%.LOG