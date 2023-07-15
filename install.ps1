$host.UI.RawUI.ForegroundColor = 'White'

function Install-Modpack {
    Clear-Host
    $host.UI.RawUI.ForegroundColor = 'Blue'
    Write-Host "Welcome to the Age of Mythology Essentials Modpack Wizard!"
    $host.UI.RawUI.ForegroundColor = 'White'
    Write-Host "=========================================================="
    Write-Host ""
    $host.UI.RawUI.ForegroundColor = 'Red'
    Write-Host "DISCLAIMER: Please make a backup of your Age of Mythology installation directory before proceeding, as the mod's script won't be able to rollback changes."
    $host.UI.RawUI.ForegroundColor = 'White'
    Write-Host ""
    Write-Host "[1] Install Modpack"
    Write-Host "[2] Quit"
    Write-Host ""
    
    $choice = Read-Host "Please select an option:"
    
    switch ($choice) {
        1 { Install-ModpackAction }
        2 { Quit }
        Default { Install-Modpack }
    }
}

function Install-ModpackAction {
    Clear-Host
    $host.UI.RawUI.ForegroundColor = 'White'
    $driveLetter = Read-Host "Enter the drive letter where Age of Mythology is installed (e.g., C, D, E): "
    $gameDir = "${driveLetter}:\Program Files (x86)\Microsoft Games\Age of Mythology"

    if (Test-Path $gameDir) {
        Write-Host "[INFO] Installation has begun."
        $appRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
        Copy-Item $appRoot\* $gameDir -Recurse -Force

        $programPath = Join-Path $gameDir "aomx.exe"
        $message = "Configuring your User Profile..."
        Start-Process -FilePath $programPath
        
        do {
            Start-Sleep -Milliseconds 1000
        } while (Get-Process -Name "aomx" -ErrorAction SilentlyContinue)

        $sourceConfigDir = Join-Path $PWD.Path "documents"
        $destinationConfigDir = [Environment]::GetFolderPath("MyDocuments")
        Copy-Item $sourceConfigDir\* $destinationConfigDir -Recurse -Force

        $host.UI.RawUI.ForegroundColor = 'Green'
        Write-Host "[SUCCESS] Modpack has been installed successfully! You should be able to play the game now."
        $host.UI.RawUI.ForegroundColor = 'White'
        Pause
        Install-Modpack
    }
    else {
        $host.UI.RawUI.ForegroundColor = 'Red'
        Write-Host "[ERROR] Age of Mythology not found in the specified drive!"
        $host.UI.RawUI.ForegroundColor = 'White'
        Pause
        Install-Modpack
    }
}

function Quit {
    Write-Host "[INFO] Press any key to exit."
    Pause
    Exit
}

Install-Modpack
