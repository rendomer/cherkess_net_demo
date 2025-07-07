import json
import os
from typing import List, Dict, Optional

DATA_PATH = r"C:\cherkess_net\backend\app\data"
USERS_FILE = os.path.join(DATA_PATH, "users.json")
PHOTOS_FOLDER = os.path.join(DATA_PATH, "photos")

def load_users() -> List[Dict]:
    if not os.path.exists(USERS_FILE):
        return []
    with open(USERS_FILE, "r", encoding="utf-8") as f:
        return json.load(f)

def save_users(users: List[Dict]) -> None:
    with open(USERS_FILE, "w", encoding="utf-8") as f:
        json.dump(users, f, ensure_ascii=False, indent=2)

def find_user_by_id(user_id: str) -> Optional[Dict]:
    users = load_users()
    for user in users:
        if user.get("id") == user_id:
            return user
    return None

def add_user(new_user: Dict) -> bool:
    users = load_users()
    if find_user_by_id(new_user.get("id")) is not None:
        return False  # Пользователь с таким ID уже есть
    users.append(new_user)
    save_users(users)
    return True

def update_user(user_id: str, updated_data: Dict) -> bool:
    users = load_users()
    for i, user in enumerate(users):
        if user.get("id") == user_id:
            users[i].update(updated_data)
            save_users(users)
            return True
    return False
