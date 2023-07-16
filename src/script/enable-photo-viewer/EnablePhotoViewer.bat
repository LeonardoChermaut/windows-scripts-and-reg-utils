@echo off
setlocal EnableDelayedExpansion

REM Check if running as administrator
whoami /groups | find "S-1-5-32-544" >nul 2>&1
if %errorlevel% neq 0 (
    echo powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /B
)

REM Define file variables and extensions to be associated with Windows Photo Viewer
set PHOTO_VIEWER=PhotoViewer.FileAssoc.Tiff
set WPV_ENABLED="Windows Photo Viewer has been enabled."
set "extensions=.bmp .dib .gif .jfif .jpe .jpeg .jpg .jxr .png"
set HKEY_LOCAL_MACHINE="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"

REM Enable Windows Photo Viewer in Windows 10 Registry
echo Enabling Windows Photo Viewer...
reg add %HKEY_LOCAL_MACHINE% /f /t REG_SZ /d %PHOTO_VIEWER% >nul

REM Set Windows Photo Viewer as the default app for desired extensions
for %%x in (%extensions%) do (
    echo Setting default app association for %%x...
    assoc %%x=PHOTO_VIEWER
    reg add %HKEY_LOCAL_MACHINE% /f /v "%%x" /t REG_SZ /d %PHOTO_VIEWER% >nul
)

REM Display message for enabling Windows Photo Viewer
echo WPV_ENABLED

REM Pause for message visibility
pause
