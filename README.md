<div align="right">

<a href="https://railway.com?referralCode=QhjuBc">

  <img width="160" src="https://raw.githubusercontent.com/docdyhr/.github/main/assets/railway-corner-v2@2x.png" alt="Deploy on Railway — $20 free credits">

</a>

</div>

# Homebrew Tap for macversiontracker

This is the official Homebrew tap for **macversiontracker** - a command-line tool for tracking and managing macOS applications installed outside the App Store.

## Installation

### Tap this repository

```bash
brew tap docdyhr/tap
```

### Install macversiontracker

```bash
brew install macversiontracker
```

### Combined (one-line install)

```bash
brew install docdyhr/tap/macversiontracker
```

## Usage

After installation, you can use the tool with any of these commands:

```bash
# List applications not from the App Store
versiontracker --apps

# Get Homebrew recommendations for your apps
versiontracker --recommend

# Check for outdated apps
versiontracker --outdated

# Show help
versiontracker --help
```

## Upgrading

```bash
brew upgrade macversiontracker
```

## Uninstalling

```bash
brew uninstall macversiontracker
brew untap docdyhr/tap
```

## About

- **Homepage**: https://github.com/docdyhr/versiontracker
- **PyPI**: https://pypi.org/project/macversiontracker/
- **License**: MIT

## Issues & Support

If you encounter any issues with the Homebrew formula, please report them at:
- Formula issues: https://github.com/docdyhr/homebrew-tap/issues
- Application issues: https://github.com/docdyhr/versiontracker/issues
