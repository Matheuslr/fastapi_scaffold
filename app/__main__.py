from uvicorn import Config, Server

from app.settings import settings


def main() -> None:

    server = Server(
        Config(
            "app.application:get_app",
            host=settings.host,
            port=settings.port,
            workers=settings.workers_count,
            reload=settings.reload,
            factory=True,
        ),
    )
    server.run()


if __name__ == "__main__":
    main()
