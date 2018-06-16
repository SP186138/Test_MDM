@echo off
REM PNG TSS Export

REM SCRIPT:               CNSMR_Error.BAT
REM DESCRIPTION:          This script generates the ERROR file from the input table
REM DEPENDENCY:           MDM Validation load
REM INPUT:                MST TABLES
REM OUTPUT:               ERR*.DAT
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 01/21/2011           TERADATA                        INITIAL VERSION

echo Executing TSS Export

:start

call .\mdmcustomenv.bat 

set INPUT="/c:%ERR_CNSMR_AFFLTN_STG%"

set INPUTFEXP="/d:%ERR_CNSMR_AFFLTN_STG_FEXP%"

set DBNAME="/e:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\ERROR_INPUT.vbs %INPUT% %INPUTFEXP% %DBNAME% > %MDM_CUSTOM_DIR%\log\CNSMR_Error_VBS.LOG

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %ERR_CNSMR_AFFLTN_STG_FEXP% > %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG
set errorlevel=1
exit 1
)

set INPUT="/c:%ERR_DPEND_STG%"

set INPUTFEXP="/d:%ERR_DPEND_STG_FEXP%"

set DBNAME="/e:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\ERROR_INPUT.vbs %INPUT% %INPUTFEXP% %DBNAME% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error_VBS.LOG

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %ERR_DPEND_STG_FEXP% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG
set errorlevel=1
exit 1
)

set INPUT="/c:%ERR_DPEND_TRT_STG%"

set INPUTFEXP="/d:%ERR_DPEND_TRT_STG_FEXP%"

set DBNAME="/e:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\ERROR_INPUT.vbs %INPUT% %INPUTFEXP% %DBNAME% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error_VBS.LOG

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %ERR_DPEND_TRT_STG_FEXP% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG
set errorlevel=1
exit 1
)

set INPUT="/c:%ERR_PET_STG%"

set INPUTFEXP="/d:%ERR_PET_STG_FEXP%"

set DBNAME="/e:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\ERROR_INPUT.vbs %INPUT% %INPUTFEXP% %DBNAME% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error_VBS.LOG

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %ERR_PET_STG_FEXP% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG
set errorlevel=1
exit 1
)

set INPUT="/c:%ERR_PET_TRT_STG%"

set INPUTFEXP="/d:%ERR_PET_TRT_STG_FEXP%"

set DBNAME="/e:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\ERROR_INPUT.vbs %INPUT% %INPUTFEXP% %DBNAME% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error_VBS.LOG

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %ERR_PET_TRT_STG_FEXP% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG
set errorlevel=1
exit 1
)

set INPUT="/c:%ERR_PRSNA_EMAIL_ADDR_STG%"

set INPUTFEXP="/d:%ERR_PRSNA_EMAIL_ADDR_STG_FEXP%"

set DBNAME="/e:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\ERROR_INPUT.vbs %INPUT% %INPUTFEXP% %DBNAME% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error_VBS.LOG

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %ERR_PRSNA_EMAIL_ADDR_STG_FEXP% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG
set errorlevel=1
exit 1
)

set INPUT="/c:%ERR_PRSNA_PHONE_STG%"

set INPUTFEXP="/d:%ERR_PRSNA_PHONE_STG_FEXP%"

set DBNAME="/e:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\ERROR_INPUT.vbs %INPUT% %INPUTFEXP% %DBNAME% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error_VBS.LOG

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %ERR_PRSNA_PHONE_STG_FEXP% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG
set errorlevel=1
exit 1
)

set INPUT="/c:%ERR_PRSNA_POSTL_ADDR_STG%"

set INPUTFEXP="/d:%ERR_PRSNA_POSTL_ADDR_STG_FEXP%"

set DBNAME="/e:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\ERROR_INPUT.vbs %INPUT% %INPUTFEXP% %DBNAME% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error_VBS.LOG

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %ERR_PRSNA_POSTL_ADDR_STG_FEXP% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG
set errorlevel=1
exit 1
)

set INPUT="/c:%ERR_PRSNA_SOC_NETWK_ACCT_STG%"

set INPUTFEXP="/d:%ERR_PRSNA_SOC_NETWK_ACCT_STG_FEXP%"

set DBNAME="/e:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\ERROR_INPUT.vbs %INPUT% %INPUTFEXP% %DBNAME% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error_VBS.LOG

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %ERR_PRSNA_SOC_NETWK_ACCT_STG_FEXP% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG
set errorlevel=1
exit 1
)

set INPUT="/c:%ERR_PRSNA_STG%"

set INPUTFEXP="/d:%ERR_PRSNA_STG_FEXP%"

set DBNAME="/e:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\ERROR_INPUT.vbs %INPUT% %INPUTFEXP% %DBNAME% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error_VBS.LOG

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %ERR_PRSNA_STG_FEXP% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG
set errorlevel=1
exit 1
)

set INPUT="/c:%ERR_PRSNA_TRT_STG%"

set INPUTFEXP="/d:%ERR_PRSNA_TRT_STG_FEXP%"

set DBNAME="/e:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\bin\ERROR_INPUT.vbs %INPUT% %INPUTFEXP% %DBNAME% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error_VBS.LOG

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %ERR_PRSNA_TRT_STG% >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\CNSMR_Error.LOG
set errorlevel=1
exit 1
)

:end