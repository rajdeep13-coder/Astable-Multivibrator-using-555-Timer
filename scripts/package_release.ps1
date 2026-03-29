param(
    [string]$ProjectName = "Astable_555_PCB",
    [string]$OutputDir = "releases"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$releaseDir = Join-Path $root $OutputDir
$stagingDir = Join-Path $releaseDir ("{0}_{1}" -f $ProjectName, $timestamp)
$zipPath = "$stagingDir.zip"

$requiredFiles = @(
    "Astable_555_PCB.kicad_sch",
    "Astable_555_PCB.kicad_pcb",
    "Astable_555_PCB.kicad_pro",
    "readme.md",
    "LICENSE"
)

$optionalPatterns = @(
    "ERC.rpt",
    "report.txt",
    "*.gbr",
    "*.drl",
    "*.gbrjob",
    "*.csv",
    "*.pos",
    "*.pdf"
)

$missing = @()
foreach ($file in $requiredFiles) {
    $path = Join-Path $root $file
    if (-not (Test-Path -LiteralPath $path)) {
        $missing += $file
    }
}

if ($missing.Count -gt 0) {
    Write-Error ("Missing required files: {0}" -f ($missing -join ", "))
}

if (-not (Test-Path -LiteralPath $releaseDir)) {
    New-Item -ItemType Directory -Path $releaseDir | Out-Null
}

if (Test-Path -LiteralPath $stagingDir) {
    Remove-Item -LiteralPath $stagingDir -Recurse -Force
}
if (Test-Path -LiteralPath $zipPath) {
    Remove-Item -LiteralPath $zipPath -Force
}

New-Item -ItemType Directory -Path $stagingDir | Out-Null

foreach ($file in $requiredFiles) {
    Copy-Item -LiteralPath (Join-Path $root $file) -Destination $stagingDir
}

$optionalFiles = @()
foreach ($pattern in $optionalPatterns) {
    $matches = Get-ChildItem -Path $root -Filter $pattern -File -ErrorAction SilentlyContinue
    foreach ($match in $matches) {
        if ($requiredFiles -contains $match.Name) {
            continue
        }

        $alreadyIncluded = $optionalFiles | Where-Object { $_.FullName -eq $match.FullName }
        if (-not $alreadyIncluded) {
            $optionalFiles += $match
            Copy-Item -LiteralPath $match.FullName -Destination $stagingDir
        }
    }
}

$manifestPath = Join-Path $stagingDir "MANIFEST.txt"
$manifestLines = @(
    "Project: $ProjectName",
    "Generated: $(Get-Date -Format o)",
    "",
    "Included files:"
)

$included = Get-ChildItem -Path $stagingDir -File | Sort-Object Name
foreach ($item in $included) {
    $manifestLines += ("- {0}" -f $item.Name)
}

Set-Content -LiteralPath $manifestPath -Value $manifestLines -Encoding UTF8

Compress-Archive -Path (Join-Path $stagingDir "*") -DestinationPath $zipPath -CompressionLevel Optimal
Remove-Item -LiteralPath $stagingDir -Recurse -Force

Write-Host ("Release package created: {0}" -f $zipPath)
