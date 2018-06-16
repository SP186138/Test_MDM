TSSCLEANSEINPUT = WScript.Arguments.Named.Item("c")

strFileName = WScript.Arguments.Named.Item("d")

DBNAME = WScript.Arguments.Named.Item("e")

CNTRY = WScript.Arguments.Named.Item("f")

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName&"TMPL", 1)

strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, "$TSS_CLEANSE_INPUT", TSSCLEANSEINPUT)
strNewTxt = Replace(strNewText, "$MASTER_DB", DBNAME)
strNewTx = Replace(strNewTxt, "$CNTRY", CNTRY)
Set objFile = objFSO.OpenTextFile(strFileName&CNTRY, 2)
objFile.WriteLine strNewTx
objFile.Close
