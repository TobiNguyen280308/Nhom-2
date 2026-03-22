<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>

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
            text-align: center;
            margin-bottom: 25px;
            color: #111827;
        }

        /* ===== FORM ===== */
        .product-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 15px;
            margin-bottom: 30px;
        }

        .product-form input {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
            font-size: 14px;
        }

        .product-form button {
            grid-column: span 2;
            padding: 12px;
            background: linear-gradient(135deg, #16a34a, #15803d);
            color: white;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.25s;
        }

        .product-form button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(22,163,74,0.45);
        }

        .product-form a {
            display: flex;
            align-items: center;
            justify-content: center;
            background: #9ca3af;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }

        .product-form a:hover {
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

            <h2>📦 QUẢN LÝ SẢN PHẨM</h2>

            <!-- FORM -->
            <form method="post" class="product-form">

                <c:if test="${not empty editProduct}">
                    <input type="hidden"
                           name="idSanPham"
                           value="${editProduct.idSanPham}">
                </c:if>

                <input name="tenSanPham"
                       placeholder="Tên sản phẩm"
                       value="${editProduct.tenSanPham}"
                       required>

                <input name="moTa"
                       placeholder="Mô tả"
                       value="${editProduct.moTa}">

                <input name="gia"
                       type="number"
                       step="0.01"
                       placeholder="Giá"
                       value="${editProduct.gia}"
                       required>

                <input name="soLuong"
                       type="number"
                       placeholder="Số lượng"
                       value="${editProduct.soLuong}"
                       required>

                <button type="submit">
                    <c:choose>
                        <c:when test="${empty editProduct}">
                            ➕ THÊM SẢN PHẨM
                        </c:when>
                        <c:otherwise>
                            💾 CẬP NHẬT
                        </c:otherwise>
                    </c:choose>
                </button>

                <c:if test="${not empty editProduct}">
                    <a href="products">❌ HỦY</a>
                </c:if>

            </form>

            <!-- TABLE -->
            <table>
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Hành động</th>
                </tr>

                <c:forEach items="${list}" var="sp">
                    <tr>
                        <td>${sp.idSanPham}</td>
                        <td>${sp.tenSanPham}</td>
                        <td>${sp.gia}</td>
                        <td>${sp.soLuong}</td>
                        <td class="action">
                            <a class="edit"
                               href="products?action=edit&id=${sp.idSanPham}">
                                ✏️ Sửa
                            </a>
                            <a class="delete"
                               href="products?action=delete&id=${sp.idSanPham}"
                               onclick="return confirm('Xóa sản phẩm này?')">
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
