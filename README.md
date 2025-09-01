## ForceTrack

Aplicación en Python con interfaz y procesamiento por cámara con IA entrenable. Este repo solo prepara el entorno y la arquitectura mínima para que el equipo desarrolle sin fricción.

### Requisitos
- **Python 3.11+** en PATH
- Windows PowerShell (recomendado): puede ser necesario ejecutar una vez:
  `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

### Estructura del proyecto
- `app/`: UI y orquestación (punto de entrada en `app/main.py`).
- `core/`: lógica de dominio.
  - `core/camera/`: captura con OpenCV.
  - `core/ai/`: entrenamiento e inferencia (PyTorch opcional).
  - `core/config/`: configuración y variables de entorno.
- `tests/`: pruebas con pytest.
- `scripts/`: utilidades para preparar y trabajar en el entorno.
- `data/`, `models/`: generados localmente, ignorados por git.

### Preparación rápida (Windows)
1) Clona el repo y abre PowerShell en la carpeta del proyecto.
2) Opcional: habilita ejecución de scripts (una vez por usuario):
   `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`
3) Crea/activa el entorno e instala dependencias:
   `./scripts/setup.ps1` (usa `.\scripts\setup.ps1` si estás en PowerShell clásico)
   - Flags útiles:
     - `-EnvName ".venv"` para nombrar el entorno.
     - `-Dev:$false` si no quieres herramientas de desarrollo.
     - `-ML cpu|cuda|none` para preparar dependencias ML base (ver nota PyTorch).
4) Activa el entorno cuando lo necesites:
   `./scripts/activate.ps1`
5) Crea tu `.env` a partir de `env.example` si lo requieres.

### Comandos de trabajo
- `./scripts/format.ps1`: formatea con Black y corrige con Ruff.
- `./scripts/lint.ps1`: lint con Ruff y tipos con mypy.
- `./scripts/test.ps1`: corre pytest.

### Notas sobre IA/ML (PyTorch)
Este setup no instala PyTorch por defecto. Para instalarlo correctamente (CPU o CUDA) usa el selector oficial de la página de PyTorch e instala el comando sugerido para tu GPU:
- [Guía de instalación de PyTorch](https://pytorch.org/get-started/locally/)

Luego puedes añadirlo al entorno con el comando que te provee la página. Si prefieres, agrega la línea correspondiente a `requirements-ml.txt` para fijarlo.

### Convenciones
- Estilo: Black (line-length 100) y Ruff.
- Tipado: mypy en `app/` y `core/`.
- Tests: pytest en `tests/`.

### Próximos pasos para el equipo
- Definir la tecnología de UI (Qt/PySide6 o similar) e implementar `app/main.py`.
- Implementar módulos en `core/camera` y `core/ai` y su configuración.
- Versionar solo código y configuración; datos/modelos locales quedan ignorados.

