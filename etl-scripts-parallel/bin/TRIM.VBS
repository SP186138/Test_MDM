strFileName = WScript.Arguments.Named.Item("d")

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFSO1 = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName&"TMPL", 1)
Set objFile1 = objFSO1.OpenTextFile(strFileName, 2)

i = 0
Do While objFile.AtEndOfStream <> True
 strNextLine = objFile.Readline
 strFinal1 = RTrim(strNextLine)
 objFile1.WriteLine strFinal1
 i = i + 1
Loop

objFile.Close
objFile1.Close
