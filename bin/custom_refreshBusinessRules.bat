@echo off
REM Copyright (c) 2006-2016 by Teradata Corporation. 
REM All Rights Reserved. 
REM Teradata CONFIDENTIAL AND TRADE SECRET 

echo %DATE:~4,10%  %TIME%
echo "<!--************ Refreshing/Updating Business Rules ************-->"

:start
call .\bcmenv.bat
set CLASSPATH=.;%CLASSPATH%

echo %DATE:~4,10%  %TIME%
echo Uploading ..\..\..\cfg\xservice\toolkit\data\refreshBusinessRules.xml
%JAVA_HOME%\bin\java com.teradata.xcore.net.Poster xserver xserver.xml BPE_META ..\..\..\cfg\xservice\toolkit\data\refreshBusinessRules.xml
pause
exit
