param(
    [string]$EnvName = ".venv"
)

$activate = Join-Path $EnvName 'Scripts/Activate.ps1'
& $activate

python -m ruff check .
python -m mypy app core


