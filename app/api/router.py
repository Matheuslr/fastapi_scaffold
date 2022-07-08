from fastapi import APIRouter

from app.api import docs, healthcheck

api_router = APIRouter()
api_router.include_router(docs.router)
api_router.include_router(healthcheck.router, tags=["Healthcheck"])
