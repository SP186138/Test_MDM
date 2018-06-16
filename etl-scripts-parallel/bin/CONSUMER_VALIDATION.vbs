ETLDB = WScript.Arguments.Named.Item("c")

strFileName = WScript.Arguments.Named.Item("d")

LOGONFILE = WScript.Arguments.Named.Item("e")

MST_DB = WScript.Arguments.Named.Item("f")

MASTER_DB = WScript.Arguments.Named.Item("g")

DB_NAME = WScript.Arguments.Named.Item("h")

EMAIL = WScript.Arguments.Named.Item("i")

POSTL = WScript.Arguments.Named.Item("j")

PHONE = WScript.Arguments.Named.Item("k")

SOCIAL = WScript.Arguments.Named.Item("l")

BATCH = WScript.Arguments.Named.Item("m")

LOAD = WScript.Arguments.Named.Item("n")

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName&"TMPL", 1)

strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, "$ETL_DB", ETLDB)
strNewTxt = Replace(strNewText, "$DATABASENAME", MST_DB)
strNewTx = Replace(strNewTxt, "$MASTERDB", MASTER_DB)
strNewT = Replace(strNewTx, "$DBNAME", DB_NAME)
strNew = Replace(strNewT, "$EMAIL", EMAIL)
strNe = Replace(strNew, "$POSTL", POSTL)
strNe = Replace(strNe, "$PHONE", PHONE)
strNe = Replace(strNe, "$SOCIAL", SOCIAL)
strNe = Replace(strNe, "$BTCH", BATCH)
strNe = Replace(strNe, "$LOAD", LOAD)
strFinal = Replace(strNe, "$LOGON_FILE", LOGONFILE)
Set objFile = objFSO.OpenTextFile(strFileName, 2)
objFile.WriteLine strFinal
objFile.Close
