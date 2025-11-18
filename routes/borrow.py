from flask import Blueprint, jsonify, request
from datetime import datetime, timedelta
from db import get_db_connection

borrow_bp = Blueprint('borrow_bp', __name__)

@borrow_bp.route('/api/borrow', methods=['POST'])
def borrow_book():
    """Handle book borrowing"""
    try:
        data = request.get_json()
        user_id = data.get('user_id')
        book_id = data.get('book_id')
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            "SELECT available_copies FROM books WHERE id = %s",
            (book_id,)
        )
        result = cursor.fetchone()
        if not result or result[0] <= 0:
            cursor.close()
            conn.close()
            return jsonify({
                'success': False,
                'message': 'Book is not available'
            })
        borrow_date = datetime.now().date()
        due_date = borrow_date + timedelta(days=15)
        cursor.execute(
            """INSERT INTO borrow_records (user_id, book_id, borrow_date, due_date)
               VALUES (%s, %s, %s, %s)""",
            (user_id, book_id, borrow_date, due_date)
        )
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({
            'success': True,
            'message': 'Book borrowed successfully',
            'due_date': due_date.strftime('%Y-%m-%d')
        })
    except Exception as e:
        print(f"Error borrowing book: {e}")
        return jsonify({
            'success': False,
            'message': 'An error occurred while borrowing the book'
        }), 500
