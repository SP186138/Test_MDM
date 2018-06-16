@echo off
REM TSS Export

REM SCRIPT:               INCTV.BAT
REM DESCRIPTION:         This script calls INCTV.BTEQ
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 19/02/2018           TERADATA                        INITIAL VERSION

echo Executing XML Import
set InctvIDNew=%1
echo %InctvIDNew%
:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k


call .\mdmcustomenv-parallel.bat 

set XMLIMPORT="/c:%XML_IMPORT%"

set DATABASENAME="/f:%MST_DB%"

set MSTDB="/g:%MST_DB%"





IF ERRORLEVEL 1 (
echo Exiting due to error during XML import >> %MDM_CUSTOM_DIR%\log\INCTV.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\INCTV.LOG INCTV_%currentdate%_%currenttime%.LOG
exit 1
 )
 
set XMLIMPORT="%XML_IMPORT%.BTEQ" 

 E:\Teradata\MDM\3.05.02\custom\pngrelease3\util\ssed "s/$InctvIDNew/%InctvIDNew%/g" E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\INCTV.BTEQ > E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\INCTV.%InctvIDNew%
 bteq < E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\INCTV.%InctvIDNew% >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\INCTV.LOG
set ERR=%ERRORLEVEL%





:end