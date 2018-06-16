
@echo off
REM Copyright (c) 2006-2016 by Teradata Corporation. 
REM All Rights Reserved. 
REM Teradata CONFIDENTIAL AND TRADE SECRET 


echo %DATE:~4,10%  %TIME%
echo Calling custom_execute_gendb.bat

call .\custom_execute_gendb.bat > ..\log\custom_gendb.log 2>&1

