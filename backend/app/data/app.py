from flask import Flask, jsonify, request
from users_data import load_users, add_user, find_user_by_id

app = Flask(__name__)

@app.route("/users", methods=["GET"])
def get_users():
    users = load_users()
    return jsonify(users), 200

@app.route("/users/<user_id>", methods=["GET"])
def get_user(user_id):
    user = find_user_by_id(user_id)
    if user:
        return jsonify(user), 200
    return jsonify({"error": "User not found"}), 404

@app.route("/users", methods=["POST"])
def create_user():
    data = request.get_json()
    if not data or "id" not in data:
        return jsonify({"error": "Invalid user data"}), 400
    success = add_user(data)
    if not success:
        return jsonify({"error": "User with this ID already exists"}), 409
    return jsonify({"message": "User added"}), 201

if __name__ == "__main__":
    app.run(debug=True)
