@echo off
REM -------------------------------------------------------------------------------------
REM  Timestamp Generator, do not delete
set cur_yyyy=%date:~10,4%
set cur_mm=%date:~4,2%
set cur_dd=%date:~7,2%
set cur_hh=%time:~0,2%
if %cur_hh% lss 10 (set cur_hh=0%time:~1,1%)
set cur_nn=%time:~3,2%
set cur_ss=%time:~6,2%
set cur_ms=%time:~9,2%
set LOAD_DTTM_START=%cur_yyyy%-%cur_mm%-%cur_dd% %cur_hh%:%cur_nn%:%cur_ss%
set timestamp=%cur_yyyy%%cur_mm%%cur_dd%_%cur_hh%%cur_nn%%cur_ss%%cur_ms%

REM -------------------------------------------------------------------------------------

set BTCH=%1
set SMPL=%1

call .\etlenv.cmd

REM:  INSERT CODE HERE TO POPULATE VALIDATION_BATCH WITH LOAD_ID'S THAT YOU WANT TO PROCESS

echo s/$BTCH/%BTCH%/ > ..\temp\vp.txt
echo s/$SMPL/%SMPL%/ >> ..\temp\vp.txt

%util_dir%\ssed -f ..\temp\vp.txt %script_path%\VAL_BATCH_PREP.btq  > %script_path%\VAL_BATCH_PREP.%BTCH%
::%PARAM_FILE% -f %TEMP_PARAM_FILE% -f %secure_dir%\logon.txt  %util_dir%\create_contro
::%util_dir%\ssed "s/$BTCH/%BTCH%/  s/$SMPL/%SMPL%/" %script_path%\VAL_BATCH_PREP.btq  > %script_path%\VAL_BATCH_PREP.%BTCH%
call %exec_dir%\run_sql VAL_BATCH_PREP.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\VAL_BATCH_PREP.%BTCH%
del ..\temp\vp.txt

echo %time%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_STG_VAL.btq  > %script_path%\PRSNA_STG_VAL.%BTCH%
call %exec_dir%\run_sql PRSNA_STG_VAL.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_STG_VAL.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_TRT_STG_VAL.btq  > %script_path%\PRSNA_TRT_STG_VAL.%BTCH%
call %exec_dir%\run_sql PRSNA_TRT_STG_VAL.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_TRT_STG_VAL.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PET_STG_VAL.btq  > %script_path%\PET_STG_VAL.%BTCH%
call %exec_dir%\run_sql PET_STG_VAL.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PET_STG_VAL.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PET_TRT_STG_VAL.btq  > %script_path%\PET_TRT_STG_VAL.%BTCH%
call %exec_dir%\run_sql PET_TRT_STG_VAL.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PET_TRT_STG_VAL.%BTCH%


%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\DPEND_STG_VAL.btq  > %script_path%\DPEND_STG_VAL.%BTCH%
call %exec_dir%\run_sql DPEND_STG_VAL.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DPEND_STG_VAL.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\DPEND_TRT_STG_VAL.btq  > %script_path%\DPEND_TRT_STG_VAL.%BTCH%
call %exec_dir%\run_sql DPEND_TRT_STG_VAL.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DPEND_TRT_STG_VAL.%BTCH%


%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_POSTL_ADDR_STG_VAL.btq  > %script_path%\PRSNA_POSTL_ADDR_STG_VAL.%BTCH%
call %exec_dir%\run_sql PRSNA_POSTL_ADDR_STG_VAL.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_POSTL_ADDR_STG_VAL.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_EMAIL_ADDR_STG_VAL.btq  > %script_path%\PRSNA_EMAIL_ADDR_STG_VAL.%BTCH%
call %exec_dir%\run_sql PRSNA_EMAIL_ADDR_STG_VAL.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_EMAIL_ADDR_STG_VAL.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_PHONE_STG_VAL.btq  > %script_path%\PRSNA_PHONE_STG_VAL.%BTCH%
call %exec_dir%\run_sql PRSNA_PHONE_STG_VAL.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_PHONE_STG_VAL.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_SOCIAL_NETWK_ACCT_STG_VAL.btq  > %script_path%\PRSNA_SOCIAL_NETWK_ACCT_STG_VAL.%BTCH%
call %exec_dir%\run_sql PRSNA_SOCIAL_NETWK_ACCT_STG_VAL.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_SOCIAL_NETWK_ACCT_STG_VAL.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\BAD_FILE.btq  > %script_path%\BAD_FILE.%BTCH%
call %exec_dir%\run_sql BAD_FILE.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\BAD_FILE.%BTCH%

 
echo 'Validation Complete'
echo %time%


echo 'Loading MDM Staging Tables... '

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\CNSMR_AFFLTN_STG_INS.btq  > %script_path%\CNSMR_AFFLTN_STG_INS.%BTCH%
call %exec_dir%\run_sql CNSMR_AFFLTN_STG_INS.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\CNSMR_AFFLTN_STG_INS.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_STG_INS.btq  > %script_path%\PRSNA_STG_INS.%BTCH%
call %exec_dir%\run_sql PRSNA_STG_INS.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_STG_INS.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_TRT_STG_INS.btq  > %script_path%\PRSNA_TRT_STG_INS.%BTCH%
call %exec_dir%\run_sql PRSNA_TRT_STG_INS.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_TRT_STG_INS.%BTCH%


%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PET_STG_INS.btq  > %script_path%\PET_STG_INS.%BTCH%
call %exec_dir%\run_sql PET_STG_INS.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PET_STG_INS.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PET_TRT_STG_INS.btq  > %script_path%\PET_TRT_STG_INS.%BTCH%
call %exec_dir%\run_sql PET_TRT_STG_INS.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PET_TRT_STG_INS.%BTCH%


%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\DPEND_STG_INS.btq  > %script_path%\DPEND_STG_INS.%BTCH%
call %exec_dir%\run_sql DPEND_STG_INS.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DPEND_STG_INS.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\DPEND_TRT_STG_INS.btq  > %script_path%\DPEND_TRT_STG_INS.%BTCH%
call %exec_dir%\run_sql DPEND_TRT_STG_INS.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DPEND_TRT_STG_INS.%BTCH%


%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_POSTL_ADDR_STG_INS.btq  > %script_path%\PRSNA_POSTL_ADDR_STG_INS.%BTCH%
call %exec_dir%\run_sql PRSNA_POSTL_ADDR_STG_INS.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_POSTL_ADDR_STG_INS.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_EMAIL_ADDR_STG_INS.btq  > %script_path%\PRSNA_EMAIL_ADDR_STG_INS.%BTCH%
call %exec_dir%\run_sql PRSNA_EMAIL_ADDR_STG_INS.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_EMAIL_ADDR_STG_INS.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_PHONE_STG_INS.btq  > %script_path%\PRSNA_PHONE_STG_INS.%BTCH%
call %exec_dir%\run_sql PRSNA_PHONE_STG_INS.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_PHONE_STG_INS.%BTCH%

%util_dir%\ssed "s/$BTCH/%BTCH%/" %script_path%\PRSNA_SOCIAL_NETWK_ACCT_STG_INS.btq  > %script_path%\PRSNA_SOCIAL_NETWK_ACCT_STG_INS.%BTCH%
call %exec_dir%\run_sql PRSNA_SOCIAL_NETWK_ACCT_STG_INS.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_SOCIAL_NETWK_ACCT_STG_INS.%BTCH%

echo s/$BTCH/%BTCH%/ > ..\temp\vp.txt

%util_dir%\ssed -f ..\temp\vp.txt %script_path%\VAL_BATCH_CLEANUP.btq  > %script_path%\VAL_BATCH_CLEANUP.%BTCH%
call %exec_dir%\run_sql VAL_BATCH_CLEANUP.%BTCH%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\VAL_BATCH_CLEANUP.%BTCH%
del ..\temp\vp.txt
echo %time%

:Closeout
echo %time%
exit %returncd%