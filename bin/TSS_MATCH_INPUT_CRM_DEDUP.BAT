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

echo Executing TSS Export

:start

call .\mdmcustomenv.bat 

set TSSMATCHINPUT="/c:%TSS_MATCH_INPUT%"

set TSSMATCHINPUTCRMFEXP="/d:%TSS_MATCH_INPUT_CRM_DEDUP_FEXP%"

set DBNAME="/e:%MASTER_DB%"

cscript %MDM_CUSTOM_DIR%\bin\TSS_MATCH_INPUT_CRM.vbs %TSSMATCHINPUT% %TSSMATCHINPUTCRMFEXP% %DBNAME% > %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM_VBS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM.LOG
set errorlevel=1
exit 1
)

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %TSS_MATCH_INPUT_CRM_DEDUP_FEXP% > %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM.LOG

REM tbuild -f %TSS_MATCH_INPUT_CRM_TPT% -u "TdpId='%TdpId%',UserName='%UserName%',UserPassword='%UserPassword%',MDM_DB='%MDM_DB%',DirectoryPath='%MDM_CUSTOM_DIR%\data',FileName = '%TSS_MATCH_INPUT%'"

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_INPUT_CRM.LOG
set errorlevel=1
exit 1
)

sleep 60

:end