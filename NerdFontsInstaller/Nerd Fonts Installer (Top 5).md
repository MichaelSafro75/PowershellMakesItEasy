# Nerd Fonts Installer

This folder contains the installer scripts and helper documentation for installing Nerd Fonts system-wide on Windows.

## Scripts in this folder

- `InstallNerdFont.ps1`
  - Downloads a single Nerd Font ZIP from the latest `ryanoasis/nerd-fonts` GitHub release.
  - Extracts and installs all `.ttf` files system-wide.
  - By default, it installs the `CaskaydiaCove` font from the `CascadiaCode.zip` asset.

- `InstallTop5NerdFonts.ps1`
  - Installs the top 5 Nerd Fonts from pre-downloaded ZIP files.
  - Expects ZIP files in `C:\Source\PowershellMakesItEasy\NerdFonts`.
  - Extracts each ZIP, installs the `.ttf` files system-wide, and removes the extracted temporary folder.

## Included Top 5 Fonts

- `CaskaydiaCove Nerd Font` (`CascadiaCode.zip`)
- `FiraCode Nerd Font` (`FiraCode.zip`)
- `JetBrainsMono Nerd Font` (`JetBrainsMono.zip`)
- `MesloLGS Nerd Font` (`Meslo.zip`)
- `Hack Nerd Font` (`Hack.zip`)

## How to use `InstallNerdFont.ps1`

1. Open PowerShell as Administrator.
2. Navigate to this folder:
   - `cd C:\Source\PowershellMakesItEasy\NerdFontsInstaller`
3. Run:
   - `.\\InstallNerdFont.ps1`

If you want a different font, update these variables at the top of `InstallNerdFont.ps1`:

- `$FontZipName` — the GitHub release ZIP asset name
- `$FontDisplayName` — the font name shown in Windows Terminal

## How to use `InstallTop5NerdFonts.ps1`

1. Download the required ZIP files from the official Nerd Fonts repository:
   - `https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip`
   - `https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip`
   - `https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip`
   - `https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip`
   - `https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip`

2. Place all ZIP files in the folder:
   - `C:\Source\PowershellMakesItEasy\NerdFonts`

3. Open PowerShell as Administrator.
4. Run from the `NerdFontsInstaller` folder:
   - `.\\InstallTop5NerdFonts.ps1`

## Notes on system-wide installation

Both scripts install fonts into `C:\Windows\Fonts` and register them in the Windows registry under `HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts`.

This ensures:

- fonts are available to all users
- normal and elevated PowerShell sessions can use them
- Windows Terminal can access the fonts for both standard and admin profiles

## Setting the font in Windows Terminal

Open Windows Terminal settings and configure the font face for the PowerShell profiles.

Recommended font names:

- `CaskaydiaCove Nerd Font`
- `FiraCode Nerd Font`
- `JetBrainsMono Nerd Font`
- `MesloLGS Nerd Font`
- `Hack Nerd Font`

Repeat for any `PowerShell (Administrator)` profile you use.

## Folder structure

```
C:\Source\PowershellMakesItEasy\
    └── NerdFontsInstaller\
        ├── InstallNerdFont.ps1
        ├── InstallTop5NerdFonts.ps1
        └── NerdFonts\
            ├── CascadiaCode.zip
            ├── FiraCode.zip
            ├── JetBrainsMono.zip
            ├── Meslo.zip
            └── Hack.zip
```
