from fastapi import FastAPI

app = FastAPI(
    title="VibinEars API",
    version="0.1.0",
)


@app.get("/health")
def health_check() -> dict[str, str]:
    return {"status": "ok"}


@app.get("/ready")
def readiness_check() -> dict[str, str]:
    return {"status": "ready"}
