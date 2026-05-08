package com.exam.model;

public class Result {
    private int resultId;
    private int userId;
    private String studentName;
    private String subject;
    private int score;
    private int totalQuestions;
    private double percentage;
    private String examDate;
    
    public Result() {}
    
    // Getters and Setters
    public int getResultId() { return resultId; }
    public void setResultId(int resultId) { this.resultId = resultId; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    
    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }
    
    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }
    
    public int getTotalQuestions() { return totalQuestions; }
    public void setTotalQuestions(int totalQuestions) { this.totalQuestions = totalQuestions; }
    
    public double getPercentage() { return percentage; }
    public void setPercentage(double percentage) { this.percentage = percentage; }
    
    public String getExamDate() { return examDate; }
    public void setExamDate(String examDate) { this.examDate = examDate; }
}