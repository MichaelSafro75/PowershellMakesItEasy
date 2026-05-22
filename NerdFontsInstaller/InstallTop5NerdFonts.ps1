# Install the Top 5 Nerd Fonts (system-wide)
# Run in an elevated PowerShell session

$Fonts = @(
    @{ Zip = "CascadiaCode";   Display = "CaskaydiaCove" },
    @{ Zip = "FiraCode";       Display = "FiraCode" },
    @{ Zip = "JetBrainsMono";  Display = "JetBrainsMono" },
    @{ Zip = "Meslo";          Display = "MesloLGS" },
    @{ Zip = "Hack";           Display = "Hack" }
)

foreach ($fontInfo in $Fonts) {
    $FontZipName     = $fontInfo.Zip
    $FontDisplayName = $fontInfo.Display
    $zipUrl          = "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$FontZipName.zip"
    $zipPath         = Join-Path $env:TEMP "$FontZipName.zip"
    $extractPath     = Join-Path $env:TEMP "$FontZipName-fonts"

    Write-Host "\nDownloading $FontDisplayName Nerd Font from:"
    Write-Host "  $zipUrl"
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

    Write-Host "Extracting $FontDisplayName fonts..."
    Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

    Write-Host "Installing $FontDisplayName fonts system-wide..."
    $fonts = Get-ChildItem -Path $extractPath -Filter *.ttf

    foreach ($font in $fonts) {
        $destPath = "C:\Windows\Fonts\$($font.Name)"

        if (Test-Path $destPath) {
            Write-Host "Already installed: $($font.Name)"
            continue
        }

        try {
            Copy-Item -Path $font.FullName -Destination $destPath -Force -ErrorAction Stop
        }
        catch {
            Write-Warning "Failed to copy $($font.Name) to $destPath. The font may be in use by another process."
            continue
        }

        # Register in Windows registry
        $regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
        $displayName = ($font.BaseName -replace "\s*Regular", "") + " (TrueType)"
        New-ItemProperty -Path $regPath -Name $displayName -Value $font.Name -PropertyType String -Force | Out-Null

        Write-Host "Installed: $($font.Name)"
    }

    Write-Host "Cleaning up temporary files for $FontDisplayName..."
    Remove-Item $zipPath -Force
    Remove-Item $extractPath -Recurse -Force
}

Write-Host ""
Write-Host "✔️ Top 5 Nerd Fonts installation complete."
Write-Host "➡️ Set your terminal font to one of the installed Nerd Fonts."
