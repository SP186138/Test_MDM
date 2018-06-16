set file="E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\checkMDMStatus.log"
set minfilesize= 0
set maxfilesize= 82

FOR %%A IN (%file%) DO set size=%%~zA
cd /d E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin
REM Call BCM Environment
call bcmenv.bat
if %size% == %minfilesize% ( %JAVA_HOME%\bin\java  com.teradata.xcore.util.SocketPoller localhost xserver.xml > E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\checkMDMStatus.log )	 

	REM –Checking whether MDM Server is running
	%JAVA_HOME%\bin\java  com.teradata.xcore.util.SocketPoller localhost xserver.xml > E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\checkMDMStatus.log
	FOR %%A IN (%file%) DO set newsize=%%~zA
	if %newsize% == %maxfilesize% ( 	echo.MDM IS UP ) 
	if %newsize% gtr %maxfilesize% ( net stop "Tomcat6" )

	REM –Checking whether MDM Locator is running
set file1="E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\checkLocatorStatus.log"

FOR %%A IN (%file1%) DO set size1=%%~zA
cd /d E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin
REM Call BCM Environment
call bcmenv.bat
if %size1% == %minfilesize% ( netstat -aon | find ":14000" | find "LISTENING" > E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\checkLocatorStatus.log )	 

	REM –Checking whether MDM Locator is running
	netstat -aon | find ":14000" | find "LISTENING" > E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\checkLocatorStatus.log
	FOR %%A IN (%file1%) DO set newsize1=%%~zA
	if %newsize1% gtr %minfilesize% ( 	echo.Locator IS UP ) 
	if %newsize1% == %minfilesize% ( net stop "Tomcat6" )
