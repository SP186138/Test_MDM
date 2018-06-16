@echo off
REM TSS Match

echo Executing TSS Match

:start

call .\mdmcustomenv.bat 

call "%PROJECTTHIRTYSEVEN%\scripts\TSSIndiaMatch.cmd" > %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

call "%PROJECTSIXTHREE%\scripts\TSSSingaporeMatch.cmd" >> %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match  >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

call "%PROJECTTWOSIX%\scripts\TSSPhMatch.cmd" > %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

call "%PROJECTTWOEIGHT%\scripts\TSSZzMatch.cmd" >> %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match  >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

call "%PROJECTSIXFOUR%\scripts\TSSMalaysiaMatch.cmd" >> %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match  >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

call "%PROJECTSIXSEVEN%\scripts\TSSAustraliaMatch.cmd" >> %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match  >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

call "%PROJECTSIXNINE%\scripts\TSSChinaMatch.cmd" >> %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match  >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

call "%PROJECTSEVENONE%\scripts\TSSNewZealandMatch.cmd" >> %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match  >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

call "%PROJECTEIGHTONE%\scripts\TSSKoreaMatch.cmd" >> %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match  >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

call "%PROJECTEIGHTFIVE%\scripts\TSSTaiwanMatch.cmd" >> %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match  >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

call "%PROJECTONEZEROSEVEN%\scripts\TSSHongKongMatch.cmd" >> %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match  >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

call "%PROJECTFOURFOUR%\scripts\TSSJapanMatch.cmd" >> %MDM_CUSTOM_DIR%\log\TSSMatch.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match  >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

Copy/b "%TSS_OUTPUT%\e1170_in_tranfrmr_p24.prn"+"%TSS_OUTPUT%\e1168_in_tranfrmr_p24.prn"+"%TSS_OUTPUT%\e1169_in_tranfrmr_p24.prn"+"%TSS_OUTPUT%\e105_jp_tranfrmr_p24.prn"+"%TSS_OUTPUT%\e72_in_tranfrmr_p24.prn"+"%TSS_OUTPUT%\e217_tranfrmr_p24.prn"+"%TSS_OUTPUT%\e254_tranfrmr_p24.prn"+"%TSS_OUTPUT%\e292_jp_tranfrmr_p24.prn"+"%TSS_OUTPUT%\e324_jp_tranfrmr_p24.prn"+"%TSS_OUTPUT%\e363_tranfrmr_p24.prn"+"%TSS_OUTPUT%\e142_tranfrmr_p24.prn"+"%TSS_OUTPUT%\e182_jp_tranfrmr_p24.prn" "%MDM_INPUT%\TSS_MATCH_OUTPUT.DAT" >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG

IF ERRORLEVEL 1 (
type nul Exiting due to error during TSS Match >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

copy %MDM_CUSTOM_DIR%\data\TSS_MATCH_INPUT_CRM.DAT %MDM_CUSTOM_DIR%\archive\TSS_MATCH_INPUT_CRM_%currentdate%_%currenttime%.DAT >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

REM compress -z %MDM_CUSTOM_DIR%\archive\TSS_MATCH_INPUT_CRM_%currentdate%_%currenttime%.DAT %MDM_CUSTOM_DIR%\archive\TSS_MATCH_INPUT_CRM_%currentdate%_%currenttime%.cmp >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

del %MDM_CUSTOM_DIR%\data\TSS_MATCH_INPUT_CRM.DAT >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

REM del %MDM_CUSTOM_DIR%\archive\TSS_MATCH_INPUT_CRM_%currentdate%_%currenttime%.DAT >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Match >> %MDM_CUSTOM_DIR%\log\TSSMatch.LOG
set errorlevel=1
exit 1
)

:end