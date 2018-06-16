@echo off
REM Copyright (c) 2006-2016 by Teradata Corporation. 
REM All Rights Reserved. 
REM TERADATA CONFIDENTIAL AND TRADE SECRET 


echo %DATE:~4,10%  %TIME%
echo Calling custom_execute_incr_gendb.bat

call .\custom_execute_incr_gendb.bat > ..\log\incr_custom_gendb.log 2>&1
