@echo off
REM Copyright (c) 2006-2007 by Teradata Corporation. 
REM All Rights Reserved. 
REM TERADATA CONFIDENTIAL AND TRADE SECRET 


rem run this file to register load to your database

echo Setting Env 
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

set LOADID=%2
:start

%util_dir%\ssed -e "s/$LOAD_ID/%LOADID%/;s/$Freq/%Frequency%/" %bin_path%\ScheduleIn_i25l.xmlt  > %bin_path%\ScheduleIn_i25l.xml

java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml BCM_MASTER ../bin/ScheduleIn_i25l.xml

if errorlevel 1 exit /b 1

if exist %ETL_HOME%\bin\MDM_LOAD_CONTROL_i25l.err exit /b 1

exit /b