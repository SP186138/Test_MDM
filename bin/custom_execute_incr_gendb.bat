@echo off
REM Copyright (c) 2006-2016 by Teradata Corporation. 
REM All Rights Reserved. 
REM Teradata CONFIDENTIAL AND TRADE SECRET 

echo %DATE:~4,10%  %TIME%
echo Setting up Incr Database Schema and Data

:start

call .\bcmenv.bat
set CLASSPATH=.;%CLASSPATH%

echo %DATE:~4,10%  %TIME%
echo performing Service Setup
%JAVA_HOME%\bin\java %JAVA_OPTIONS% com.teradata.mcore.mdmSpecGen.MdmSpecGen ./mdm-spec-gen.xml ../../../bin/tddb.keywords


echo %DATE:~4,10%  %TIME%
echo Generating Schema
%JAVA_HOME%\bin\java %JAVA_OPTIONS% com.teradata.xcore.util.SchemaGenHelper custom_SchemaGen_Incr_MetaInfo.xml 


:end
