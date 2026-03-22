<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý tài khoản</title>

    <!-- CSS dùng chung -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">

    <style>
        .admin-container {
            max-width: 1200px;
            margin: 40px auto;
            background: white;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 10px 28px rgba(0,0,0,0.12);
        }

        .admin-container h2 {
            margin-bottom: 25px;
            text-align: center;
            color: #111827;
        }

        /* ===== FORM ===== */
        .user-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 15px;
            margin-bottom: 30px;
        }

        .user-form input,
        .user-form select {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
            font-size: 14px;
        }

        .user-form button {
            grid-column: span 2;
            padding: 12px;
            background: linear-gradient(135deg, #2563eb, #1e40af);
            color: white;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.25s;
        }

        .user-form button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(37,99,235,0.5);
        }

        .user-form a {
            display: flex;
            align-items: center;
            justify-content: center;
            background: #9ca3af;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }

        .user-form a:hover {
            background: #6b7280;
        }

        /* ===== TABLE ===== */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #1f2933;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover td {
            background: #f9fafb;
        }

        .status-active {
            color: #16a34a;
            font-weight: 600;
        }

        .status-lock {
            color: #dc2626;
            font-weight: 600;
        }

        .action a {
            margin-right: 10px;
            text-decoration: none;
            font-weight: 600;
        }

        .action a.edit {
            color: #2563eb;
        }

        .action a.delete {
            color: #dc2626;
        }
    </style>
</head>

<body>

<div class="page-wrapper">

    <!-- HEADER -->
    <jsp:include page="/WEB-INF/pages/Aheader.jsp"/>

    <!-- NỘI DUNG -->
    <div class="main-content">

        <div class="admin-container">

            <h2>👤 QUẢN LÝ TÀI KHOẢN</h2>

            <!-- FORM -->
            <form method="post" class="user-form">

                <c:if test="${not empty editUser}">
                    <input type="hidden" name="id" value="${editUser.id}">
                </c:if>

                <input name="tenDangNhap"
                       placeholder="Tên đăng nhập"
                       value="${editUser.tenDangNhap}"
                       required>

                <input name="matKhau"
                       type="password"
                       placeholder="Mật khẩu"
                       value="${editUser.matKhau}"
                       required>

                <select name="vaiTro">
                    <option value="ADMIN" ${editUser.vaiTro == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
                    <option value="STAFF" ${editUser.vaiTro == 'STAFF' ? 'selected' : ''}>STAFF</option>
                    <option value="USER" ${editUser.vaiTro == 'USER' ? 'selected' : ''}>USER</option>
                </select>

                <button type="submit">
                    <c:choose>
                        <c:when test="${empty editUser}">➕ THÊM TÀI KHOẢN</c:when>
                        <c:otherwise>💾 CẬP NHẬT</c:otherwise>
                    </c:choose>
                </button>

                <c:if test="${not empty editUser}">
                    <a href="users">❌ HỦY</a>
                </c:if>

            </form>

            <!-- TABLE -->
            <table>
                <tr>
                    <th>ID</th>
                    <th>Tên đăng nhập</th>
                    <th>Vai trò</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>

                <c:forEach items="${list}" var="u">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.tenDangNhap}</td>
                        <td>${u.vaiTro}</td>
                        <td>
                            <c:choose>
                                <c:when test="${u.trangThai}">
                                    <span class="status-active">Hoạt động</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-lock">Khóa</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="action">
                            <a class="edit" href="users?action=edit&id=${u.id}">✏️ Sửa</a>
                            <a class="delete"
                               href="users?action=delete&id=${u.id}"
                               onclick="return confirm('Xóa tài khoản này?')">
                                🗑 Xóa
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </div>

    </div>

    <!-- FOOTER -->
    <jsp:include page="/WEB-INF/pages/footer.jsp"/>

</div>

</body>
</html>
