package com.center.controller;

import com.center.dao.AdminDAO;
import com.center.dao.RegistrarDAO;
import com.center.dao.TeacherDAO;
import com.center.model.Course;
import com.center.model.Student;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ActionServlet")
public class ActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("addCourse".equals(action)) {
            String name = request.getParameter("courseName");
            int sessions = Integer.parseInt(request.getParameter("sessions"));
            int teacherId = Integer.parseInt(request.getParameter("teacherId"));
            
            Course course = new Course(0, name, sessions, teacherId);
            AdminDAO adminDAO = new AdminDAO();
            adminDAO.addCourse(course);
            response.sendRedirect("admin.jsp?status=success");
            
        } else if ("registerStudent".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            
            Student student = new Student(0, name, email, phone);
            RegistrarDAO regDAO = new RegistrarDAO();
            regDAO.registerStudent(student);
            response.sendRedirect("registrar.jsp?status=registered");
            
        } else if ("enrollStudent".equals(action)) {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            
            RegistrarDAO regDAO = new RegistrarDAO();
            regDAO.enrollStudentInCourse(studentId, courseId);
            response.sendRedirect("registrar.jsp?status=enrolled");
            
        } else if ("submitGrade".equals(action)) {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            double grade = Double.parseDouble(request.getParameter("grade"));
            
            TeacherDAO teacherDAO = new TeacherDAO();
            teacherDAO.submitGrade(studentId, courseId, grade);
            response.sendRedirect("teacher.jsp?status=gradeUpdated");
            
        } else if ("recordAttendance".equals(action)) {
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int sessionNum = Integer.parseInt(request.getParameter("sessionNumber"));
            String status = request.getParameter("status");
            Date date = Date.valueOf(request.getParameter("date"));
            
            TeacherDAO teacherDAO = new TeacherDAO();
            teacherDAO.recordAttendance(courseId, studentId, sessionNum, status, date);
            response.sendRedirect("teacher.jsp?status=attendanceRecorded");
        }
    }
}
