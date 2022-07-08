import time

from fastapi import APIRouter

from app.settings import settings

router = APIRouter()


@router.get("/", include_in_schema=False)
async def get_app():
    return [{"app": settings.service_name}]


@router.get("/health", include_in_schema=False)
async def get_health() -> dict:
    return {"healthy": True, "checked_at": time.time()}
