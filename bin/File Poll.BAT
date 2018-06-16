@echo off
REM PNG Poll

echo Check for File TSS_CLEANSE_INPUT.DAT

:start

:loop

cscript C:\Teradata\MDM\3.05.02\custom\pngrelease3\bin\filepoll.vbs /c:runproject4.cmd /d:TSS_CLEANSE_INPUT.DAT

goto loop

:end
