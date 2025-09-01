param(
    [string]$EnvName = ".venv"
)

$activate = Join-Path $EnvName 'Scripts/Activate.ps1'
& $activate


