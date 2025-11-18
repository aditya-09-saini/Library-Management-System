import mysql.connector
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'aditya03',  
    'database': 'library'
}

def get_db_connection():
    """Create and return a database connection"""
    return mysql.connector.connect(**DB_CONFIG)

