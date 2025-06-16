from fastapi import APIRouter
import httpx
from typing import Any, Dict

router = APIRouter()

@router.get("/notes/md")
async def get_notesmd() -> Dict[str, Any]:
    url = "https://raw.githubusercontent.com/Yueosa/SakuraNotes/refs/heads/main/README.md"
    try:
        async with httpx.AsyncClient() as client:
            r = await client.get(url, timeout=10)
            r.raise_for_status()
            return {"content": r.text}
    except Exception as e:
        return {"error": str(e)}
