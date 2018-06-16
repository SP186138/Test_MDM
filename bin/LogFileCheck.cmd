@echo off

setlocal enabledelayedexpansion
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
@echo off
  
  for /f "tokens=*" %%a in (
   'cscript.exe //nologo E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\today.vbs'
   ) do (set enddate=%%a)
   
  for /f "tokens=*" %%a in (
   'cscript.exe //nologo E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\yesterday.vbs'
   ) do (set startdate=%%a)   
  
del /f E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\LogFileOutput.txt
del /f E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\LogFilePattern.txt
for /F "tokens=1,2,3 delims=," %%a in (E:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\LogFileConfiguration.txt) do (call :logcheck %%a %%b %%c)

for /F "tokens=1,2 delims=," %%G in (E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\LogFilePattern.txt) do (
	call filedate.bat %%G > E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\LogFileDate.txt
	for /F "skip=1 tokens=1 delims=CreationDate=" %%A in (E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\LogFileDate.txt) do (
		if %%~zG LSS %%H (		
		if "%%A" GEQ "%startdate%" (
		if "%%A" LEQ "%enddate%" echo %%G %%A %startdate% %enddate% %%~zG %%H >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\LogFileOutput.txt
		)
		)
	)	
)

copy /b E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\LogFileOutput.txt E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\LogFileOutput_%currentdate%_%currenttime%.txt

for /R "E:\Teradata\MDM\3.05.02\custom\pngrelease3\log" %%F in (LogFileOutput.txt) do (
    if exist "%%F" if %%~zF GTR 0 call pngMDM_LogFileCheck.bat
)

REM exit /b %ERRORLEVEL%
:: a function to check file size less than specified value 
:logcheck
set "SEARCH_DIR=%~1"
set "FILE_SIZE=%~3"
set "FILE_NAME=%~2"

echo "%FILE_SIZE%" | findstr "\"[0-9][0-9]*\"" > NUL
if errorlevel 1 (
    echo Usage: %~nx0 directory file_size_in_bytes
    exit /b 1
)

if not exist "%SEARCH_DIR%" (
    echo "%SEARCH_DIR%" does not exist.
    exit /b 1
)

for /R "%SEARCH_DIR%" %%F in (%FILE_NAME%*) do (
echo %%F,%FILE_SIZE% >> E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\LogFilePattern.txt
)

exit /b 0