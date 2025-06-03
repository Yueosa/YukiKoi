from fastapi import FastAPI, Query
from fastapi.middleware.cors import CORSMiddleware
import httpx
from typing import Any, Dict

app = FastAPI()

# 用于开发阶段，允许跨域
app.add_middleware(
    CORSMiddleware,
    allow_origins = ['http://127.0.0.1:3000', 'http://localhost:3000'],
    allow_credentials = True,
    allow_methods = ['*'],
    allow_headers = ['*'],
)

@app.get('/api/notes/md')
async def get_notesmd(url: str = Query('https://raw.githubusercontent.com/Yueosa/SakuraNotes/refs/heads/main/README.md', description='raw地址')) -> Dict[str, Any]:
    """
    获取指定 URL 的 Markdown 内容。

    参数:
    - url (str): 需要请求的原始地址。

    返回:
    - Dict[str, Any]: 包含请求内容或错误信息的字典。
    """
    try:
        async with httpx.AsyncClient() as client:
            r = await client.get(url, timeout = 10)
            r.raise_for_status()
            return {"content": r.text}
    except Exception as e:
        return {"error": str(e)}
