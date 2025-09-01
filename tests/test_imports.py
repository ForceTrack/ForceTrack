def test_can_import_ui() -> None:
    import app.ui.window as _  # noqa: F401


def test_can_import_services() -> None:
    import app.services.runtime as _  # noqa: F401


def test_can_import_camera() -> None:
    import core.camera.capture as _  # noqa: F401


def test_can_import_ai() -> None:
    import core.ai.inference as _  # noqa: F401
    import core.ai.train as _  # noqa: F401


def test_can_import_config() -> None:
    import core.config.settings as _  # noqa: F401


