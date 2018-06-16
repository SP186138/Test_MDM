@echo off
:: set the general path
set ETL_HOME="E:\Teradata\MDM\3.05.02\custom\pngrelease3"

echo Setting Up Environment

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


:: Timestamp Generator, do not delete
:: Parse the date (e.g., Fri 02/08/2008)
set cur_yyyy=%date:~10,4%
set cur_mm=%date:~4,2%
set cur_dd=%date:~7,2%

:: Parse the time (e.g., 11:17:13.49)
set cur_hh=%time:~0,2%
if %cur_hh% lss 10 (set cur_hh=0%time:~1,1%)
set cur_nn=%time:~3,2%
set cur_ss=%time:~6,2%
set cur_ms=%time:~9,2%

:: Set the timestamp format
set timestamp=%cur_yyyy%%cur_mm%%cur_dd%_%cur_hh%%cur_nn%%cur_ss%%cur_ms%
::echo %timestamp%

:: set up log directory for today
IF NOT EXIST %ETL_HOME%\log\%cur_yyyy%%cur_mm%%cur_dd% mkdir %ETL_HOME%\log\%cur_yyyy%%cur_mm%%cur_dd%

:: set up detail log directory for the current run
set log_dir=%ETL_HOME%\log\%cur_yyyy%%cur_mm%%cur_dd%

cd %exec_dir%
Echo Enter your Command

