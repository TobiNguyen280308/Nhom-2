<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>

    <!-- CSS dùng chung -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">

    <style>
        .register-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }

        .box {
            width: 400px;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
        }

        .box h2 {
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

        input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
            outline: none;
        }

        input:focus {
            border-color: #22c55e;
            box-shadow: 0 0 0 1px #22c55e;
        }

        button {
            width: 100%;
            margin-top: 24px;
            padding: 12px;
            border: none;
            background: linear-gradient(135deg, #16a34a, #22c55e);
            color: white;
            font-size: 16px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(34,197,94,0.4);
        }

        .error {
            color: #dc2626;
            margin-top: 15px;
            text-align: center;
            font-weight: 600;
        }

        .back {
            text-align: center;
            margin-top: 18px;
        }

        .back a {
            color: #2563eb;
            text-decoration: none;
            font-weight: 600;
        }

        .back a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="page-wrapper">

    <div class="main-content">

        <div class="register-wrapper">
            <div class="box">
                <h2>📝 Đăng ký USER</h2>

                <form method="post" action="<%= request.getContextPath() %>/register">

                    <label>Tên đăng nhập</label>
                    <input type="text" name="username" required>

                    <label>Mật khẩu</label>
                    <input type="password" name="password" required>

                    <label>Xác nhận mật khẩu</label>
                    <input type="password" name="confirm" required>

                    <button type="submit">🚀 Đăng ký</button>
                </form>

                <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                </c:if>

                <div class="back">
                    <a href="<%= request.getContextPath() %>/login">
                        ⬅ Quay lại đăng nhập
                    </a>
                </div>
            </div>
        </div>

    </div>

    <!-- FOOTER -->
    <jsp:include page="/WEB-INF/pages/footer.jsp"/>

</div>

</body>
</html>
