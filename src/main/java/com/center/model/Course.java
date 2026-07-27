package com.center.model;

public class Course {
    private int courseId;
    private String courseName;
    private int totalSessions;
    private int teacherId;

    public Course() {}

    public Course(int courseId, String courseName, int totalSessions, int teacherId) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.totalSessions = totalSessions;
        this.teacherId = teacherId;
    }

    public int getCourseId() { return courseId; }
    public void setCourseId(int courseId) { this.courseId = courseId; }
    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }
    public int getTotalSessions() { return totalSessions; }
    public void setTotalSessions(int totalSessions) { this.totalSessions = totalSessions; }
    public int getTeacherId() { return teacherId; }
    public void setTeacherId(int teacherId) { this.teacherId = teacherId; }
}
