@echo off
REM TSS Import

REM SCRIPT:               CNSMR_TSS_CLEANSE_OUTPUT_EDW.BTEQ
REM DESCRIPTION:          This script loads the POSTL data in EDW
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



bteq < CNSMR_TSS_CLEANSE_OUTPUT_EDW.BTEQ >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_EDW_%currentdate%_%currenttime%.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_EDW.LOG TSS_CLEANSE_OUTPUT_EDW_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

REM ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_OUTPUT_EDW.LOG TSS_CLEANSE_OUTPUT_EDW_%currentdate%_%currenttime%.LOG

:end
