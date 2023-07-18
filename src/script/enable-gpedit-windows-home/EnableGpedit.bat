@echo off
pushd "%~dp0"

REM Verify if the script is running as administrator
>nul 2>&1 "%SYSTEMROOT%\System32\cacls.exe" "%SYSTEMROOT%\System32\config\system" && (
    goto :runScript
) || (
    echo Erro: Este script requer privilégios de administrador.
    echo Por favor, execute-o como administrador.
    pause
    exit
)

:runScript
REM Enable Gpedit for Windows 10 Home
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum > nul
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum > nul

for /f %%i in ('findstr /i . nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
pause
