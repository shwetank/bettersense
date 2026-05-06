#Requires -Version 5.1
<#
.SYNOPSIS
    Install the bettersense bundle into your Claude Code config on Windows.

.DESCRIPTION
    Creates symlinks from your Claude config directory back into this repo.
    Symlinks mean git pull updates your installed skills automatically.

    IMPORTANT: Symlinks on Windows require either:
      (a) Developer Mode enabled (Settings → System → Developer Mode), OR
      (b) Running this script as Administrator.
    Without one of these, symlink creation will fail.

.PARAMETER Scope
    'user'    — install to $HOME\.claude\{skills,agents}\ (default)
    'project' — install to .\.claude\{skills,agents}\ (current directory)

.PARAMETER Force
    Overwrite existing skills/agents with the same name. Default: skip with warning.

.EXAMPLE
    .\scripts\install.ps1
    .\scripts\install.ps1 -Scope project
    .\scripts\install.ps1 -Force
    .\scripts\install.ps1 -Scope user -Force
#>

param(
    [ValidateSet('user', 'project')]
    [string]$Scope = 'user',

    [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ── Paths ────────────────────────────────────────────────────────────────────

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot  = Split-Path -Parent $ScriptDir
$SourceDir = Join-Path $RepoRoot 'plugin'

$SourceSkills = Join-Path $SourceDir 'skills'
$SourceAgents = Join-Path $SourceDir 'agents'

if (-not (Test-Path $SourceSkills) -or -not (Test-Path $SourceAgents)) {
    Write-Error "Bundle directory not found at: $SourceDir`nExpected: $SourceSkills and $SourceAgents"
    exit 1
}

$TargetBase = if ($Scope -eq 'user') {
    Join-Path $HOME '.claude'
} else {
    Join-Path (Get-Location) '.claude'
}

$TargetSkills = Join-Path $TargetBase 'skills'
$TargetAgents = Join-Path $TargetBase 'agents'

New-Item -ItemType Directory -Force -Path $TargetSkills | Out-Null
New-Item -ItemType Directory -Force -Path $TargetAgents | Out-Null

# ── Check symlink capability ──────────────────────────────────────────────────

function Test-SymlinkCapability {
    $testTarget = Join-Path $env:TEMP 'bettersense-symlink-test-target'
    $testLink   = Join-Path $env:TEMP 'bettersense-symlink-test-link'

    New-Item -ItemType Directory -Force -Path $testTarget | Out-Null
    try {
        New-Item -ItemType SymbolicLink -Path $testLink -Target $testTarget -ErrorAction Stop | Out-Null
        Remove-Item $testLink -Force
        return $true
    } catch {
        return $false
    } finally {
        Remove-Item $testTarget -Recurse -Force -ErrorAction SilentlyContinue
    }
}

if (-not (Test-SymlinkCapability)) {
    Write-Host ""
    Write-Host "ERROR: Cannot create symbolic links." -ForegroundColor Red
    Write-Host ""
    Write-Host "Windows symlinks require one of:"
    Write-Host "  (a) Developer Mode enabled — Settings → System → Developer Mode"
    Write-Host "  (b) Run this script as Administrator (right-click → Run as Administrator)"
    Write-Host ""
    Write-Host "Alternative: use the manual copy install instead:"
    Write-Host "  New-Item -ItemType Directory -Force `"$TargetSkills`", `"$TargetAgents`""
    Write-Host "  Copy-Item -Recurse `"$SourceSkills\*`" `"$TargetSkills\`""
    Write-Host "  Copy-Item `"$SourceAgents\*.md`" `"$TargetAgents\`""
    exit 1
}

# ── Pre-flight summary ────────────────────────────────────────────────────────

$skillDirs  = Get-ChildItem -Path $SourceSkills -Directory
$agentFiles = Get-ChildItem -Path $SourceAgents -Filter '*.md'

Write-Host ""
Write-Host "Bundle:  bettersense"
Write-Host "Source:  $SourceDir"
Write-Host "Target:  $TargetBase"
Write-Host "Force:   $(if ($Force) { 'yes' } else { 'no' })"
Write-Host ""
Write-Host "Will install:"
Write-Host "  - $($skillDirs.Count) skills"
Write-Host "  - $($agentFiles.Count) agents"
Write-Host ""

$confirm = Read-Host "Proceed? [y/N]"
if ($confirm -notmatch '^[Yy]$') {
    Write-Host "Aborted."
    exit 0
}

# ── Install skills ────────────────────────────────────────────────────────────

$Installed = 0
$Skipped   = 0
$Replaced  = 0

foreach ($skillDir in $skillDirs) {
    $name   = $skillDir.Name
    $target = Join-Path $TargetSkills $name
    $source = $skillDir.FullName

    $existing = Get-Item $target -ErrorAction SilentlyContinue

    if ($existing) {
        # Already a symlink pointing to the right place — skip silently
        if ($existing.LinkType -eq 'SymbolicLink' -and $existing.Target -eq $source) {
            $Installed++
            continue
        }

        if ($Force) {
            Remove-Item $target -Recurse -Force
            New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
            $Replaced++
            Write-Host "  replaced: skills\$name"
        } else {
            $Skipped++
            Write-Host "  skipped (exists): skills\$name"
        }
    } else {
        New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
        $Installed++
    }
}

# ── Install agents ────────────────────────────────────────────────────────────

foreach ($agentFile in $agentFiles) {
    $name   = $agentFile.Name
    $target = Join-Path $TargetAgents $name
    $source = $agentFile.FullName

    $existing = Get-Item $target -ErrorAction SilentlyContinue

    if ($existing) {
        if ($existing.LinkType -eq 'SymbolicLink' -and $existing.Target -eq $source) {
            $Installed++
            continue
        }

        if ($Force) {
            Remove-Item $target -Force
            New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
            $Replaced++
            Write-Host "  replaced: agents\$name"
        } else {
            $Skipped++
            Write-Host "  skipped (exists): agents\$name"
        }
    } else {
        New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
        $Installed++
    }
}

# ── Summary ───────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "Done."
Write-Host "  Installed/already current: $Installed"
Write-Host "  Replaced (-Force):         $Replaced"
Write-Host "  Skipped (already exists):  $Skipped"
Write-Host ""

if ($Skipped -gt 0) {
    Write-Host "Note: skipped items exist at the target with different content."
    Write-Host "Re-run with -Force to overwrite, or remove them manually."
    Write-Host ""
}

Write-Host "Verify in Claude Code: /agents (should list 13 agents)"
Write-Host "To uninstall: .\scripts\uninstall.ps1 -Scope $Scope"

# ── Verify symlinks ───────────────────────────────────────────────────────────

Write-Host ""
Write-Host "Installed bettersense symlinks:"
Get-ChildItem $TargetSkills, $TargetAgents |
    Where-Object { $_.LinkType -eq 'SymbolicLink' -and $_.Target -like "*bettersense*" } |
    ForEach-Object { Write-Host "  $($_.FullName) → $($_.Target)" }
