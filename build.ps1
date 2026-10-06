param(
    [string]$Python = "python",
    [string]$Dotnet = "dotnet",
    [string]$SubnauticaDir = "C:\Program Files (x86)\Steam\steamapps\common\Subnautica",
    [string]$BepInExDir = ""
)

$ErrorActionPreference = "Stop"
$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Push-Location $projectDir
try {
    & $Python ".\tools\preflight.py"
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    & $Python ".\tools\generate_design.py"
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    $restoreArgs = @(
        "restore",
        ".\SubnauticaQuota.csproj",
        "--configfile",
        ".\NuGet.Config",
        "-p:SubnauticaDir=$SubnauticaDir"
    )
    if ($BepInExDir) {
        $restoreArgs += "-p:BepInExDir=$BepInExDir"
    }
    & $Dotnet @restoreArgs
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    $buildArgs = @("build", ".\SubnauticaQuota.csproj", "--no-restore", "-p:SubnauticaDir=$SubnauticaDir")
    if ($BepInExDir) {
        $buildArgs += "-p:BepInExDir=$BepInExDir"
    }
    & $Dotnet @buildArgs
    exit $LASTEXITCODE
}
finally {
    Pop-Location
}
