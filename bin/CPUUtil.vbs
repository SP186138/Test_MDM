'THIS ONE GETS CPU Processor USAGE (%) 

PCT = WScript.Arguments.Named.Item("c")

strComputer = "." 
        Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
        Set colItems = objWMIService.ExecQuery("SELECT * FROM Win32_PerfFormattedData_PerfOS_Processor WHERE Name = '_Total'") 
For Each objItem In colItems 
WScript.Echo "CPU Processor USAGE (%)" & objItem.PercentProcessorTime
If objItem.PercentProcessorTime = PCT Then WScript.Quit 2
Next 


