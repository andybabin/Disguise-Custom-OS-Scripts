param(
    # args: Internal, Upgrade, 
    [Parameter(Mandatory=$true)]
    [PSCustomObject]$SettingsObject,
    [Parameter(Mandatory=$true)]
    [string]$ServerModelCode,
    [Parameter(Mandatory=$true)]
    [string]$ServerSerialNumber
)

function Find-OrCreateFolder
{
    param (
        [Parameter(Mandatory=$true)]
        [string]$FolderPath
    )
    # Check if the folder exists
    if (-not (Test-Path -Path $FolderPath)) {
        # Folder does not exist, create it
        New-Item -Path $FolderPath -ItemType "Directory" -Force
        Write-Host "Folder created: $FolderPath"
    } else {
        Write-Host "Folder already exists: $FolderPath"
    }
}

function Copy-FileToDestination
{
    param (
        [Parameter(Mandatory=$true)]
        [string]$Source,
        [Parameter(Mandatory=$true)]
        [string]$Destination
    )
    # Copy .bat file
    Write-Host "Copying File: $Source to folder: $Destination"
    try {
        Copy-Item -Path $Source -Destination $Destination -Force -Recurse
        Write-Host "File copied successfully."
    } catch {
        Write-Host "Error occurred while copying the file:"
        Write-Host $_.Exception.Message
    }
}


#DEBUG INFO...
Write-Host "StartScript.ps1 called with ServerModelCode [$($ServerModelCode)] and ServerSerialNumber [$($ServerSerialNumber)]"

#DEBUG INFO...
Write-Host "WE ARE INSIDE Fuses BESPOKE SCRIPT NOW (StartScript.ps1) HERE IS THE SETTINGS OBJECT THAT WAS PASSED IN:"
Write-Host "-----------------------------------"
Write-Host ( $SettingsObject | ConvertTo-Json )
Write-Host "-----------------------------------"

if( $SettingsObject.shouldInstallUnreal ) {
    # Call the Unreal Engine installation script
    Write-Host "Starting Unreal Engine installation..."
    $installUnrealScript = Join-Path -Path $PSScriptRoot -ChildPath "InstallUnreal.ps1"
    & $installUnrealScript
}  else {Write-Host "Skipping unreal"}


if ( $SettingsObject.hostName ) {
    #Set PC Hostname (Note, a restart will be required for this to take effect which happens at the end of the reimage process anyway
    $hostName = $SettingsObject.HostName
    Rename-Computer $hostName -Force
    Write-Host "Renamed to $hostName"
}  else {Write-Host "Skipping hostname"}



if ( $SettingsObject.shouldInstallRemotix ) {
    #Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
    $anyDeskInstallerPath = Join-Path -Path $PSScriptRoot -ChildPath "tools\AcronisCyberProtectConnectAgent-win-d3-Default.exe"
    
    Unblock-File -Path $anyDeskInstallerPath
    Start-Process -Wait -FilePath $anyDeskInstallerPath -ArgumentList "/S" -PassThru
} else {Write-Host "Skipping remotix"}


if ( $SettingsObject.shouldInstallEpicGames ) {
    #Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
    #$anyDeskInstallerPath = Join-Path -Path $PSScriptRoot -ChildPath "tools\"
    
    #Unblock-File -Path $anyDeskInstallerPath
    #Start-Process -Wait -FilePath $anyDeskInstallerPath -ArgumentList "/S" -PassThru
    # Install Epic Games Launcher
    #Write-Output "INSTALLING EPIC GAMES LAUNCHER"
    #Start-Process "$TOOLS_DIR\EpicGamesLauncher\EpicInstaller-*.msi" -ArgumentList "/quiet /norestart" -NoNewWindow -Wait
    $epicInstaller = Join-Path -Path $PSScriptRoot -ChildPath "tools\EpicGamesLauncher\EpicInstaller-18.1.3.msi"
    if ($epicInstaller) {
        Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$($epicInstaller.FullName)`" /quiet /norestart ALLUSERS=1" -NoNewWindow -Wait
    } else {
        Write-Host "Epic Games Launcher MSI installer not found in tools\sources\EpicGamesLauncher"
    }
} else {Write-Host "Skipping Epic Games"}

if ( $SettingsObject.shouldUpdateDesktopWallpaper )
{
    # Copy BGInfo to the D drive
    $bgInfoPath = Join-Path -Path $PSScriptRoot -ChildPath "tools\Bginfo64.exe"
    $bgInfoConfigPath = Join-Path -Path $PSScriptRoot -ChildPath "tools\d3.bgi"
    $toolsFolder = "D:\tools"
    Find-OrCreateFolder -FolderPath $toolsFolder
    Copy-Item -Path $bgInfoPath -Destination $toolsFolder
    Copy-Item -Path $bgInfoConfigPath -Destination $toolsFolder

    # Create a shortcut for BGInfo with the right arguments in the startup folder
    $WshShell = New-Object -ComObject WScript.Shell
    $StartupFolder = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
    $shortcutPath = "$StartupFolder\BgInfo64.lnk"
    $shortcut = $WshShell.CreateShortcut($shortcutPath)
    $shortcut.Description = "BGImage Setup"
    $targetPath = Join-Path -Path $toolsFolder -ChildPath "Bginfo64.exe"
    $shortcut.TargetPath = $targetPath
    $arguments = "D:\tools\d3.bgi /TIMER:0 /ACCEPTEULA"
    $shortcut.Arguments = $arguments
    $shortcut.Save()
    $WshShell = $null
}  else {Write-Host "Skipping wallpaper"}

Write-Host "StartScript.ps1 Completed Successfully"