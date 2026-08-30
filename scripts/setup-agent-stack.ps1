param(
    [string]$Target = "$HOME\OneDrive\free-claude-code\repos"
)

$ErrorActionPreference = 'Stop'

Write-Host "Setting up agent stack in: $Target"

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw "GitHub CLI (gh) is not installed or not in PATH. Install/login to gh first."
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

    Write-Host "CLONE $repo"
    gh repo clone "antoniojmiranda82-cyberdev/$repo" $dest
}

Write-Host ""
Write-Host "Done. Repos are in: $Target"
