param(
    [string]$Target = "$HOME\OneDrive\free-claude-code\repos"
)

$ErrorActionPreference = 'Stop'

Write-Host "Setting up agent stack in: $Target"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git is not installed or not in PATH. Install Git for Windows, reopen PowerShell, and run this script again."
}

New-Item -ItemType Directory -Force -Path $Target | Out-Null
Set-Location $Target

$repos = @(
    'mcp-context-forge',
    'composio',
    'n8n',
    'a2a-python',
    'nats-server',
    'hermes-agent',
    'hermes-relay',
    'agentcall-hermes-bridge',
    'codex-plus-hermes-team',
    'pydantic-ai',
    'OmniRouter',
    'OmniRoute',
    'new-api',
    'ollama',
    'coolify',
    'CLI-Anything',
    'copilotkit',
    'plane',
    'SuiteCRM',
    'posthog',
    'mautic',
    'safe-chain',
    'Anthropic-Cybersecurity-Skills',
    'Microsoft-Defender-for-Cloud',
    'my-arsenal-of-aws-security-tools'
)

foreach ($repo in $repos) {
    $dest = Join-Path $Target $repo
    if (Test-Path $dest) {
        Write-Host "SKIP  $repo (already exists)"
        continue
    }

    $url = "https://github.com/antoniojmiranda82-cyberdev/$repo.git"
    Write-Host "CLONE $repo"
    git clone $url $dest
}

Write-Host ""
Write-Host "Done. Repos are in: $Target"
