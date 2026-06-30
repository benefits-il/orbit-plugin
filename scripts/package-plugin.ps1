# package-plugin.ps1
# Builds the downloadable PLUGIN zip for ORBIT — the zip-fallback install path
# (Customize -> Plugins -> Personal plugins -> add from file).
#
# IMPORTANT: this repo's marketplace source is "./" (the whole repo IS the plugin
# payload), so a *.zip committed in the repo would become a nested zip and break
# `marketplace add` with "nested zip file are not allowed". Therefore:
#   - *.zip is gitignored repo-wide.
#   - This zip is NEVER committed. It is uploaded as a GitHub *release asset*:
#       gh release upload <tag> download/orbit-plugin.zip --clobber
#     and the install page links to
#       https://github.com/benefits-il/orbit-plugin/releases/latest/download/orbit-plugin.zip
#
# The zip contains the plugin payload only (.claude-plugin/, skills/, README.md, LICENSE)
# at the zip root — the landing-page files (index.html, css/, js/, images/) are excluded.
#
# Usage (from anywhere):  powershell.exe -File ./scripts/package-plugin.ps1

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot  = Split-Path -Parent $scriptDir
$outDir    = Join-Path $repoRoot 'download'
$outZip    = Join-Path $outDir 'orbit-plugin.zip'

# Sanity: the plugin manifest must exist.
$manifest = Join-Path $repoRoot '.claude-plugin/plugin.json'
if (-not (Test-Path $manifest)) {
    throw "Plugin manifest not found at $manifest. Are you in the orbit-plugin repo?"
}

# Plugin payload only — NOT the landing page, NOT *.zip, NOT .git.
$include = @('.claude-plugin', 'skills', 'README.md', 'LICENSE')

if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir | Out-Null }
if (Test-Path $outZip) { Remove-Item $outZip -Force }

# Build the zip MANUALLY with forward-slash entry names so it extracts correctly on
# Windows, macOS, and Linux. (Windows PowerShell 5.1's Compress-Archive writes backslash
# entry names, which macOS/Linux unzip treats as a literal filename and mangles.)
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$files = foreach ($item in $include) {
    $p = Join-Path $repoRoot $item
    if (Test-Path $p) {
        Get-ChildItem -Path $p -Recurse -File
    }
}
# Guard: never include a stray zip in the payload.
$files = $files | Where-Object { $_.Extension -ne '.zip' }

$zip = [System.IO.Compression.ZipFile]::Open($outZip, [System.IO.Compression.ZipArchiveMode]::Create)
try {
    foreach ($f in $files) {
        $rel = $f.FullName.Substring($repoRoot.Length + 1) -replace '\\', '/'
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $f.FullName, $rel, [System.IO.Compression.CompressionLevel]::Optimal) | Out-Null
    }
} finally {
    $zip.Dispose()
}

$zipItem = Get-Item $outZip
$kb = [math]::Round($zipItem.Length / 1KB, 1)
$version = (Get-Content $manifest -Raw | ConvertFrom-Json).version

Write-Output "Built plugin zip:"
Write-Output "  $outZip"
Write-Output "  version $version, $kb KB"
Write-Output ""
Write-Output "Verify contents (must include .claude-plugin/plugin.json, must contain NO .zip):"
$archive = [System.IO.Compression.ZipFile]::OpenRead($outZip)
try {
    $archive.Entries | ForEach-Object { Write-Output ("  " + $_.FullName) }
    $hasManifest = @($archive.Entries | Where-Object { $_.FullName -eq '.claude-plugin/plugin.json' }).Count -gt 0
    $hasZip      = @($archive.Entries | Where-Object { $_.FullName -like '*.zip' }).Count -gt 0
    Write-Output ""
    Write-Output ("manifest at root: " + $hasManifest)
    Write-Output ("contains nested zip: " + $hasZip)
} finally {
    $archive.Dispose()
}
