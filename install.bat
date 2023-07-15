@echo off

powershell -command "$Host.UI.RawUI.ForegroundColor = 'White'"

:menu
cls
powershell -command "$Host.UI.RawUI.ForegroundColor = 'Blue'"
echo Welcome to the Age of Mythology Essentials Modpack Wizard!
powershell -command "$Host.UI.RawUI.ForegroundColor = 'White'"
echo ==========================================================
echo.
powershell -command "$Host.UI.RawUI.ForegroundColor = 'Red'"
echo DISCLAIMER: Please make a backup of your Age of Mythology installation directory before proceeding, as the mod's script won't be able to rollback changes.
powershell -command "$Host.UI.RawUI.ForegroundColor = 'White'"
echo.
echo [1] Install Modpack
echo [2] Quit
echo.

choice /c 12 /n /m "Please select an option:"

if errorlevel 2 goto :quit
if errorlevel 1 goto :askdrive

:askdrive
set /p driveLetter=Enter the drive letter where Age of Mythology is installed (e.g., C, D, E): 
set "gameDir=%driveLetter%:\Program Files (x86)\Microsoft Games\Age of Mythology"

if exist "%gameDir%" (
    echo [INFO] Installation has begun.
    set "appRoot=%~dp0"
    xcopy "%appRoot%" "%gameDir%" /E /Y

    powershell -command "$Host.UI.RawUI.ForegroundColor = 'Blue'"
    echo [INFO] Please open a random map game, and once you load into it, quit.
    powershell -command "$Host.UI.RawUI.ForegroundColor = 'White'"
    set "programPath=%gameDir%\aomx.exe"
    set "message=Configuring your User Profile..."
    start "" "%programPath%"

    :waitloop
    timeout /t 1 /nobreak >nul 2>&1
    tasklist | find /i "aomx.exe" >nul 2>&1
    if errorlevel 1 (
        echo %message%
        set "sourceConfigDir=%CD%\documents"
        set "destinationConfigDir=%USERPROFILE%\Documents"
        xcopy "%sourceConfigDir%" "%destinationConfigDir%" /E /Y
        powershell -command "$Host.UI.RawUI.ForegroundColor = 'Green'"
        echo [SUCCESS] Modpack has been installed successfully! You should be able to play the game now.
        powershell -command "$Host.UI.RawUI.ForegroundColor = 'White'"
        pause
        goto :menu
    )
    goto waitloop
) else (
    powershell -command "$Host.UI.RawUI.ForegroundColor = 'Red'"
    echo [ERROR] Age of Mythology not found in the specified drive!
    powershell -command "$Host.UI.RawUI.ForegroundColor = 'White'"
    pause
    goto :menu
)

:quit
echo [INFO] Press any key to exit.
pause
exit
