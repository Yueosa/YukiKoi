from fastapi import APIRouter, UploadFile, File, Form, HTTPException
from fastapi.responses import JSONResponse
from typing import Optional, List, Dict
import os, json, uuid, shutil
from datetime import datetime


router = APIRouter()


# 路径常量
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_PATH = os.path.join(BASE_DIR, 'data', 'everwhispers', 'messages.json')
UPLOAD_DIR = os.path.join(BASE_DIR, 'storage', 'everwhispers')
IMAGE_DIR = os.path.join(UPLOAD_DIR, 'images')
VIDEO_DIR = os.path.join(UPLOAD_DIR, 'videos')
AUDIO_DIR = os.path.join(UPLOAD_DIR, 'audios')


# 确保文件存在
for folder in [IMAGE_DIR, VIDEO_DIR, AUDIO_DIR]:
    os.makedirs(folder, exist_ok=True)


# ------------------ 数据操作 ------------------ #

def load_messages() -> List[Dict]:
    if not os.path.exists(DATA_PATH):
        return []
    with open(DATA_PATH, 'r', encoding='utf-8') as f:
        return json.load(f)
    
def save_messages(messages: List[Dict]):
    with open(DATA_PATH, 'w', encoding='utf-8') as f:
        json.dump(messages, f, ensure_ascii=False, indent=4)

# ------------------ API 路由 ------------------ #

@router.get('/everwhispers/messages')
async def get_messages():
    return load_messages()

@router.post('/everwhispers/messages')
async def post_messages(
    name: str = Form(...),
    message: str =Form(...),
    image: Optional[UploadFile] = File(None),
    video: Optional[UploadFile] = File(None),
    audio: Optional[UploadFile] = File(None),
):
    msg_id: str = str(uuid.uuid4())
    timestamp: str = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    files: Dict[str, str] = {"image": None, "video": None, "audio": None}

    def save_file(file: UploadFile, target_dir: str) -> str:
        filename: str = f"{msg_id}_{file.filename}"
        path: str = os.path.join(target_dir, filename)
        with open(path, 'wb') as f:
            shutil.copyfileobj(file.file, f)
        return filename
    
    if image:
        files['image'] = save_file(image, IMAGE_DIR)
    if video:
        files['video'] = save_file(video, VIDEO_DIR)
    if audio:
        files['audio'] = save_file(audio, AUDIO_DIR)

    new_msg: Dict[str, str | Dict[str, str]] = {
        "id": msg_id,
        "name": name,
        "message":message,
        "timestamp": timestamp,
        "files": files,
    }

    messages = load_messages()
    messages.append(new_msg)
    save_messages(messages)

    return JSONResponse(content={"status": "success", "id": msg_id})

@router.delete('/everwhispers/{id}')
async def delete_message(id: str):
    messages = load_messages()
    target = next((m for m in messages if m["id"] == id), None)
    if not target:
        raise HTTPException(status_code=404, detail="留言不存在")
    
    # 删除文件
    for ftype, fname in target.get('files', {}).items():
        if fname:
            path = os.path.join(UPLOAD_DIR, f"{ftype}s", fname)
            if os.path.exists(path):
                os.remove(path)

    # 删除消息
    messages = [m for m in messages if m["id"] != id]
    save_messages(messages)

    return {"status": "deleted", "id": id}
