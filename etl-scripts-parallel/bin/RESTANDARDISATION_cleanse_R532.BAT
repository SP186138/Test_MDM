@echo off
REM PNG TSS Export

echo Executing TSS Export

:start


REM CHE
fexp -c UTF8 -r ".run file E:\Teradata\MDM\3.05.02\custom\pngrelease3\logON\LOGON.txt;" < E:\Teradata\MDM\3.05.02\custom\pngrelease3\etl-scripts-parallel\bin\TSS_CLEANSE_INPUT.FEXPCHE> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_CHE_cleanse.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_CHE_cleanse.LOG
EXIT
)
rename  E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_CHE.DAT TSS_CLEANSE_INPUT_CHE2.DAT
echo > E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_CHE.DAT
set TSSCLEANSEINPUT="/d:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_CHE2.DAT"
set TSSCLEANSEINPUT1="/e:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_CHE.DAT"
cscript E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\TRIM2.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUT1%
del E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_CHE2.DAT

REM IRL
fexp -c UTF8 -r ".run file E:\Teradata\MDM\3.05.02\custom\pngrelease3\logON\LOGON.txt;" < E:\Teradata\MDM\3.05.02\custom\pngrelease3\etl-scripts-parallel\bin\TSS_CLEANSE_INPUT.FEXPIRL> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_IRL_cleanse.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_IRL_cleanse.LOG
EXIT
)
rename  E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_IRL.DAT TSS_CLEANSE_INPUT_IRL2.DAT
echo > E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_IRL.DAT
set TSSCLEANSEINPUT="/d:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_IRL2.DAT"
set TSSCLEANSEINPUT1="/e:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_IRL.DAT"
cscript E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\TRIM2.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUT1%
del E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_IRL2.DAT


REM GBR
fexp -c UTF8 -r ".run file E:\Teradata\MDM\3.05.02\custom\pngrelease3\logON\LOGON.txt;" < E:\Teradata\MDM\3.05.02\custom\pngrelease3\etl-scripts-parallel\bin\TSS_CLEANSE_INPUT.FEXPGBR> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_GBR_cleanse.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\RESTANDARDISATION_GBR_cleanse.LOG
EXIT
)
rename  E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_GBR.DAT TSS_CLEANSE_INPUT_GBR2.DAT
echo > E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_GBR.DAT
set TSSCLEANSEINPUT="/d:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_GBR2.DAT"
set TSSCLEANSEINPUT1="/e:E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_GBR.DAT"
cscript E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\TRIM2.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUT1%
del E:\Teradata\MDM\3.05.02\custom\pngrelease3\data\TSS_CLEANSE_INPUT_GBR2.DAT


:end
