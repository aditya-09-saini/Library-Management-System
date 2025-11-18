from flask import Flask, render_template, request, jsonify, session
from flask_cors import CORS
from datetime import datetime, timedelta
from db import get_db_connection
from routes.books import books_bp
from routes.borrow import borrow_bp

app = Flask(__name__)
app.secret_key = 'your_secret_key_here_change_in_production'
CORS(app)

app.register_blueprint(books_bp)
app.register_blueprint(borrow_bp)

@app.route('/')
def index():
    """Login page"""
    return render_template('login.html')

@app.route('/home')
def home():
    """Home page with books"""
    return render_template('home.html')

@app.route('/login', methods=['POST'])
def login():
    """Handle login requests"""
    try:
        data = request.get_json()
        username = data.get('username')
        password = data.get('password')

        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        
        # Check credentials
        cursor.execute(
            "SELECT id, username, role FROM users WHERE username = %s AND password_hash = %s",
            (username, password)
        )
        user = cursor.fetchone()
        
        cursor.close()
        conn.close()

        if user:
            session['user_id'] = user['id']
            session['username'] = user['username']
            session['role'] = user['role']
            
            return jsonify({
                'success': True,
                'user_id': user['id'],
                'username': user['username'],
                'role': user['role']
            })
        else:
            return jsonify({
                'success': False,
                'message': 'Invalid username or password'
            })
    except Exception as e:
        print(f"Login error: {e}")
        return jsonify({
            'success': False,
            'message': 'An error occurred during login'
        }), 500

if __name__ == '__main__':
    app.run(debug=True, port=5000)
