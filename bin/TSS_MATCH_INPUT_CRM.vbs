TSSMATCHINPUT = WScript.Arguments.Named.Item("c")

strFileName = WScript.Arguments.Named.Item("d")

DBNAME = WScript.Arguments.Named.Item("e")

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName&"TMPL", 1)

strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, "$TSS_MATCH_INPUT", TSSMATCHINPUT)
strNewTxt = Replace(strNewText, "$MASTER_DB", DBNAME)
Set objFile = objFSO.OpenTextFile(strFileName, 2)
objFile.WriteLine strNewTxt
objFile.Close
