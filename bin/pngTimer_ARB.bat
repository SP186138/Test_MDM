@echo off
REM Copyright (c) 2006-2007 by Teradata Corporation. 
REM All Rights Reserved. 
REM TERADATA CONFIDENTIAL AND TRADE SECRET 


rem run this file to register load to your database

echo Setting Env 
REM cd bin
@call bcmenv.bat


set CLASSPATH=bin;%CLASSPATH%
rem echo %CLASSPATH%


set PAUSE_FLAG=%1
if "%PAUSE_FLAG%"=="" goto :start
if not "%PAUSE_FLAG%"=="pause" goto :error

:start



echo "<!--***********Starting Timer ARB ******************-->"


java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml BCM_MASTER ../bin/pngTimer_ARB.xml
%PAUSE_FLAG%

pause
:error
echo Input value has to be either spaces or "pause"