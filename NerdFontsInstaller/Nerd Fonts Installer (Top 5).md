# Nerd Fonts Installer

This folder contains the installer scripts and helper documentation for installing Nerd Fonts system-wide on Windows.

## Why Nerd Fonts?

Nerd Fonts are useful when your shell, prompt theme, or terminal tools rely on special glyphs and icons. They are commonly needed for:

- Oh My Posh or other PowerShell prompt themes that use powerline symbols and icons
- `posh-git`, `gitstatus`, and prompt helpers that render branch/commit glyphs
- terminal-based editors, status bars, and plugins that show icons or patched symbols
- consistent rendering of ligatures and patched glyphs in Windows Terminal

If your prompt shows missing boxes, incorrect characters, or broken separators, a Nerd Font is often the missing piece.

## Scripts in this folder

- `InstallNerdFont.ps1`
  - Downloads a single Nerd Font ZIP from the latest `ryanoasis/nerd-fonts` GitHub release.
  - Extracts and installs all `.ttf` files system-wide.
  - By default, it installs the `CaskaydiaCove` font from the `CascadiaCode.zip` asset.

- `InstallTop5NerdFonts.ps1`
  - Downloads and installs the top 5 Nerd Fonts from the official Nerd Fonts GitHub release assets.
  - Saves each ZIP to the system temporary folder, extracts it, installs the `.ttf` files system-wide, and cleans up temporary files.
  - Installs each font system-wide and registers it in the Windows font registry.

## Included Top 5 Fonts

- `CaskaydiaCove Nerd Font` (`CascadiaCode.zip`)
- `FiraCode Nerd Font` (`FiraCode.zip`)
- `JetBrainsMono Nerd Font` (`JetBrainsMono.zip`)
- `MesloLGS Nerd Font` (`Meslo.zip`)
- `Hack Nerd Font` (`Hack.zip`)

## How to use `InstallNerdFont.ps1`

1. Open PowerShell as Administrator.
2. Navigate to this folder.
3. Run:
   - `.\\InstallNerdFont.ps1`

If you want a different font, update these variables at the top of `InstallNerdFont.ps1`:

- `$FontZipName` — the GitHub release ZIP asset name
- `$FontDisplayName` — the font name shown in Windows Terminal

## How to use `InstallTop5NerdFonts.ps1`

1. Open PowerShell as Administrator.
2. Navigate to this folder.
3. Run:
   - `.\\InstallTop5NerdFonts.ps1`

The script downloads the required top 5 Nerd Font ZIP files automatically from the official Nerd Fonts GitHub release assets. It then extracts and installs each font system-wide.

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
<workspace root>\NerdFontsInstaller\
    ├── InstallNerdFont.ps1
    └── InstallTop5NerdFonts.ps1
```
