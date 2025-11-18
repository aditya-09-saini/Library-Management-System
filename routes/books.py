from flask import Blueprint, jsonify
from db import get_db_connection

books_bp = Blueprint('books_bp', __name__)

@books_bp.route('/api/books')
def get_books():
    """Get all books with their details"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        query = """
            SELECT b.id, b.title, b.author, c.name as category,
                   b.available_copies, b.total_copies
            FROM books b
            JOIN categories c ON b.category_id = c.id
            ORDER BY b.title
        """
        cursor.execute(query)
        books = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify({'books': books})
    except Exception as e:
        print(f"Error fetching books: {e}")
        return jsonify({'books': [], 'error': str(e)}), 500
