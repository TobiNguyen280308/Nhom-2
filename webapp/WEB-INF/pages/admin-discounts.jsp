<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý mã giảm giá</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">

    <style>
        .admin-box {
            max-width: 1100px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 28px rgba(0,0,0,0.12);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            gap: 12px;
            margin-bottom: 25px;
        }

        form input {
            flex: 1;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
        }

        form button {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
            color: white;
        }

        form button:hover {
            opacity: 0.9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #1f2937;
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

        .active {
            color: #16a34a;
            font-weight: 600;
        }

        .inactive {
            color: #dc2626;
            font-weight: 600;
        }

        .action a {
            margin-right: 8px;
            text-decoration: none;
            font-weight: 600;
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

    <div class="main-content">

        <div class="admin-box">

            <h2>🎟️ QUẢN LÝ MÃ GIẢM GIÁ</h2>

            <!-- FORM THÊM / SỬA -->
            <form method="post">
                <input type="hidden" name="id" value="${editDiscount.id}">

                <input type="text"
                       name="code"
                       placeholder="Mã giảm giá"
                       value="${editDiscount.code}"
                       required>

                <input type="number"
                       name="value"
                       placeholder="Giá trị giảm (%)"
                       value="${editDiscount.value}"
                       required>

                <button type="submit">
                    <c:choose>
                        <c:when test="${empty editDiscount}">
                            ➕ Thêm
                        </c:when>
                        <c:otherwise>
                            💾 Cập nhật
                        </c:otherwise>
                    </c:choose>
                </button>
            </form>

            <!-- DANH SÁCH -->
            <table>
                <tr>
                    <th>ID</th>
                    <th>Mã</th>
                    <th>Giá trị</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>

                <c:forEach items="${list}" var="d">
                    <tr>
                        <td>${d.id}</td>
                        <td>${d.code}</td>
                        <td>${d.value}%</td>
                        <td>
                            <c:choose>
                                <c:when test="${d.active}">
                                    <span class="active">Hoạt động</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="inactive">Đã khóa</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="action">
                            <a href="?action=edit&id=${d.id}">Sửa</a>
                            <a href="?action=delete&id=${d.id}"
                               class="delete"
                               onclick="return confirm('Xóa mã giảm giá này?')">
                                Xóa
                            </a>
                        </td>
                    </tr>
                </c:forEach>

            </table>

        </div>

    </div>

    <jsp:include page="/WEB-INF/pages/footer.jsp"/>

</div>

</body>
</html>
