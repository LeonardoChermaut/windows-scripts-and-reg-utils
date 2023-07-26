@echo off
setlocal EnableDelayedExpansion

whoami /groups | find "S-1-5-32-544" >nul 2>&1
if %errorlevel% neq 0 (
    echo powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /B
)

set PHOTO_VIEWER=PhotoViewer.FileAssoc.Tiff
set WPV_ENABLED="Windows Photo Viewer has been enabled."
set "extensions=.bmp .dib .gif .jfif .jpe .jpeg .jpg .jxr .png"
set HKEY_LOCAL_MACHINE="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"

echo Enabling Windows Photo Viewer...
reg add %HKEY_LOCAL_MACHINE% /f /t REG_SZ /d %PHOTO_VIEWER% >nul

for %%x in (%extensions%) do (
    echo Setting default app association for %%x...
    assoc %%x=PHOTO_VIEWER
    reg add %HKEY_LOCAL_MACHINE% /f /v "%%x" /t REG_SZ /d %PHOTO_VIEWER% >nul
)

echo WPV_ENABLED

pause
