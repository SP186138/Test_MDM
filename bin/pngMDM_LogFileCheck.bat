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

set xspath=E:/Teradata/MDM/3.05.02/cfg/properties/xserver.xml
set trpath=E:/Teradata/MDM/3.05.02/custom/pngrelease3/bin/LogFileCheckEmail.xml
java com.teradata.xcore.net.Poster http://143.30.195.1:14444 %trpath% > E:/Teradata/MDM/3.05.02/custom/pngrelease3/log/LogFileCheckEmail.log

@exit /b 0
