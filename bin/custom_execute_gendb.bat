@echo off
REM Copyright (c) 2006-2016 by Teradata Corporation. 
REM All Rights Reserved. 
REM Teradata CONFIDENTIAL AND TRADE SECRET 


echo %DATE:~4,10%  %TIME%
echo Setting up Database Schema and Data

:start
call .\bcmenv.bat
set CLASSPATH=.;%CLASSPATH%

echo %DATE:~4,10%  %TIME%
echo Adding Db Parameters to Properties Files
for %%i in ( ../../../cfg/properties/xserver.xml  ../../../cfg/properties/xserverweb.xml) do %JAVA_HOME%\bin\java com.teradata.xcore.util.DbpropertyUpdate %%i

echo %DATE:~4,10%  %TIME%
echo performing Service Setup
%JAVA_HOME%\bin\java %JAVA_OPTIONS% com.teradata.mcore.mdmSpecGen.MdmSpecGen ./mdm-spec-gen.xml ../../../bin/tddb.keywords


echo %DATE:~4,10%  %TIME%
echo Generating Schema
%JAVA_HOME%\bin\java %JAVA_OPTIONS% com.teradata.xcore.util.SchemaGenHelper custom_SchemaGen_MetaInfo.xml 



:end
