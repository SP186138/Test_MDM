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
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS_EUROPE%\TSSAustriaCleansetmpl.cmd" "%TSS_SCRIPTS_EUROPE%\TSSAustriaCleanse.cmd" > %MDM%\log\TSSEnvSet_AUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_AUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSSEnvSet_AUT.LOG TSSEnvSet_AUT_%currentdate%_%currenttime%.LOG
exit 1
)

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS_EUROPE%\TSSAustriaMatchtmpl.cmd" "%TSS_SCRIPTS_EUROPE%\TSSAustriaMatch.cmd" >> %MDM%\log\TSSEnvSet_AUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet_AUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSSEnvSet_AUT.LOG TSSEnvSet_AUT_%currentdate%_%currenttime%.LOG
exit 1
)

ren %MDM_CUSTOM_DIR%\log\TSSEnvSet_AUT.LOG TSSEnvSet_AUT_%currentdate%_%currenttime%.LOG