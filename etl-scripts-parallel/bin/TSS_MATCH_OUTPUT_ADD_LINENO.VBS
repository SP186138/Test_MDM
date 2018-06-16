' Begin code for Create Line-Numbered List.vbs
' Downloaded from the Scripting Guide for Windows
' http://www.pctools.com/guides/scripting/
' Version: 1.2 (January 4, 2001)

' Windows Script Host - VBScript 
'---------------------------------------------
' Name: Create Line-Numbered List 
' By: Harvey Colwell 
' Version: 1.2 
' CopyRight: (c) Oct 2000, All Rights Reserved! 
' Freeware: No Warrantees or Guarantees 
' *********************************************
Option Explicit 

Dim oWS, oFS 

Set oWS = WScript.CreateObject("WScript.Shell") 
Set oFS = WScript.CreateObject("Scripting.FileSystemObject") 

'---------- 
' Script Setup 
'---------- 
Dim oInStream, oOutStream, sInFile, sOutFile, nTotalLines, sArg 

'---------- 
' Process File(s) 
'---------- 
If Wscript.Arguments.Count = 0 Then 
If InStr(LCase(WScript.FullName), "cscript.exe") <> 0 Then 
sInFile = "StdIn" 
sOutFile = "StdOut" 
Set oInStream = WScript.StdIn 
Set oOutStream = WScript.StdOut 
Call ProcessFile() 
Else 
Call HelpMsg() 
End If 
Else 
For sArg = 0 To Wscript.Arguments.Count -1 
sInFile = Wscript.Arguments(sArg) 
If IsFile(sInFile) Then 
sOutFile = Left(sInFile, InStrRev(sInFile, ".") - 1) & ".lst" 
Set oOutStream = oFS.OpenTextFile(sOutFile, 2, True, 0) 
Set oInStream = oFS.OpenTextFile(sInFile, 1) 
Call ProcessFile() 
Else 
Wscript.Echo "File Not Found: " & sInFile, , "Error" 
End If 
Next 
End If 

Call CleanUp(0) 

'--------------------- 
' Subroutines 
' ********************

'--------------------- 
Sub CleanUp(exitCode) 
Set oInStream = Nothing 
Set oOutStream = Nothing 
Set oWS = Nothing 
Set oWS = Nothing 
WScript.Quit(exitCode) 
End Sub 

'--------------------- 
Sub ProcessFile() 
nTotalLines = AddLineNum() 
End Sub 

'--------------------- 
Sub HelpMsg() 
MsgBox "To Use as a filter. . ." & vbCrlf & vbCrlf & _ 
" cscript ""Create Line-Numbered List.vbs"" < InFile > OutFile" & vbCrlf & _ 
" any_console_command | cscript ""Create Line-Numbered List.vbs"" > OutFile" & vbCrlf & _ 
" cscript ""Create Line-Numbered List.vbs"" > OutFile" & vbCrlf & vbCrlf & _ 
" In the third example, output from the keyboard will saved to the specified" & vbCrlf & _ 
" OutFile! Use terminate (close) redirection." & vbCrlf & vbCrlf & _ 
"To process one or more files. . ." & vbCrlf & vbCrlf & _ 
" wscript ""Create Line-Numbered List.vbs"" filename1 [filename2...]" & vbCrlf & vbCrlf & _ 
" Each file will have a line-numbered copy if itself created with the same" & vbCrlf & _ 
" filename and a LST extension. No wildcards are allowed in the filenames." & vbCrlf & vbCrlf & _ 
"As a ""Send To"" Item (My Favorite!). . ." & vbCrlf & vbCrlf & _ 
" Create a shortcut to this script in the SendTo folder, usually" & vbCrlf & _ 
" C:\Windows\SendTo.", , "Instructions" 
Call CleanUp(1) 
End Sub 

'--------------------- 
' Functions 
' ********************

'--------------------- 
Function AddLineNum() 
Dim nLine, sLine, nCount 
nCount = 0 
Do Until oInStream.AtEndOfStream 
nLine = oInStream.Line 
sLine = oInStream.ReadLine 
oOutStream.WriteLine Pad(nLine, 15, 0) & "|" & sLine 
nCount = nCount + 1 
Loop 
AddLineNum = nCount 
End Function 

'--------------------- 
Function Pad(Value, Width, Char) 
Pad = Right(String(Width, CStr(Char)) & CStr(Value), Width) 
End Function 

'--------------------- 
Function IsFile (fName) 
If oFS.FileExists(fName) Then IsFile = True Else IsFile = False 
End Function 

' ********************

' End code