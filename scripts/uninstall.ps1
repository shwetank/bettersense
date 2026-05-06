#Requires -Version 5.1
<#
.SYNOPSIS
    Remove the bettersense bundle from your Claude Code config on Windows.

.DESCRIPTION
    Safe by design: removes only items in $HOME\.claude\{skills,agents}\ that are
    symbolic links pointing into THIS repo. Will not touch:
      - Skills/agents you wrote yourself
      - Skills/agents installed from other sources
      - Skills/agents installed via Copy-Item instead of symlinks (use -HardUninstall for those)
      - Your reflection data at $HOME\bettersense-work-reflections\ (your data, your call)

.PARAMETER Scope
    'user'    — uninstall from $HOME\.claude\{skills,agents}\ (default)
    'project' — uninstall from .\.claude\{skills,agents}\ (current directory)

.PARAMETER WhatIf
    Show what would be removed without actually removing anything.

.PARAMETER HardUninstall
    Also offer to remove plain copies (not just symlinks) whose names match
    the bundle manifest. Use this if you installed via Copy-Item.
    Will prompt for confirmation per item.

.EXAMPLE
    .\scripts\uninstall.ps1
    .\scripts\uninstall.ps1 -WhatIf
    .\scripts\uninstall.ps1 -Scope project
    .\scripts\uninstall.ps1 -HardUninstall
#>

param(
    [ValidateSet('user', 'project')]
    [string]$Scope = 'user',

    [switch]$WhatIf,

    [switch]$HardUninstall
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ── Paths ────────────────────────────────────────────────────────────────────

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot  = Split-Path -Parent $ScriptDir
$SourceDir = Join-Path $RepoRoot 'plugin'

$TargetBase = if ($Scope -eq 'user') {
    Join-Path $HOME '.claude'
} else {
    Join-Path (Get-Location) '.claude'
}

$TargetSkills = Join-Path $TargetBase 'skills'
$TargetAgents = Join-Path $TargetBase 'agents'

if (-not (Test-Path $TargetSkills) -and -not (Test-Path $TargetAgents)) {
    Write-Host "Nothing to uninstall — $TargetBase does not exist."
    exit 0
}

if ($WhatIf) {
    Write-Host "[DRY RUN] Would remove the following bettersense symlinks:"
}

# ── Remove symlinks ───────────────────────────────────────────────────────────

$Removed = 0
$Skipped = 0

$allTargets = @()
if (Test-Path $TargetSkills) { $allTargets += Get-ChildItem $TargetSkills }
if (Test-Path $TargetAgents) { $allTargets += Get-ChildItem $TargetAgents }

foreach ($item in $allTargets) {
    if ($item.LinkType -eq 'SymbolicLink' -and $item.Target -like "*bettersense*") {
        if ($WhatIf) {
            Write-Host "  would remove: $($item.FullName)"
            $Removed++
        } else {
            Remove-Item $item.FullName -Force
            Write-Host "  removed: $($item.FullName)"
            $Removed++
        }
    }
}

# ── Hard uninstall (copies, not symlinks) ─────────────────────────────────────

if ($HardUninstall) {
    $manifestPath = Join-Path $RepoRoot 'MANIFEST.md'
    if (-not (Test-Path $manifestPath)) {
        Write-Warning "MANIFEST.md not found at $manifestPath — skipping hard uninstall."
    } else {
        # Extract skill/agent names from MANIFEST.md
        $manifestNames = Select-String -Path $manifestPath -Pattern '`([a-z][a-z0-9-]+)`' |
            ForEach-Object { $_.Matches[0].Groups[1].Value } |
            Sort-Object -Unique

        foreach ($name in $manifestNames) {
            $candidates = @(
                (Join-Path $TargetSkills $name),
                (Join-Path $TargetAgents "$name.md")
            )
            foreach ($candidate in $candidates) {
                $item = Get-Item $candidate -ErrorAction SilentlyContinue
                if ($item -and $item.LinkType -ne 'SymbolicLink') {
                    if ($WhatIf) {
                        Write-Host "  [hard] would remove copy: $candidate"
                        $Removed++
                    } else {
                        $confirm = Read-Host "Remove copy at $candidate? [y/N]"
                        if ($confirm -match '^[Yy]$') {
                            Remove-Item $candidate -Recurse -Force
                            Write-Host "  [hard] removed: $candidate"
                            $Removed++
                        } else {
                            $Skipped++
                        }
                    }
                }
            }
        }
    }
}

# ── Summary ───────────────────────────────────────────────────────────────────

Write-Host ""
if ($WhatIf) {
    Write-Host "[DRY RUN] Would remove: $Removed item(s). Skipped: $Skipped."
    Write-Host "Re-run without -WhatIf to actually remove."
} else {
    Write-Host "Done."
    Write-Host "  Removed: $Removed"
    Write-Host "  Skipped: $Skipped"
}

Write-Host ""
Write-Host "Your reflection data at $HOME\bettersense-work-reflections\ was NOT touched."
Write-Host "Remove it manually if you want:"
Write-Host "  Remove-Item -Recurse -Force `"$HOME\bettersense-work-reflections`""
