@echo off
REM Copyright (c) 2006-2016 by Teradata Corporation. 
REM All Rights Reserved. 
REM Teradata CONFIDENTIAL AND TRADE SECRET 
echo %DATE:~4,10%  %TIME%
echo "*********** Setting up environment ************"

call .\bcmenv.bat
set CLASSPATH=.;%CLASSPATH%

echo %DATE:~4,10%  %TIME%
echo Exporting SQL validation rules

%JAVA_HOME%\bin\java com.teradata.xcore.net.Poster xserver xserver.xml BPE_META ..\..\..\cfg\xservice\toolkit\rules\export_sql_validation_rule.xml
MOVE sql_validation_rules.xml ../cfg/xservice/toolkit/data

echo %DATE:~4,10%  %TIME%
echo done
exit
