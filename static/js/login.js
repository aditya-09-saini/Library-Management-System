function handleLogin() {
    const userId = document.getElementById('userId').value;
    const password = document.getElementById('password').value;
    const errorMessage = document.getElementById('errorMessage');
    // Hide error message
    errorMessage.classList.remove('show');
    // Validate inputs
    if (!userId || !password) {
        errorMessage.textContent = 'Please enter both User ID and Password';
        errorMessage.classList.add('show');
        return;
    }
    // Send login request to backend
    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            username: userId,
            password: password
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Store user data
            localStorage.setItem('userId', data.user_id);
            localStorage.setItem('username', data.username);
            localStorage.setItem('role', data.role);
            // Redirect to main page
            window.location.href = '/home';
        } else {
            errorMessage.textContent = data.message || 'Invalid credentials';
            errorMessage.classList.add('show');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        errorMessage.textContent = 'An error occurred. Please try again.';
        errorMessage.classList.add('show');
    });
}
// Allow Enter key to submit
document.getElementById('password').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
        handleLogin();
    }
});