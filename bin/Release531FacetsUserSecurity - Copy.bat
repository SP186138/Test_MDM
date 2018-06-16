@echo off
REM Copyright (c) 2006-2007 by Teradata Corporation. 
REM All Rights Reserved. 
REM TERADATA CONFIDENTIAL AND TRADE SECRET 


rem run this file to register load to your database

echo Setting Env 
cd bin
@call bcmenv.bat


set CLASSPATH=bin;%CLASSPATH%
rem echo %CLASSPATH%


set PAUSE_FLAG=%1
if "%PAUSE_FLAG%"=="" goto :start
if not "%PAUSE_FLAG%"=="pause" goto :error

:start



echo "<!--***********Starting executeMerge ******************-->"


java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml BPE_META ../bin/Release531Facets.xml > ../log\Release531FacetsUserSecurity1.log
%PAUSE_FLAG%

java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml DATAUPLOAD ../bin/Release531Upload.xml >> ../log\Release531FacetsUserSecurity2.log
%PAUSE_FLAG%

java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml USER_SECURITY ../bin/Release531UserSecurity.xml >> ../log\Release531FacetsUserSecurity3.log
%PAUSE_FLAG%

pause
:error
echo Input value has to be either spaces or "pause"