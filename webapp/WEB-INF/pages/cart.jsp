<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>

    <!-- CSS dùng chung -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">

    <style>
        .cart-container {
            max-width: 1100px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
        }

        .cart-container h2 {
            margin-bottom: 25px;
            color: #111827;
            text-align: center;
        }

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

        .empty-cart {
            text-align: center;
            padding: 30px;
            font-size: 16px;
            color: #6b7280;
        }

        .checkout {
            margin-top: 25px;
            text-align: right;
        }

        .checkout a {
            display: inline-block;
            padding: 12px 26px;
            background: linear-gradient(135deg, #16a34a, #22c55e);
            color: white;
            font-weight: 600;
            border-radius: 8px;
            text-decoration: none;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .checkout a:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(34,197,94,0.5);
        }
    </style>
</head>

<body>

<div class="page-wrapper">

    <!-- HEADER USER -->
    <jsp:include page="/WEB-INF/pages/Uheader.jsp"/>

    <!-- NỘI DUNG -->
    <div class="main-content">

        <div class="cart-container">
            <h2>🛒 GIỎ HÀNG CỦA BẠN</h2>

            <table>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                </tr>

                <c:forEach items="${sessionScope.cart.values()}" var="item">
                    <tr>
                        <td>${item.sanPham.tenSanPham}</td>
                        <td>${item.soLuong}</td>
                        <td>${item.sanPham.gia} đ</td>
                    </tr>
                </c:forEach>

                <c:if test="${empty sessionScope.cart}">
                    <tr>
                        <td colspan="3" class="empty-cart">
                            🧺 Giỏ hàng của bạn đang trống
                        </td>
                    </tr>
                </c:if>
            </table>

            <div class="checkout">
                <a href="checkout">✅ ĐẶT HÀNG</a>
            </div>
        </div>

    </div>

    <!-- FOOTER -->
    <jsp:include page="/WEB-INF/pages/footer.jsp"/>

</div>

</body>
</html>
