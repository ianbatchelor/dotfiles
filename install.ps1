# Reproduces this machine's Claude Code setup (settings + global skills/plugins)
# on a fresh Windows machine. Run from anywhere; paths are absolute.

$ErrorActionPreference = "Stop"
$claudeDir = Join-Path $HOME ".claude"
$dotfilesClaude = Join-Path $PSScriptRoot "claude"

if (-not (Test-Path $claudeDir)) {
    New-Item -ItemType Directory -Path $claudeDir | Out-Null
}

Write-Host "Copying settings.json..."
Copy-Item (Join-Path $dotfilesClaude "settings.json") (Join-Path $claudeDir "settings.json") -Force

Write-Host "Installing emilkowalski/skills globally..."
npx skills@latest add emilkowalski/skills -g

Write-Host "Installing ECC (impeccable) globally..."
npx impeccable install

Write-Host "Done. Restart Claude Code / open a new session to pick up the changes."
