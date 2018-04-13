gwmi -q "SELECT * FROM Win32_OperatingSystem" | % {
    [PSCustomObject]@{
        "OS Name" = $_.Name
        "Version" = $_.Version
        "Service Pack" = "$($_.ServicePackMajorVersion).$($_.ServicePackMinorVersion)"
        "OS Manufacturer" = $_.Manufacturer
        "Windows Directory" = $_.WindowsDirectory
        "Locale" = $_.Locale
        "Available Physical Memory" = $_.FreePhysicalMemory
        "Total Virtual Memory" = $_.TotalVirtualMemorySize
        "Available Virtual Memory" = $_.FreeVirtualMemory
        "Disks" = gwmi -q "SELECT * FROM Win32_LogicalDisk" | % {
            [PSCustomObject]@{
                "Drive" = $_.DeviceID
                "DriveType" = $_.Description
                "Size" = $_.Size
                "FreeSpace" = $_.FreeSpace
                "Compressed" = $_.Compressed
            } 
        }
    }
}