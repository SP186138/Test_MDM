TssScripts = "C:\Documents and Settings\SS186037.TD\Desktop\Trillium Deployment\project4\batch\scripts\"
InputFiles = "C:\Documents and Settings\SS186037.TD\Desktop\Trillium Deployment\png\input\"
RouterFiles = "C:\Documents and Settings\SS186037.TD\Desktop\Trillium Deployment\project4\batch\data\"
OutputFiles = "C:\Documents and Settings\SS186037.TD\Desktop\Trillium Deployment\png\output\"

ScriptsRouter = TssScripts & "runproject4.cmd"
Router = InputFiles & "TSS_CLEANSE_INPUT.DAT"
RouterDone = InputFiles & "TSS_CLEANSE_INPUT_DONE.DAT"
CleanserInputInd = RouterFiles & "e206_globrtr_p2_in.dat"
CleanserInputJap = RouterFiles & "e206_globrtr_p2_jp.dat"
CleanserInputDone = RouterFiles & "e206_globrtr_p2_done.dat"
ScriptsCleanserInputInd = TssScripts & "runproject10.cmd"
ScriptsCleanserInputJap = TssScripts & "runproject11.cmd"
CleanserOutputInd = OutputFiles & "e272_in_tranfrmr_p6.prn"
CleanserOutputJap = OutputFiles & "exxx_jp_tranfrmr_p6.prn"
CleanserOutputIndDone = OutputFiles & "e272_in_tranfrmr_p6_done.prn"
CleanserOutputJapDone = OutputFiles & "exxx_jp_tranfrmr_p6_done.prn"
ScriptsCleanserOutputInd = TssScripts & "CNSMR_TSS_WINKEY_STG.BAT"
ScriptsCleanserOutputJap = TssScripts & "CNSMR_TSS_WINKEY_STG.BAT"

MatcherInputInd = RouterFiles & "e271_in_tranfrmr_p5.dat"
MatcherInputJap = RouterFiles & "e271_jp_tranfrmr_p5.dat"
MatcherInputInd1 = RouterFiles & "TSS_MATCH_INPUT_CRM.DAT"
MatcherInputJap1 = RouterFiles & "TSS_MATCH_INPUT_CRM.DAT"
MatcherInputIndDone = RouterFiles & "e271_in_tranfrmr_p5_done.dat"
MatcherInputJapDone = RouterFiles & "e271_jp_tranfrmr_p5_done.dat"
ScriptsMatcherInputInd = TssScripts & "runproject29.cmd"
ScriptsMatcherInputJap = TssScripts & "runproject16.cmd"
MatcherOutputInd = OutputFiles & "e737_in_tranfrmr_p23.prn"
MatcherOutputJap = OutputFiles & "exxx_jp_tranfrmr_p23.prn"
MatcherOutputInd1 = OutputFiles & "e404_in_tranfrmr_p22.prn"
MatcherOutputJap1 = OutputFiles & "exxx_jp_tranfrmr_p22.prn"
MatcherOutputIndDone = OutputFiles & "e737_in_tranfrmr_p23_done.prn"
MatcherOutputJapDone = OutputFiles & "exxx_in_tranfrmr_p23_done.prn"
ScriptsMatcherOutputInd = TssScripts & "TSS_MATCH_STG.BAT"
ScriptsMatcherOutputJap = TssScripts & "TSS_MATCH_STG.BAT"

Set oShell = CreateObject("WScript.Shell")
Set oFSO = CreateObject("Scripting.FileSystemObject")

If Not oFSO.FileExists(Scripts) Then
    WScript.Echo "Could not find batch file, quitting!"
    WScript.Quit
End If

' just in case there is spaces in the path
sBatFileShort = oFSO.GetFile(Scripts).ShortPath

' Run the batch file hidden, and let the VBScript wait for
' the batch file to finish

Set objFS1 = CreateObject("Scripting.FileSystemObject")
Set objFS1A = CreateObject("Scripting.FileSystemObject")
If objFS1.FileExists(Router) And objFS1A.FileExists(RouterDone) Then
 oShell.Run """" & ScriptsRouter & """", 0, True
 WScript.Sleep(1000)
End If

Set objFS2 = CreateObject("Scripting.FileSystemObject")
Set objFS2A = CreateObject("Scripting.FileSystemObject")
If objFS2.FileExists(CleanserInputInd) And objFS2A.FileExists(CleanserInputDone) Then
 oShell.Run """" & ScriptsCleanserInputInd & """", 0, True
 WScript.Sleep(1000)
End If

Set objFS3 = CreateObject("Scripting.FileSystemObject")
Set objFS3A = CreateObject("Scripting.FileSystemObject")
If objFS3.FileExists(CleanserInputJap) And objFS3A.FileExists(CleanserInputDone) Then
 oShell.Run """" & ScriptsCleanserInputJap & """", 0, True
 WScript.Sleep(1000)
End If

Set objFS4 = CreateObject("Scripting.FileSystemObject")
Set objFS4A = CreateObject("Scripting.FileSystemObject")
If objFS4.FileExists(CleanserOutputInd) And objFS4A.FileExists(CleanserOutputIndDone) Then
 oShell.Run """" & ScriptsCleanserOutputInd & """", 0, True
 WScript.Sleep(1000)
End If

Set objFS5 = CreateObject("Scripting.FileSystemObject")
Set objFS5A = CreateObject("Scripting.FileSystemObject")
If objFS5.FileExists(CleanserOutputJap) And objFS5A.FileExists(CleanserOutputJapDone) Then
 oShell.Run """" & ScriptsCleanserOutputJap & """", 0, True
 WScript.Sleep(1000)
End If

Set objFS6 = CreateObject("Scripting.FileSystemObject")
Set objFS6A = CreateObject("Scripting.FileSystemObject")
Set objFS6B = CreateObject("Scripting.FileSystemObject")
If objFS6.FileExists(MatcherInputInd) And objFS6A.FileExists(MatcherInputIndDone) And objFS6B.FileExists(MatcherInputInd1) Then
 oShell.Run """" & ScriptsMatcherInputInd & """", 0, True
 WScript.Sleep(1000)
End If

Set objFS7 = CreateObject("Scripting.FileSystemObject")
Set objFS7A = CreateObject("Scripting.FileSystemObject")
If objFS7.FileExists(MatcherInputJap) And objFS7A.FileExists(MatcherInputJapDone) And objFS7B.FileExists(MatcherInputJap1) Then
 oShell.Run """" & ScriptsMatcherInputJap & """", 0, True
 WScript.Sleep(1000)
End If

Set objFS8 = CreateObject("Scripting.FileSystemObject")
Set objFS8A = CreateObject("Scripting.FileSystemObject")
Set objFS8B = CreateObject("Scripting.FileSystemObject")
If objFS8.FileExists(MatcherOutputInd) And objFS8A.FileExists(MatcherOutputIndDone) And objFS8B.FileExists(MatcherOutputInd1) Then
 oShell.Run """" & ScriptsMatcherOutputInd & """", 0, True
 WScript.Sleep(1000)
End If

Set objFS9 = CreateObject("Scripting.FileSystemObject")
Set objFS9A = CreateObject("Scripting.FileSystemObject")
If objFS9.FileExists(MatcherOutputJap) And objFS9A.FileExists(MatcherOutputJapDone) And objFS9B.FileExists(MatcherOutputJap1) Then
 oShell.Run """" & ScriptsMatcherOutputJap & """", 0, True
 WScript.Sleep(1000)
End If



