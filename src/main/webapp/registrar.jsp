<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>لوحة موظف التسجيل</title>
    <style>
        body { font-family: Arial, sans-serif; direction: rtl; margin: 30px; background-color: #f9f9f9; }
        .header { background: #16a085; color: white; padding: 15px; border-radius: 5px; }
        .section { background: white; padding: 20px; margin-top: 20px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
        input, button { padding: 8px; margin: 5px; border-radius: 4px; border: 1px solid #ccc; }
        button { background: #1abc9c; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <div class="header">
        <h1>لوحة موظف التسجيل</h1>
    </div>

    <div class="section">
        <h3>تسجيل طالب جديد في النظام</h3>
        <form action="ActionServlet" method="post">
            <input type="hidden" name="action" value="registerStudent">
            <input type="text" name="name" placeholder="اسم الطالب الكامل" required>
            <input type="email" name="email" placeholder="البريد الإلكتروني" required>
            <input type="text" name="phone" placeholder="رقم الهاتف" required>
            <button type="submit">تسجيل الطالب</button>
        </form>
    </div>

    <div class="section">
        <h3>تسجيل طالب في دورة تدريبية</h3>
        <form action="ActionServlet" method="post">
            <input type="hidden" name="action" value="enrollStudent">
            <input type="number" name="studentId" placeholder="رقم الطالب التعريفي" required>
            <input type="number" name="courseId" placeholder="رقم الدورة التعريفي" required>
            <button type="submit">تثبيت التسجيل في الدورة</button>
        </form>
    </div>
</body>
</html>
