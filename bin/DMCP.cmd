set RESOURCE_URL=%1
set ENDPOINT=%2
set EMAIL_Id=%3

"C:\Program Files\cURL\bin\curl" --header "authorization: Basic MWNwQGFwaS5jb206MG4zQ3BBUCF0ZFVT" --header "accept: application/json" --header "accept-encoding: gzip, deflate" --header "accept-language: en-US,en;q=0.8" --header "content-type: application/json" -X "DELETE" %ENDPOINT%%RESOURCE_URL%?mobileNumber=%EMAIL_Id% > E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\DMCP.log
for %%A in (E:\Teradata\MDM\3.05.02\custom\pngrelease3\log\DMCP.log) do if NOT %%~zA==0 exit /b 1

