 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Martin Sigala
    LinkedIn        : linkedin.com/in/martinsigala/
    GitHub          : github.com/martinsigala32
    Date Created    : 2025-10-07
    Last Modified   : 2025-10-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE

# Define the registry path and value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$maxSizeInBytes = 0x8000  # 32 KB

# Ensure the key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MaxSize value (DWORD)
New-ItemProperty -Path $regPath -Name "MaxSize" -Value $maxSizeInBytes -PropertyType DWord -Force
Write-Output "MaxSize set to $maxSizeInBytes bytes (0x8000) at $regPath"
 
