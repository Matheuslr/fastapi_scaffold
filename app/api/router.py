from fastapi import APIRouter

from app.api import healthcheck

api_router = APIRouter()
api_router.include_router(healthcheck.router, tags=["Healthcheck"])
