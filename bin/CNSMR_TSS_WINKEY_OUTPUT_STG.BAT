@echo off
REM TSS Import

REM SCRIPT:               CNSMR_TSS_WINKEY_STG.FLD 
REM DESCRIPTION:          This script loads the MST WINKEY TRIGGER table from the trigger file that is given by 
REM                       Trillium
REM DEPENDENCY:           TRILLIUM WINKEY SCRIPT
REM INPUT:                TRILLIUM WINKEY FILE
REM OUTPUT:               MST WINKEY TRIGGER
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 01/21/2011           TERADATA                        INITIAL VERSION

echo Executing TSS Import

:start

call .\mdmcustomenv.bat 

set TSSWINKEYOUTPUT="/c:%TSS_WINKEY_OUTPUT%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MASTER_DB%"

set CNSMRTSSWINKEYCLEANUPBTEQ="/d:%CNSMR_TSS_WINKEY_CLEANUP_BTEQ%"

set MSTDB="/g:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\CNSMR_TSS_WINKEY_STG.vbs %TSSWINKEYOUTPUT% %CNSMRTSSWINKEYCLEANUPBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB% > %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT_VBS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during WINKEY TRIGGER cleanup > %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
set errorlevel=1
exit 1
 )

 bteq < %CNSMR_TSS_WINKEY_CLEANUP_BTEQ% > %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG

 IF ERRORLEVEL 1 (
 echo Exiting due to error during WINKEY TRIGGER cleanup >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
 set errorlevel=1
exit 1
)

set CNSMRTSSWINKEYSTGFLD="/d:%CNSMR_TSS_WINKEY_STG_FLD%"

cscript %MDM_CUSTOM_DIR%\bin\CNSMR_TSS_WINKEY_STG.vbs %TSSWINKEYOUTPUT% %CNSMRTSSWINKEYSTGFLD% %LOGONFILE% %DATABASENAME% %MSTDB% > %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT_VBS.LOG

fastload -c UTF8 < %CNSMR_TSS_WINKEY_STG_FLD% >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
REM tbuild -f %CNSMR_TSS_WINKEY_STG_TPT% -u "TdpId='%TdpId%',UserName='%UserName%',UserPassword='%UserPassword%',MDM_DB='%MDM_DB%',ERR_DB='%ERR_DB%',LOG_DB='%LOG_DB%',WORK_DB='%WORK_DB%',DirectoryPath='%MDM_CUSTOM_DIR%\data',FileName = '%TSS_WINKEY_OUTPUT%'"

IF ERRORLEVEL 1 (
echo Exiting due to error during fast load >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
set errorlevel=1
exit 1
)

set CNSMRTSSWINKEYSTGBTEQ="/d:%CNSMR_TSS_WINKEY_STG_BTEQ%"

set DATABASENAME="/f:%ICRM_DB%"

cscript %MDM_CUSTOM_DIR%\bin\CNSMR_TSS_WINKEY_STG.vbs %TSSWINKEYOUTPUT% %CNSMRTSSWINKEYSTGBTEQ% %LOGONFILE% %DATABASENAME% >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT_VBS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during winkey update >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
set errorlevel=1
exit 1
)

bteq < %CNSMR_TSS_WINKEY_STG_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during winkey update >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
set errorlevel=1
exit 1
)

FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
IF ERRORLEVEL 1 (
echo Exiting due to error during fast load >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
set errorlevel=1
exit 1
)
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
IF ERRORLEVEL 1 (
echo Exiting due to error during fast load >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
set errorlevel=1
exit 1
)
REM copy %TSS_WINKEY_OUTPUT% %MDM_CUSTOM_DIR%\archive\TSS_WINKEY_OUTPUT_%currentdate%_%currenttime%.DAT >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during fast load >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
set errorlevel=1
exit 1
)
REM compress -z %MDM_CUSTOM_DIR%\archive\TSS_WINKEY_OUTPUT.DAT %MDM_CUSTOM_DIR%\archive\TSS_WINKEY_OUTPUT_%currentdate%_%currenttime%.cmp >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
REM IF ERRORLEVEL 1 (
REM echo Exiting due to error during fast load >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
REM set errorlevel=1
REM exit 1
REM )
del %TSS_WINKEY_OUTPUT%
IF ERRORLEVEL 1 (
echo Exiting due to error during fast load >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
set errorlevel=1
exit 1
)

REM del %MDM_CUSTOM_DIR%\archive\TSS_WINKEY_OUTPUT_%currentdate%_%currenttime%.DAT
IF ERRORLEVEL 1 (
echo Exiting due to error during fast load >> %MDM_CUSTOM_DIR%\log\TSS_WINKEY_OUTPUT.LOG
set errorlevel=1
exit 1
)

:end