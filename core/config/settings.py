"""Variables de configuración y paths (stub)."""

from pydantic import BaseModel


class Settings(BaseModel):
    app_env: str = "development"
    log_level: str = "INFO"
    data_dir: str = "./data"
    model_dir: str = "./models"


def load_settings() -> Settings:
    """Carga configuración (implementar lectura de .env más adelante)."""
    return Settings()


