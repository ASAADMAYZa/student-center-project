<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>لوحة المدرس</title>
    <style>
        body { font-family: Arial, sans-serif; direction: rtl; margin: 30px; background-color: #f9f9f9; }
        .header { background: #d35400; color: white; padding: 15px; border-radius: 5px; }
        .section { background: white; padding: 20px; margin-top: 20px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
        input, select, button { padding: 8px; margin: 5px; border-radius: 4px; border: 1px solid #ccc; }
        button { background: #e67e22; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <div class="header">
        <h1>لوحة تحكم المدرس</h1>
    </div>

    <div class="section">
        <h3>فتح جلسة جديدة وتسجيل الحضور</h3>
        <form action="ActionServlet" method="post">
            <input type="hidden" name="action" value="recordAttendance">
            <input type="number" name="courseId" placeholder="رقم الدورة" required>
            <input type="number" name="studentId" placeholder="رقم الطالب" required>
            <input type="number" name="sessionNumber" placeholder="رقم الجلسة (مثال: 1)" required>
            <input type="date" name="date" required>
            <select name="status">
                <option value="Present">حاضر</option>
                <option value="Absent">غائب</option>
            </select>
            <button type="submit">تأكيد الحضور</button>
        </form>
    </div>

    <div class="section">
        <h3>رصد وعلامات الطلاب</h3>
        <form action="ActionServlet" method="post">
            <input type="hidden" name="action" value="submitGrade">
            <input type="number" name="studentId" placeholder="رقم الطالب" required>
            <input type="number" name="courseId" placeholder="رقم الدورة" required>
            <input type="number" step="0.01" name="grade" placeholder="العلامة المستحقة" required>
            <button type="submit">حفظ العلامة</button>
        </form>
    </div>
</body>
</html>
