@echo off
REM Copyright (c) 2006-2015 by Teradata Corporation. 
REM All Rights Reserved. 
REM Teradata CONFIDENTIAL AND TRADE SECRET 


:start
call .\bcmenv.bat

echo start all 
start .\startAll.bat
%JAVA_HOME%\bin\java com.teradata.xcore.util.SocketPoller localhost xserver.xml

FOR %%i IN (..\rolledupData\*.xml) DO (
echo %%i
%JAVA_HOME%\bin\java -Xms256m -Xmx1024m com.teradata.bcm.xcore.util.PosterUtil xserver localhost xserver.xml  %%i
)

echo import of rolled up data complete

:end
