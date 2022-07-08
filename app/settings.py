from pydantic import BaseSettings


class Settings(BaseSettings):
    """App settings"""

    host: str
    port: int

    service_name: str = "app"
    workers_count: int

    reload: bool

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"
        env_prefix = "APP_"


settings = Settings()
