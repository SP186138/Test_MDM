TSSCLEANSEINPUT = WScript.Arguments.Named.Item("c")

strFileName = WScript.Arguments.Named.Item("d")

DBNAME = WScript.Arguments.Named.Item("e")

CNTRYNAME = WScript.Arguments.Named.Item("f")

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName&"TMPL", 1)

strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, "$TSS_CLEANSE_INPUT", TSSCLEANSEINPUT)
strNewTxt = Replace(strNewText, "$MASTER_DB", DBNAME)
strNeTxt = Replace(strNewTxt, "$CNTRY_CODE", CNTRYNAME)
Set objFile = objFSO.OpenTextFile(strFileName, 2)
objFile.WriteLine strNeTxt
objFile.Close
