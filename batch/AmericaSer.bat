
echo Setting Env 
cd ..\bin
@call .\bcmenv.bat
set CLASSPATH=..\batch;%CLASSPATH%
rem echo %CLASSPATH%

set PAUSE_FLAG=%1
if "%PAUSE_FLAG%"=="" goto :start
if not "%PAUSE_FLAG%"=="pause" goto :error

:start



echo "Starting Americas Service"

java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml Trillium_Europe AmericasService.xml
%PAUSE_FLAG%

pause
:error
