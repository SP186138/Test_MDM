echo off


@call .\bcmenv.bat


set CLASSPATH=%CLASSPATH%


REM echo "<!--***********Populating Code Master******************-->"

%JAVA_HOME%\bin\java com.teradata.xcore.net.Poster xserver xserver.xml USER_SECURITY UploadUser.xml

pause
