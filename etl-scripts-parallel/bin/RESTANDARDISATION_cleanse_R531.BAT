@echo off
REM PNG TSS Export

echo Executing TSS Export

:start


REM AUT
fexp -c UTF8 -r ".run file E:\Teradata\MDM\3.05.02\custom\pngrelease3\logON\LOGON.txt;" < E:\Teradata\MDM\3.05.02\custom\pngrelease3\etl-scripts-parallel\bin\TSS_CLEANSE_INPUT.FEXPAUT> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_AUT_cleanse.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_AUT_cleanse.LOG
EXIT
)
rename  E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_AUT.DAT TSS_CLEANSE_INPUT_AUT2.DAT
echo > E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_AUT.DAT
set TSSCLEANSEINPUT="/d:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_AUT2.DAT"
set TSSCLEANSEINPUT1="/e:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_AUT.DAT"
cscript E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\TRIM2.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUT1%
del E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_AUT2.DAT

REM ITA
fexp -c UTF8 -r ".run file E:\Teradata\MDM\3.05.02\custom\pngrelease3\logON\LOGON.txt;" < E:\Teradata\MDM\3.05.02\custom\pngrelease3\etl-scripts-parallel\bin\TSS_CLEANSE_INPUT.FEXPITA> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_ITA_cleanse.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_ITA_cleanse.LOG
EXIT
)
rename  E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_ITA.DAT TSS_CLEANSE_INPUT_ITA2.DAT
echo > E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_ITA.DAT
set TSSCLEANSEINPUT="/d:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_ITA2.DAT"
set TSSCLEANSEINPUT1="/e:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_ITA.DAT"
cscript E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\TRIM2.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUT1%
del E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_ITA2.DAT


REM FRA
fexp -c UTF8 -r ".run file E:\Teradata\MDM\3.05.02\custom\pngrelease3\logON\LOGON.txt;" < E:\Teradata\MDM\3.05.02\custom\pngrelease3\etl-scripts-parallel\bin\TSS_CLEANSE_INPUT.FEXPFRA> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_FRA_cleanse.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_FRA_cleanse.LOG
EXIT
)
rename  E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_FRA.DAT TSS_CLEANSE_INPUT_FRA2.DAT
echo > E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_FRA.DAT
set TSSCLEANSEINPUT="/d:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_FRA2.DAT"
set TSSCLEANSEINPUT1="/e:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_FRA.DAT"
cscript E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\TRIM2.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUT1%
del E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_FRA2.DAT


REM DEU
fexp -c UTF8 -r ".run file E:\Teradata\MDM\3.05.02\custom\pngrelease3\logON\LOGON.txt;" < E:\Teradata\MDM\3.05.02\custom\pngrelease3\etl-scripts-parallel\bin\TSS_CLEANSE_INPUT.FEXPDEU> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_DEU_cleanse.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_DEU_cleanse.LOG
EXIT
)
rename  E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_DEU.DAT TSS_CLEANSE_INPUT_DEU2.DAT
echo > E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_DEU.DAT
set TSSCLEANSEINPUT="/d:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_DEU2.DAT"
set TSSCLEANSEINPUT1="/e:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_DEU.DAT"
cscript E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\TRIM2.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUT1%
del E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_DEU2.DAT

:end
