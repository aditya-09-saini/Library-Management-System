let allBooks = [], currentCategory = 'All', selectedBookId = null, isLoggedIn = false, userId = null;
function checkLoginStatus() {
    userId = localStorage.getItem('userId');
    const username = localStorage.getItem('username');
    if (userId && username) {
        isLoggedIn = true;
        document.getElementById('headerActions').innerHTML = `<span class="user-info">Welcome, ${username}</span><button class="logout-btn" onclick="logout()">Logout</button>`;
    }
}
function loadBooks() {
    fetch('/api/books').then(r => r.json()).then(data => { allBooks = data.books; loadCategories(); displayBooks(); }).catch(err => {
        console.error('Error:', err);
        document.getElementById('booksGrid').innerHTML = '<div class="no-books">Error loading books</div>';
    });
}
function loadCategories() {
    const categories = ['All', ...new Set(allBooks.map(b => b.category))];
    document.getElementById('categoryFilters').innerHTML = categories.map(c => 
        `<button class="category-btn ${c === 'All' ? 'active' : ''}" onclick="filterCategory('${c}')">${c}</button>`
    ).join('');
}
function displayBooks() {
    const grid = document.getElementById('booksGrid');
    const searchBox = document.getElementById('searchBox');
    
    if (!searchBox) {
        console.error('searchBox element not found');
        return;
    }
    
    const searchTerm = searchBox.value.toLowerCase().trim();
    console.log('Current search term:', searchTerm);
    console.log('Current category:', currentCategory);
    console.log('Total books:', allBooks.length);
    console.log('All books data:', allBooks);
    
    let filtered = allBooks.filter(b => {
        // Check category match (case-insensitive)
        const bookCategory = b.category ? b.category.toLowerCase() : '';
        const filterCategory = currentCategory === 'All' ? true : bookCategory === currentCategory.toLowerCase();
        
        // Check search match across title, author, and category
        const bookTitle = b.title ? b.title.toLowerCase() : '';
        const bookAuthor = b.author ? b.author.toLowerCase() : '';
        
        const matchSearch = !searchTerm || 
            bookTitle.includes(searchTerm) || 
            bookAuthor.includes(searchTerm) || 
            bookCategory.includes(searchTerm);
        
        return filterCategory && matchSearch;
    });
    
    console.log('Filtered books count:', filtered.length);
    console.log('Filtered books:', filtered);
    
    if (filtered.length === 0) { 
        grid.innerHTML = '<div class="no-books">No books found</div>'; 
        return; 
    }
    
    grid.innerHTML = filtered.map(b => `
        <div class="book-card">
            <h3>${b.title}</h3>
            <p class="book-info">Author: ${b.author}</p>
            <p class="book-info">Category: ${b.category}</p>
            <p class="book-info">Available copies: ${b.available_copies}</p>
            <button class="borrow-btn" onclick="borrowBook(${b.id}, '${b.title.replace(/'/g, "\\'")}')" ${!isLoggedIn || b.available_copies === 0 ? 'disabled' : ''}>
                ${!isLoggedIn ? 'Login to Borrow' : b.available_copies === 0 ? 'Not Available' : 'Borrow'}
            </button>
        </div>
    `).join('');
}
function filterCategory(cat) {
    currentCategory = cat;
    document.querySelectorAll('.category-btn').forEach(btn => {
        btn.classList.toggle('active', btn.textContent === cat);
    });
    displayBooks();
}

// Wait for DOM to be ready before attaching event listener
document.addEventListener('DOMContentLoaded', function() {
    const searchBox = document.getElementById('searchBox');
    if (searchBox) {
        searchBox.addEventListener('input', function(event) {
            console.log('Search input event triggered:', event.target.value);
            displayBooks();
        });
    } else {
        console.warn('searchBox element not found when attaching listener');
    }
});

// Fallback: attach event listener if DOM is already loaded
if (document.readyState === 'loading') {
    // DOM is still loading, listener above will handle it
} else {
    // DOM is already loaded, attach listener now
    const searchBox = document.getElementById('searchBox');
    if (searchBox) {
        searchBox.addEventListener('input', function(event) {
            console.log('Search input event triggered (fallback):', event.target.value);
            displayBooks();
        });
    }
}
function borrowBook(bookId, bookTitle) {
    if (!isLoggedIn) { alert('Please login to borrow books'); return; }
    selectedBookId = bookId;
    const today = new Date().toLocaleDateString();
    const due = new Date(); due.setDate(due.getDate() + 15);
    document.getElementById('borrowMessage').innerHTML = `Are you sure you want to borrow "<strong>${bookTitle}</strong>"?<br><br>Issue Date: ${today}<br>Due Date: ${due.toLocaleDateString()}`;
    document.getElementById('borrowModal').style.display = 'block';
}
function confirmBorrow() {
    fetch('/api/borrow', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ user_id: userId, book_id: selectedBookId })
    }).then(r => r.json()).then(data => {
        if (data.success) { alert('Book borrowed successfully!'); closeModal(); loadBooks(); }
        else { alert(data.message || 'Failed to borrow book'); }
    }).catch(err => { console.error(err); alert('An error occurred'); });
}
function closeModal() { document.getElementById('borrowModal').style.display = 'none'; selectedBookId = null; }
function logout() { localStorage.clear(); window.location.reload(); }
function goToLogin() { window.location.href = '/'; }
checkLoginStatus(); loadBooks();