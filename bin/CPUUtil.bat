@echo off
REM TSS Import

REM SCRIPT:               CPU USAGE.BAT
REM DESCRIPTION:          Checks Trillium Server Usage
REM DEPENDENCY:           
REM INPUT:                
REM OUTPUT:               
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 11/17/2011           TERADATA                        INITIAL VERSION


echo Executing TSS Import

:start

call .\mdmcustomenv.bat 

set PCT=%~1
set PRCT="/c:%PCT%"

:start 

cscript %MDM_CUSTOM_DIR%\bin\CPUUtil.vbs %PRCT% > %MDM_CUSTOM_DIR%\log\CPUUtil.log

IF ERRORLEVEL 2 (
echo "Exiting due to CPU Overload" >> %MDM_CUSTOM_DIR%\log\CPUUtil.log
exit 2
)
       
:end

