# Install a Nerd Font (system-wide)
# Run in an elevated PowerShell session

# ZIP name on GitHub (must match release asset)
$FontZipName     = "CascadiaCode"          # <--- THIS is the correct ZIP name
# Display name inside Windows Terminal
$FontDisplayName = "CaskaydiaCove"         # <--- Nerd Font name

$zipUrl      = "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$FontZipName.zip"
$zipPath     = Join-Path $env:TEMP "$FontZipName.zip"
$extractPath = Join-Path $env:TEMP "$FontZipName-fonts"

Write-Host "Downloading $FontDisplayName Nerd Font from:"
Write-Host "  $zipUrl"
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

Write-Host "Extracting $FontDisplayName fonts..."
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

Write-Host "Installing $FontDisplayName fonts system-wide..."
$fonts = Get-ChildItem -Path $extractPath -Filter *.ttf

foreach ($font in $fonts) {
    $destPath = "C:\Windows\Fonts\$($font.Name)"
    Copy-Item -Path $font.FullName -Destination $destPath -Force

    # Register in Windows registry
    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
    $displayName = ($font.BaseName -replace "\s*Regular", "") + " (TrueType)"
    New-ItemProperty -Path $regPath -Name $displayName -Value $font.Name -PropertyType String -Force | Out-Null

    Write-Host "Installed: $($font.Name)"
}

Write-Host "Cleaning up temporary files..."
Remove-Item $zipPath -Force
Remove-Item $extractPath -Recurse -Force

Write-Host ""
Write-Host "✔️ $FontDisplayName Nerd Font installation complete."
Write-Host "➡️ Set your terminal font to: '$FontDisplayName Nerd Font'."
