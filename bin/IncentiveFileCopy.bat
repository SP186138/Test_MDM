@echo off
REM Copyright (c) 2006-2007 by Teradata Corporation. 
REM All Rights Reserved. 
REM TERADATA CONFIDENTIAL AND TRADE SECRET 


rem run this file to register load to your database

REM cd bin
@call bcmenv.bat
set ETL_HOME="E:\Teradata\MDM\3.05.02\custom\pngrelease3"
set bin_path=%ETL_HOME%\bin
set exec_dir=%ETL_HOME%\exec
set script_path=%ETL_HOME%\script
set data_path=%ETL_HOME%\data
set reject_dir=%DATA_PATH%\reject
set util_dir=%ETL_HOME%\util
set tool_dir=%ETL_HOME%\util\bin
set include_dir=%ETL_HOME%\include
set secure_dir=%ETL_HOME%\secure
set work_dir=%ETL_HOME%\work
set temp_dir=%ETL_HOME%\temp
set temp_data=%ETL_HOME%\data
set log_path=%ETL_HOME%\log

set CLASSPATH=bin;%CLASSPATH%
rem echo %CLASSPATH%

:start

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

dir /B %ETL_HOME%\IncentiveExcelUpload\source > %bin_path%\abc.txt

set /p Build=<%bin_path%\abc.txt

echo %Build%

IF "%Build%"=="" exit 0

set Incentive=%Build%

set foldername=EntityINCTVTemplate%timestamp%

echo %Incentive%

for /f "tokens=1 delims=_ " %%a in ("%Build%") do set Usr=%%a

echo %Usr%


%util_dir%\ssed -e "s/$user/%Usr%/" %ETL_HOME%\bin\inctvUserChk.xml  > %bin_path%\inctvUserChkTemp.xml

java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml BCM_MASTER %bin_path%\inctvUserChkTemp.xml > %log_path%\%foldername%.log

findstr /irc:"ERROR" %log_path%\%foldername%.log

If %ERRORLEVEL% EQU 0 exit /b 2

md "%ETL_HOME%\IncentiveExcelUpload\source\%foldername%"

%util_dir%\ssed -e "s/$Incentive/%Incentive%/;s/$user/%Usr%/" %bin_path%\sourceMain.xml  > "%ETL_HOME%\IncentiveExcelUpload\source\%foldername%"\source.cfg
%util_dir%\ssed -e "s/$foldername/%foldername%/;s/$Incentive/%Incentive%/;s/$user/%Usr%/" %ETL_HOME%\bin\IncentiveUpload.xml  > %bin_path%\UploadIncentive_%foldername%.xml

move %ETL_HOME%\IncentiveExcelUpload\source\%Incentive% %ETL_HOME%\IncentiveExcelUpload\source\%foldername%

move %ETL_HOME%\IncentiveExcelUpload\source\%foldername% %ETL_HOME%\data\upload\source

java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml DATAUPLOAD %bin_path%\UploadIncentive_%foldername%.xml > %log_path%\%foldername%.log

findstr /irc:"ERROR" %log_path%\%foldername%.log

set Uploadresult=%ERRORLEVEL%

If %Uploadresult% EQU 1 set Sttus=Success

set rprtfile=%foldername%.rprtid

findstr /irc:"ReportId" %log_path%\%foldername%.log > %rprtfile%

ping 127.0.0.1 -n 1020 > nul

for /F delims^=^"^ tokens^=4 %%a in (%rprtfile%) do set ReportId=%%a

%util_dir%\ssed -e "s/$user/%Usr%/;s/$status/%Sttus%/;s/$rprtid/%ReportId%/" %ETL_HOME%\bin\emailSend.xml  > %bin_path%\emailSendTemp.xml

java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml BCM_MASTER %bin_path%\emailSendTemp.xml > %log_path%\%foldername%.log

findstr /irc:"ERROR" %log_path%\%foldername%.log

If %ERRORLEVEL% EQU 0 exit /b 1

If %Uploadresult% EQU 0 exit /b 1

del %bin_path%\UploadIncentive_%foldername%.xml

del %rprtfile%

if errorlevel 1 exit /b 1

if exist %ETL_HOME%\bin\MDM_LOAD_CONTROL_INCTV.err exit /b 1

exit /b




