# Silent Installer for Unreal Engine 5
# Last Edited by Andy Babin Mar 11 2025
# Updated to 5.4.4

$MAJOR = 4
$MINOR = 4
$SCRIPT_ROOT = Split-Path -Parent $MyInvocation.MyCommand.Definition
$TOOLS_DIR = "$SCRIPT_ROOT\tools\sources"
$INSTALL_DIR_UE5 = "D:\Epic\"

# Define paths
$SOURCE_DIR_UE5 = "$TOOLS_DIR\UE5\5.$MAJOR.$MINOR"
$SOURCE_COMMON = "$TOOLS_DIR\common"
$ZIP_INSTALL_FILES = "UE_5.$MAJOR"
$SHORTCUT_FILE_UE5 = "Unreal Engine 5.$MAJOR.$MINOR.lnk"
$FIREWALL_RULENAME = "UE_5.$MAJOR.$MINOR"
$FIREWALL_PROGPATH = "$INSTALL_DIR_UE5\UE_5.$MAJOR\Engine\Binaries\Win64\UnrealEditor.exe"

# Install DirectX
#Write-Output "INSTALLING DIRECTX"
#Start-Process "$TOOLS_DIR\directx\directx_Jun2010_redist.exe" -ArgumentList "/Q" -NoNewWindow -Wait

# Install NVIDIA Driver
Write-Output "INSTALLING DISPLAY DRIVER"
Start-Process "$TOOLS_DIR\NVIDIA\setup.exe" -ArgumentList "Display.Driver -s -n" -NoNewWindow -Wait

# Install 7zip
#Write-Output "INSTALLING 7zip"
#Start-Process "$TOOLS_DIR\7zip\7z2401-x64.exe" -ArgumentList "/S /D=\"C:\Program Files\7-Zip\"" -NoNewWindow -Wait

# Install VSCode
Write-Output "INSTALLING VSCode"
Start-Process "$TOOLS_DIR\VSCode\VSCodeSetup-x64-1.86.2.exe" -ArgumentList "/VERYSILENT /NORESTART /MERGETASKS=!runcode" -NoNewWindow -Wait


# Install Unreal Engine
Write-Output "INSTALLING UNREAL"
If (!(Test-Path "$INSTALL_DIR_UE5")) { New-Item -ItemType Directory -Path "$INSTALL_DIR_UE5" }

# Copy files
robocopy "$SOURCE_DIR_UE5" "$INSTALL_DIR_UE5\temp_5.$MAJOR.$MINOR" "$ZIP_INSTALL_FILES.7z" /J /r:999 /w:30

# Extract files
Start-Process -FilePath "$SOURCE_COMMON\7za\7za.exe" -ArgumentList "x -aos `"$INSTALL_DIR_UE5\temp_5.$MAJOR.$MINOR\$ZIP_INSTALL_FILES.7z`" -o`"$INSTALL_DIR_UE5`"" -NoNewWindow -Wait

# Grant permissions
#icacls "D:\Epic" /grant "Authenticated Users":M /Q

# Firewall rules
function Add-FirewallRule {
    param (
        [string]$RuleName,
        [string]$ProgramPath
    )
    if (-not (Get-NetFirewallRule -DisplayName $RuleName -ErrorAction SilentlyContinue)) {
        New-NetFirewallRule -DisplayName $RuleName -Direction Inbound -Program $ProgramPath -Action Allow -Profile Any
        New-NetFirewallRule -DisplayName "$RuleName Outbound" -Direction Outbound -Program $ProgramPath -Action Allow -Profile Any
        Write-Output "Firewall rule $RuleName created."
    } else {
        Write-Output "Firewall rule $RuleName already exists."
    }
}

Add-FirewallRule -RuleName "UE_LAUNCHER" -ProgramPath "C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win64\EpicGamesLauncher.exe"
Add-FirewallRule -RuleName $FIREWALL_RULENAME -ProgramPath $FIREWALL_PROGPATH

# Install Unreal prerequisites
Write-Output "INSTALLING PREREQUISITES"
Start-Process "$INSTALL_DIR_UE5\UE_5.$MAJOR\Engine\Extras\Redist\en-us\UE5PrereqSetup_x64.exe" -ArgumentList "/q" -NoNewWindow -Wait

# Copy shortcut to desktop
robocopy "$SOURCE_DIR_UE5" "C:\Users\Public\Desktop" "$SHORTCUT_FILE_UE5"

# Copy launcher version file
If (!(Test-Path "C:\ProgramData\Epic\UnrealEngineLauncher")) {
    New-Item -ItemType Directory -Path "C:\ProgramData\Epic\UnrealEngineLauncher"
}
Copy-Item "$TOOLS_DIR\UE5\LauncherInstalled.dat" "C:\ProgramData\Epic\UnrealEngineLauncher\LauncherInstalled.dat" -Force

# Add "Edit with unreal" context menu
#Start-Process "$INSTALL_DIR_UE5\UE_5.$MAJOR\Engine\Binaries\Win64\UnrealVersionSelector.exe /register /unattended"

# Remove temp files
If (Test-Path "$INSTALL_DIR_UE5\temp_5.$MAJOR.$MINOR") {
    Remove-Item -Path "$INSTALL_DIR_UE5\temp_5.$MAJOR.$MINOR" -Recurse -Force
}

Write-Output "Unreal INSTALLATION COMPLETE"
