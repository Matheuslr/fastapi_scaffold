from pathlib import Path

from ddtrace import config
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

from app.api.router import api_router
from app.settings import settings

APP_ROOT = Path(__file__).parent


def get_app() -> FastAPI:
    """
    Get FastAPI application.

    This is the main constructor of an application.

    :return: application.
    """

    # Override service name
    config.fastapi["service_name"] = str(settings.service_name)

    app = FastAPI(
        title="app",
        description="A simple scaffold for FastAPI projects",
        docs_url=None,
        redoc_url=None,
        openapi_url="/api/openapi.json",
    )

    # app.add_event_handler("startup")
    # app.add_event_handler("shutdown")

    app.include_router(router=api_router)
    app.mount(
        "/static",
        StaticFiles(directory=APP_ROOT / "static"),
        name="static",
    )
    return app
