<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập hệ thống</title>

    <!-- CSS dùng chung -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">

    <style>
        .login-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }

        .login-box {
            width: 400px;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.15);
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #111827;
        }

        label {
            font-weight: 600;
            display: block;
            margin-top: 14px;
            color: #374151;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
            outline: none;
        }

        input:focus, select:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 1px #2563eb;
        }

        button {
            width: 100%;
            margin-top: 24px;
            padding: 12px;
            border: none;
            background: linear-gradient(135deg, #2563eb, #3b82f6);
            color: white;
            font-size: 16px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(59,130,246,0.45);
        }

        .error {
            color: #dc2626;
            margin-top: 15px;
            text-align: center;
            font-weight: 600;
        }

        .register-link {
            text-align: center;
            margin-top: 18px;
        }

        .register-link a {
            color: #2563eb;
            font-weight: 600;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="page-wrapper">

    <div class="main-content">

        <div class="login-wrapper">
            <div class="login-box">
                <h2>🔐 Đăng nhập hệ thống</h2>

                <form action="<%= request.getContextPath() %>/login" method="post">

                    <label>Tên đăng nhập</label>
                    <input type="text" name="username" required>

                    <label>Mật khẩu</label>
                    <input type="password" name="password" required>

                    <label>Vai trò</label>
                    <select name="role">
                        <option value="USER">Người dùng</option>
                        <option value="STAFF">Nhân viên</option>
                        <option value="ADMIN">Quản lý</option>
                    </select>

                    <button type="submit">🚀 Đăng nhập</button>
                </form>

                <div class="register-link">
                    <a href="<%= request.getContextPath() %>/register">
                        ➕ Chưa có tài khoản? Đăng ký USER
                    </a>
                </div>

                <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                </c:if>
            </div>
        </div>

    </div>

    <!-- FOOTER -->
    <jsp:include page="/WEB-INF/pages/footer.jsp"/>

</div>

</body>
</html>
