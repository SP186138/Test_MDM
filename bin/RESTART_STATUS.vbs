ETLDB = WScript.Arguments.Named.Item("c")

strFileName = WScript.Arguments.Named.Item("d")

LOGONFILE = WScript.Arguments.Named.Item("e")

MST_DB = WScript.Arguments.Named.Item("f")

MASTER_DB = WScript.Arguments.Named.Item("g")

LOAD_ID = WScript.Arguments.Named.Item("h")

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName&"TMPL", 1)

strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, "$ETL_DB", ETLDB)
strNewTxt = Replace(strNewText, "$DATABASENAME", MST_DB)
strNewTx = Replace(strNewTxt, "$MASTERDB", MASTER_DB)
strNewT = Replace(strNewTx, "$LOADID", LOAD_ID)
strFinal = Replace(strNewT, "$LOGON_FILE", LOGONFILE)
Set objFile = objFSO.OpenTextFile(strFileName, 2)
objFile.WriteLine strFinal
objFile.Close
