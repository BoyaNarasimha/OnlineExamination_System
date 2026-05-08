/**
 * 
 */function validateForm() {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const username = document.getElementById("username").value;
    const fullName = document.getElementById("fullName").value;
    
    if (fullName.trim().length < 3) {
        alert("Full name must be at least 3 characters!");
        return false;
    }
    
    if (username.trim().length < 4) {
        alert("Username must be at least 4 characters!");
        return false;
    }
    
    if (password.length < 6) {
        alert("Password must be at least 6 characters!");
        return false;
    }
    
    if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return false;
    }
    
    return true;
}