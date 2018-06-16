@echo off
REM Copyright (c) 2006-2007 by Teradata Corporation. 
REM All Rights Reserved. 
REM TERADATA CONFIDENTIAL AND TRADE SECRET 

REM Created By Ankita Sadhwani on 16th Jan 2018
REM Execute this file to delete files in the log folder that are more than 180 days old

echo Setting Env 
set CLASSPATH=bin;%CLASSPATH%

:start

forfiles /p "E:\Teradata\MDM\3.05.02\custom\pngrelease3\log" /s /d -180 /c "cmd /c del @file : date >= 180 days >NUL"

if errorlevel 1 exit /b 1

exit /b