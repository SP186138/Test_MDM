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
REM 1.00                 01/21/2011           TERADATA                        INITIAL VERSION
REM 2.00                 10/31/2011           TERADATA                        CHANGES FOR ||ELISM

echo Executing TSS Export

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

set TSSMATCHINPUT1="%TSS_MATCH_INPUT%"

set TSSMATCHINPUT="/c:%TSS_MATCH_INPUT%"

set TSSMATCHINPUTCRMFEXP="/d:%TSS_MATCH_INPUT_CRM_FEXP%.FEXP"

set DBNAME="/e:%MASTER_DB%"

set CNTRY="/f:USA"

set COUNTRY="USA"

set COUNTRY=USA

set TSSMATCHINPUTDAT=%TSS_MATCH_INPUT1%%COUNTRY%.DAT

set TSSMATCHINPUTTMPL=%TSS_MATCH_INPUT1%%COUNTRY%.DATTMPL

copy %TSSMATCHINPUTDAT% %TSSMATCHINPUTTMPL%

IF ERRORLEVEL 1 (
echo Exiting due to error during rename >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_USA.LOG
set errorlevel=1


ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_USA.LOG TSS_MATCH_INPUT_CRM_USA_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSMATCHINPUT="/d:%TSSMATCHINPUTDAT%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\TRIM.vbs %TSSMATCHINPUT%

IF ERRORLEVEL 1 (
echo Exiting due to error during cscript >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_USA.LOG
set errorlevel=1


ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_USA.LOG TSS_MATCH_INPUT_CRM_USA_%currentdate%_%currenttime%.LOG
exit 1
)



ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_USA.LOG TSS_MATCH_INPUT_CRM_USA_%currentdate%_%currenttime%.LOG

:end