REM Copyright (c) 2006-2016 by Teradata Corporation. 
REM All Rights Reserved. 
REM Teradata CONFIDENTIAL AND TRADE SECRET 

@call .\bcmenv.bat
%JAVA_HOME%\bin\java com.teradata.bcm.xcore.util.PosterUtil xserver localhost xserver.xml shutdown.xml
exit