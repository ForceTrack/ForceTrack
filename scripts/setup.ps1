param(
    [string]$EnvName = ".venv",
    [switch]$Dev = $true,
    [ValidateSet("none","cpu","cuda")]
    [string]$ML = "none"
)

$ErrorActionPreference = "Stop"

Write-Host "[ForceTrack] Preparando entorno en '$EnvName'..." -ForegroundColor Cyan

if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    throw "Python no está en PATH. Instala Python 3.11+ y reinicia la terminal."
}

if (-not (Test-Path $EnvName)) {
    Write-Host "Creando entorno virtual..." -ForegroundColor Yellow
    python -m venv $EnvName
}

$activate = Join-Path $EnvName 'Scripts/Activate.ps1'
& $activate

python -m pip install --upgrade pip
pip install -r requirements.txt

if ($Dev) {
    pip install -r dev-requirements.txt
}

if ($ML -ne "none") {
    Write-Host "Instalando dependencias ML base (ver README para PyTorch)..." -ForegroundColor Yellow
    pip install -r requirements-ml.txt
    if ($ML -eq "cuda") {
        Write-Host "Para CUDA, instala PyTorch con el selector oficial (ver README)." -ForegroundColor Yellow
    }
}

Write-Host "Listo. Activa el entorno con scripts/activate.ps1 y empieza a trabajar." -ForegroundColor Green


