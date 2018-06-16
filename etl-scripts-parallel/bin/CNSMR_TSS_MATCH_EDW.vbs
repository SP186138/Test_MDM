TSSMATCHOUTPUT = WScript.Arguments.Named.Item("c")

strFileName = WScript.Arguments.Named.Item("d")

LOGONFILE = WScript.Arguments.Named.Item("e")

DBNAME = WScript.Arguments.Named.Item("f")

MSTDB = WScript.Arguments.Named.Item("g")

CNTRY = WScript.Arguments.Named.Item("h")

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName&"TMPL", 1)

strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, "$TSS_MATCH_OUTPUT", TSSMATCHOUTPUT)
strNewTxt = Replace(strNewText, "$DATABASENAME", DBNAME)
strNewTx = Replace(strNewTxt, "$MST_DB", MSTDB)
strFinal = Replace(strNewTx, "$LOGON_FILE", LOGONFILE)
strFinal1 = Replace(strFinal, "$CNTRY", CNTRY)
Set objFile = objFSO.OpenTextFile(strFileName, 2)
objFile.WriteLine strFinal1
objFile.Close
