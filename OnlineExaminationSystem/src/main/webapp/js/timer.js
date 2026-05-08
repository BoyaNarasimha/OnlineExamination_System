/**
 * 
 */// 10 minute timer = 600 seconds
let timeLeft = 600;
const timerDisplay = document.getElementById("timer");

const countdown = setInterval(() => {
    let minutes = Math.floor(timeLeft / 60);
    let seconds = timeLeft % 60;
    
    timerDisplay.textContent = 
        String(minutes).padStart(2, "0") + ":" + 
        String(seconds).padStart(2, "0");
    
    // Warning when 2 minutes left
    if (timeLeft <= 120) {
        timerDisplay.classList.add("timer-warning");
    }
    
    // Auto submit when time runs out
    if (timeLeft <= 0) {
        clearInterval(countdown);
        alert("⏰ Time is up! Submitting your exam automatically.");
        document.getElementById("examForm").submit();
    }
    
    timeLeft--;
}, 1000);

function confirmSubmit() {
    return confirm("Are you sure you want to submit the exam?");
}