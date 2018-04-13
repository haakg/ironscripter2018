$computer = gwmi Win32_ComputerSystem

gwmi WMIMonitorID -Namespace root\wmi | % {
    [PSCustomObject]@{
        ComputerName = $env:COMPUTERNAME
        ComputerType = $computer.model
        ComputerSerial = $computer.Name
        MonitorSerial = ($_.SerialNumberID -ne 0 | % {[char]$_}) -join ""
        MonitorType = ($_.UserFriendlyName -ne 0 | % {[char]$_}) -join ""
    }
}