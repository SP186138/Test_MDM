strFileName1 = WScript.Arguments.Named.Item("c")
strFileName2 = WScript.Arguments.Named.Item("d")
strFileName3 = WScript.Arguments.Named.Item("e")

Const ForReading = 1, ForWriting = 2
Dim fso, txtFile, txtFile2, strLine1, strLine2, strMatch, arrFields, arrName
Set fso = CreateObject("Scripting.FileSystemObject")
Set txtFile1 = fso.OpenTextFile(strFileName1, ForReading)
Set f = fso.OpenTextFile(strFileName3, ForWriting, True)

Do Until txtFile1.AtEndOfStream
    On Error Resume Next
    strLine1 = txtFile1.Readline
    Set txtFile2 = fso.OpenTextFile(strFileName2, ForReading)
        Do Until txtFile2.AtEndOfStream
            On Error Resume Next
            strLine2 = txtFile2.Readline
            arrFields = Split(strLine2, "|")
            arrName = arrFields(0)
                If Trim(UCase(arrName)) = Trim(UCase(strLine1)) Then
                    f.writeline strLine2
                End If
        Loop
        txtFile2.Close
Loop
f.Close
txtFile1.Close
