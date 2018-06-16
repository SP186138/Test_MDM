@echo off
REM TSS Export

REM SCRIPT:               TSS_MATCH_INPUT_CRM.FEXP
REM DESCRIPTION:          This script generates the reference file for use by Trillium
REM DEPENDENCY:           MST WINKEY TRIGGER load
REM INPUT:                GOLDEN TABLES & MST WINKEY TRIGGER
REM OUTPUT:               TSS_MATCH_INPUT_CRM.DAT
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 12/10/2012           TERADATA                        INITIAL VERSION


echo Executing TSS Export

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

set TSSMATCHINPUT="/c:%TSS_MATCH_INPUT%"

set TSSMATCHINPUTCRMFEXP="/d:%TSS_MATCH_INPUT_CRM_FEXP%.FEXP"

set DBNAME="/e:%MASTER_DB%"

set CNTRY="/f:TRK"

set COUNTRY="TRK"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\TSS_MATCH_INPUT_CRM.vbs %TSSMATCHINPUT% %TSSMATCHINPUTCRMFEXP% %DBNAME% %CNTRY% > %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_TRK.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_TRK.LOG
set errorlevel=1


ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_TRK.LOG TSS_MATCH_INPUT_CRM_TRK_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSMATCHINPUTCRMFEXP="%TSS_MATCH_INPUT_CRM_FEXP%.FEXP%COUNTRY%"

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %TSSMATCHINPUTCRMFEXP% >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_TRK.LOG

REM tbuild -f %TSS_MATCH_INPUT_CRM_TPT% -u "TdpId='%TdpId%',UserName='%UserName%',UserPassword='%UserPassword%',MDM_DB='%MDM_DB%',DirectoryPath='%MDM_CUSTOM_DIR%\data',FileName = '%TSS_MATCH_INPUT%'"

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_TRK.LOG
set errorlevel=1


ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_TRK.LOG TSS_MATCH_INPUT_CRM_TRK_%currentdate%_%currenttime%.LOG
exit 1
)

set COUNTRY=TRK

set TSSMATCHINPUTDAT=%TSS_MATCH_INPUT1%%COUNTRY%.DAT

set TSSMATCHINPUTTMPL=%TSS_MATCH_INPUT1%%COUNTRY%.DATTMPL

copy %TSSMATCHINPUTDAT% %TSSMATCHINPUTTMPL%

IF ERRORLEVEL 1 (
echo Exiting due to error during rename >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_TRK.LOG
set errorlevel=1


ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_TRK.LOG TSS_MATCH_INPUT_CRM_TRK_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSMATCHINPUT="/d:%TSSMATCHINPUTDAT%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\TRIM.vbs %TSSMATCHINPUT%

IF ERRORLEVEL 1 (
echo Exiting due to error during cscript >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_TRK.LOG
set errorlevel=1


ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_TRK.LOG TSS_MATCH_INPUT_CRM_TRK_%currentdate%_%currenttime%.LOG
exit 1
)



ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_TRK.LOG TSS_MATCH_INPUT_CRM_TRK_%currentdate%_%currenttime%.LOG

:end