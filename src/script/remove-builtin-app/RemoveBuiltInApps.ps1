# Executar como administrador
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force

$appsToKeep = @(
    "Microsoft.WindowsStore",
    "Microsoft.WindowsCalculator",
    "Microsoft.MicrosoftEdge"
)

Get-AppxPackage -AllUsers |
Where-Object { $appsToKeep -notcontains $_.Name } |
Remove-AppxPackage
