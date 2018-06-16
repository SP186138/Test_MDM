@echo off
REM Copyright (c) 2006-2016 by Teradata Corporation. 
REM All Rights Reserved. 
REM Teradata CONFIDENTIAL AND TRADE SECRET 


rem run this file to populate data to your database


echo Setting Env 
cd ..\..\bin
@call .\bcmenv.bat
set CLASSPATH=..\batch;%CLASSPATH%
rem echo %CLASSPATH%

set PAUSE_FLAG=%1
if "%PAUSE_FLAG%"=="" goto :start
if not "%PAUSE_FLAG%"=="pause" goto :error

:start



echo "<!--***********Starting setPreloadConfig ******************-->"

java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml E2E ../batch/preload/preDataLoad.xml
%PAUSE_FLAG%

pause
:error
echo Input value has to be either spaces or "pause"


