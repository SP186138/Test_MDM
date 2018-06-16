@echo off
REM TSS Import

REM SCRIPT:               CNSMR_TSS_CLEANSE_STG_ALL.FLD 
REM DESCRIPTION:          This script loads the MST CLEANSE OUTPUT table from the trillium cleanse output file
REM INPUT:                
REM OUTPUT:               
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 02/22/2015           TERADATA                        INITIAL VERSION

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

echo fastloadstarted>>%MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_ALL.LOG

fastload -c UTF8 < CNSMR_TSS_CLEANSE_OUTPUT_STG_ALL.FLD >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_ALL.LOG

echo fastloadterminated>>%MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_ALL.LOG

set ERR=%ERRORLEVEL%
ECHO ERR>> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_ALL.LOG
IF NOT %ERR% == 0  (
echo Exiting due to error during CLEANSE OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_ALL.LOG
)
echo movingstarted>>%MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_ALL.LOG

bteq < CNSMR_TSS_CLEANSE_OUTPUT_MOVE.BTEQ >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_ALL.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_ALL.LOG TSS_CLEANSE_OUTPUT_ALL_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_ALL.LOG TSS_CLEANSE_OUTPUT_ALL_%currentdate%_%currenttime%.LOG

:end
