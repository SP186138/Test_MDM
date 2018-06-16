strFileName = WScript.Arguments.Named.Item("d")

LOGONFILE = WScript.Arguments.Named.Item("e")

DBNAME = WScript.Arguments.Named.Item("f")

ETLDBNAME = WScript.Arguments.Named.Item("g")

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName&"TMPL", 1)

strText = objFile.ReadAll

strNewTxt = Replace(strText, "$DATABASENAME", DBNAME)
strFinal = Replace(strNewTxt, "$LOGON_FILE", LOGONFILE)
strNewTxe = Replace(strFinal, "$ETLDB", ETLDBNAME)
Set objFile = objFSO.OpenTextFile(strFileName, 2)
objFile.WriteLine strNewTxe
objFile.Close
