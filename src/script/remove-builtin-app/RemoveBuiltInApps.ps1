Get-AppxPackage -AllUsers | 
where-object 
{  
    $_.name –notlike "*store*" -and $_.name –notlike "*calc*" -and $_.name –notlike "*windows.photos*" -and $_.name –notlike "*edge*" 
} | Remove-AppxPackage
