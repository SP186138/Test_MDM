@ECHO OFF
::........................................
::
:: Generated Batch file for windows
:: 2011/01/03 14:35:36
::
::........................................


::........................................
::
:: User may need to modify the value of TS_QUALITY
:: before running the script on a different machine
::
::........................................

call .\mdmcustomenv.bat 

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PTHIRTYSEVEN%\scripts\runproject5.cmd" "%PTHIRTYSEVEN%\scripts\TSSIndiaMatch.cmd" > %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PTEN%\scripts\runProject4.cmd" "%PTEN%\scripts\TSSIndiaCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PSIXSIX%\scripts\runProject14.cmd" "%PSIXSIX%\scripts\TSSAustraliaCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PSIXEIGHT%\scripts\runProject16.cmd" "%PSIXEIGHT%\scripts\TSSChinaCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PSEVENZERO%\scripts\runProject20.cmd" "%PSEVENZERO%\scripts\TSSNewZealandCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PEIGHTZERO%\scripts\runProject18.cmd" "%PEIGHTZERO%\scripts\TSSKoreaCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PFIVEFIVE%\scripts\runProject12.cmd" "%PFIVEFIVE%\scripts\TSSMalaysiaCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PFIVESIX%\scripts\runProject8.cmd" "%PFIVESIX%\scripts\TSSSingaporeCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PFOUR%\scripts\runProject23.cmd" "%PFOUR%\scripts\TSSGlobalRouter.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PTWOTHREE%\scripts\runProject6.cmd" "%PTWOTHREE%\scripts\TSSJapanCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PFOURFOUR%\scripts\runProject7.cmd" "%PFOURFOUR%\scripts\TSSJapanMatch.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PSIXTHREE%\scripts\runProject9.cmd" "%PSIXTHREE%\scripts\TSSSingaporeMatch.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PSIXFOUR%\scripts\runProject13.cmd" "%PSIXFOUR%\scripts\TSSMalaysiaMatch.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PSIXSEVEN%\scripts\runProject15.cmd" "%PSIXSEVEN%\scripts\TSSAustraliaMatch.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PSIXNINE%\scripts\runProject17.cmd" "%PSIXNINE%\scripts\TSSChinaMatch.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PSEVENONE%\scripts\runProject21.cmd" "%PSEVENONE%\scripts\TSSNewZealandMatch.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PEIGHTONE%\scripts\runProject19.cmd" "%PEIGHTONE%\scripts\TSSKoreaMatch.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PFOUR%\settings\config batch.tbl" "%PFOUR%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PTEN%\settings\config batch.tbl" "%PTEN%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PTHIRTYSEVEN%\settings\config batch.tbl" "%PTHIRTYSEVEN%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)


copy/b "%MDM%\bin\configbatchset.tbl"+"%PTWOTHREE%\settings\config batch.tbl" "%PTWOTHREE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PFOURFOUR%\settings\config batch.tbl" "%PFOURFOUR%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PFIVEFIVE%\settings\config batch.tbl" "%PFIVEFIVE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PFIVESIX%\settings\config batch.tbl" "%PFIVESIX%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PSIXTHREE%\settings\config batch.tbl" "%PSIXTHREE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PSIXFOUR%\settings\config batch.tbl" "%PSIXFOUR%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PSIXSIX%\settings\config batch.tbl" "%PSIXSIX%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PSIXSEVEN%\settings\config batch.tbl" "%PSIXSEVEN%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PSIXEIGHT%\settings\config batch.tbl" "%PSIXEIGHT%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PSIXNINE%\settings\config batch.tbl" "%PSIXNINE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PSEVENZERO%\settings\config batch.tbl" "%PSEVENZERO%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PSEVENONE%\settings\config batch.tbl" "%PSEVENONE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PEIGHTZERO%\settings\config batch.tbl" "%PEIGHTZERO%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PEIGHTONE%\settings\config batch.tbl" "%PEIGHTONE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PEIGHTFOUR%\scripts\runProject10.cmd" "%PEIGHTFOUR%\scripts\TSSTaiwanCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PEIGHTFIVE%\scripts\runProject11.cmd" "%PEIGHTFIVE%\scripts\TSSTaiwanMatch.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PEIGHTFOUR%\settings\config batch.tbl" "%PEIGHTFOUR%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PEIGHTFIVE%\settings\config batch.tbl" "%PEIGHTFIVE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PONEZEROSIX%\scripts\runProject2.cmd" "%PONEZEROSIX%\scripts\TSSHongKongCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PONEZEROSEVEN%\scripts\runProject3.cmd" "%PONEZEROSEVEN%\scripts\TSSHongKongMatch.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PONEZEROSIX%\settings\config batch.tbl" "%PONEZEROSIX%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PONEZEROSEVEN%\settings\config batch.tbl" "%PONEZEROSEVEN%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PTWOFIVE%\scripts\runProject34.cmd" "%PTWOFIVE%\scripts\TSSPhCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PTWOSIX%\scripts\runProject35.cmd" "%PTWOSIX%\scripts\TSSPhMatch.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PTWOFIVE%\settings\config batch.tbl" "%PTWOFIVE%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PTWOSIX%\settings\config batch.tbl" "%PTWOSIX%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PTWOSEVEN%\scripts\runProject49.cmd" "%PTWOSEVEN%\scripts\TSSZzCleanse.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\mdmcustomenv.bat"+"%PTWOEIGHT%\scripts\runProject50.cmd" "%PTWOEIGHT%\scripts\TSSZzMatch.cmd" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PTWOSEVEN%\settings\config batch.tbl" "%PTWOSEVEN%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)

copy/b "%MDM%\bin\configbatchset.tbl"+"%PTWOEIGHT%\settings\config batch.tbl" "%PTWOEIGHT%\settings\config_batch.tbl" >> %MDM%\log\TSSEnvSet.log

IF ERRORLEVEL 1 (
echo Exiting due to error during env set >> %MDM_CUSTOM_DIR%\log\TSSEnvSet.LOG
set errorlevel=1
exit 1
)
