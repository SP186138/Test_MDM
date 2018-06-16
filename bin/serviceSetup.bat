cd /D "E:\Teradata\MDM\3.05.02\bin"
@echo off
REM Copyright (c) 2006-2016 by Teradata Corporation. 
REM All Rights Reserved. 
REM Teradata CONFIDENTIAL AND TRADE SECRET 


call .\bcmenv.bat
set CLASSPATH=.;%CLASSPATH%

echo %DATE:~4,10%  %TIME%
echo performing Service Setup
%JAVA_HOME%\bin\java %JAVA_OPTIONS% com.teradata.mcore.mdmSpecGen.MdmSpecGen ./mdm-spec-gen.xml ../../../bin/tddb.keywords ./tddb.keywords
