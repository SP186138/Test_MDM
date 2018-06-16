@echo off

schtasks /query /fo list /tn "CheckMDMstatus" | find /c "Running"&&(
REM code to run if CheckMDMstatus task is still running i.e MDM iS dowm
ECHO Stopping the tomcat service
net stop "Tomcat6"
)||(
REM code to run if successful
REM No action required as MDM is up
ECHO COMPLETED
)

