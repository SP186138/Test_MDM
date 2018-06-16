@echo off
REM TSS Route and Cleanse

echo Executing TSS Route and Cleanse

:start
call .\mdmcustomenv.bat 

call "%PROJECTFOUR%\scripts\TSSGlobalRouter.cmd" > %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Route >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTTEN%\scripts\TSSIndiaCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTSIXSIX%\scripts\TSSAustraliaCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTTWOFIVE%\scripts\TSSPhCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTTWOSEVEN%\scripts\TSSZzCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTSIXEIGHT%\scripts\TSSChinaCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTSEVENZERO%\scripts\TSSNewZealandCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTEIGHTZERO%\scripts\TSSKoreaCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTEIGHTFOUR%\scripts\TSSTaiwanCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTONEZEROSIX%\scripts\TSSHongKongCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTFIVEFIVE%\scripts\TSSMalaysiaCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTFIVESIX%\scripts\TSSSingaporeCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

call "%PROJECTTWOTHREE%\scripts\TSSJapanCleanse.cmd" >> %MDM%\log\TSSRouteCleanse.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)

Copy/b "%TSS_OUTPUT%\e116_sg_tranfrmr_p8.prn"+"%TSS_OUTPUT%\e151_tw_tranfrmr_p7.prn"+"%TSS_OUTPUT%\e189_my_tranfrmr_p8.prn"+"%TSS_OUTPUT%\e226_au_tranfrmr_p8.prn"+"%TSS_OUTPUT%\e262_cn_tranfrmr_p7.prn"+"%TSS_OUTPUT%\e298_kr_tranfrmr_p7.prn"+"%TSS_OUTPUT%\e335_nz_tranfrmr_p8.prn"+"%TSS_OUTPUT%\e43_in_tranfrmr_p6.prn"+"%TSS_OUTPUT%\e540_ph_tranfrmr_p6.prn"+"%TSS_OUTPUT%\e77_jp_tranfrmr_p7.prn"+"%TSS_OUTPUT%\e8_hk_tranfrmr_p7.prn"+"%TSS_OUTPUT%\e869_zz_tranfrmr_p9.prn" "%MDM_INPUT%\TSS_WINKEY_OUTPUT.DAT" >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse.LOG
set errorlevel=1
exit 1
)


:end