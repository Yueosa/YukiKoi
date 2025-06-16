from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from api import notes, messages

app = FastAPI()
app.include_router(notes.router, prefix='/api')
app.include_router(messages.router, prefix='/api')
from fastapi.staticfiles import StaticFiles

# 挂载静态文件目录
app.mount("/storage", StaticFiles(directory="storage"), name="storage")

app.add_middleware(
    CORSMiddleware,
    allow_origins = ['http://127.0.0.1:3000', 'http://localhost:3000'],
    allow_credentials = True,
    allow_methods = ['*'],
    allow_headers = ['*'],
)

