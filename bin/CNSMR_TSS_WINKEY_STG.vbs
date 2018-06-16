TSSWINKEYOUTPUT = WScript.Arguments.Named.Item("c")

strFileName = WScript.Arguments.Named.Item("d")

LOGONFILE = WScript.Arguments.Named.Item("e")

DBNAME = WScript.Arguments.Named.Item("f")

MSTDB = WScript.Arguments.Named.Item("g")

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName&"TMPL", 1)

strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, "$TSS_WINKEY_OUTPUT", TSSWINKEYOUTPUT)
strNewTxt = Replace(strNewText, "$DATABASENAME", DBNAME)
strNewTx = Replace(strNewTxt, "$MST_DB", MSTDB)
strFinal = Replace(strNewTx, "$LOGON_FILE", LOGONFILE)
Set objFile = objFSO.OpenTextFile(strFileName, 2)
objFile.WriteLine strFinal
objFile.Close
