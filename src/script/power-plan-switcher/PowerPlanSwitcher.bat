@echo off

:: Check if the script is being run as an administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Running as administrator...
    goto :UACPrompt
) else (
    goto :Admin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:Admin
setlocal

set IS_INVALID_POWER_PLAN="Invalid power plan GUID. Exiting..."
set INSTALL_SUCCESSFUL="Power plan installed successfully!"

:Menu
cls
echo Available Power Plans:
echo 1. Balanced
echo 2. High Performance
echo 3. Power Saver
echo 4. Ultimate Performance

set /p choice=Enter the number of the desired power plan: 

if %choice% equ 1 (
    call :SetPowerPlan a1841308-3541-4fab-bc81-f71556f20b4a "Power Saver"
) else if %choice% equ 2 (
    call :SetPowerPlan 381b4222-f694-41f0-9685-ff5bb260df2e "Balanced"
) else if %choice% equ 3 (
    call :SetPowerPlan 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c "High Performance"
) else if %choice% equ 4 (
    call :SetPowerPlan e9a42b02-d5df-448d-aa00-03f14749eb61 "Ultimate Performance"
) else (
    echo Invalid choice. Exiting...
    exit /b
)

echo %INSTALL_SUCCESSFUL%
timeout /t 2 >nul
goto Menu

:SetPowerPlan
set "GUID=%~1"
set "PlanName=%~2"

powercfg /getactivescheme | findstr /C:"%GUID%" >nul
if %errorlevel% equ 0 (
    echo The "%PlanName%" power plan is already active.
    timeout /t 2 >nul
    goto :eof
)

powercfg /list | findstr /C:"%GUID%" >nul
if %errorlevel% neq 0 (
    echo.
    echo %IS_INVALID_POWER_PLAN%
    timeout /t 2 >nul
    goto :eof
)

powercfg /setactive %GUID%
goto :eof
