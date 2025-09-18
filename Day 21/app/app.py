import os
from flask import Flask
import psycopg2

app = Flask(__name__)

# Read secrets from Docker secrets
with open("/run/secrets/db_user", "r") as f:
    DB_USER = f.read().strip()

with open("/run/secrets/db_password", "r") as f:
    DB_PASSWORD = f.read().strip()

DB_HOST = os.getenv("DB_HOST", "db")
DB_NAME = os.getenv("DB_NAME", "mydb")

@app.route("/")
def index():
    try:
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST
        )
        return "✅ Connected to database successfully!"
    except Exception as e:
        return f"❌ Connection failed: {e}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
