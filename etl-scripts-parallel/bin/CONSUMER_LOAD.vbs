ETLDB = WScript.Arguments.Named.Item("c")

strFileName = WScript.Arguments.Named.Item("d")

LOGONFILE = WScript.Arguments.Named.Item("e")

MST_DB = WScript.Arguments.Named.Item("f")

MASTER_DB = WScript.Arguments.Named.Item("g")

DB_NAME = WScript.Arguments.Named.Item("h")

CNTRY = WScript.Arguments.Named.Item("i")

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName&"TMPL", 1)

strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, "$ETL_DB", ETLDB)
strNewTxt = Replace(strNewText, "$DATABASENAME", MST_DB)
strNewTx = Replace(strNewTxt, "$MASTERDB", MASTER_DB)
strNewT = Replace(strNewTx, "$DBNAME", DB_NAME)
strNe = Replace(strNewT, "$CNTRY", CNTRY)
strFinal = Replace(strNe, "$LOGON_FILE", LOGONFILE)
Set objFile = objFSO.OpenTextFile(strFileName&CNTRY, 2)
objFile.WriteLine strFinal
objFile.Close
