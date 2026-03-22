<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lịch sử mua hàng</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">

    <style>
        html, body { height: 100%; }
        body {
            background: #f3f4f6;
            display: flex;
            flex-direction: column;
        }
        .page-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        .main-content { flex: 1; }

        .user-container {
            max-width: 1200px;
            margin: 40px auto;
            background: #ffffff;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 10px 28px rgba(0,0,0,0.12);
        }

        .user-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #111827;
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

        .status {
            font-weight: 700;
            color: #16a34a;
        }

        .empty {
            text-align: center;
            padding: 60px;
            color: #6b7280;
            font-size: 16px;
        }
    </style>
</head>

<body>

<div class="page-wrapper">

    <jsp:include page="/WEB-INF/pages/Uheader.jsp"/>

    <div class="main-content">
        <div class="user-container">

            <h2>🧾 LỊCH SỬ ĐƠN HÀNG ĐÃ MUA</h2>

            <c:choose>
                <c:when test="${empty orders}">
                    <div class="empty">
                        Bạn chưa có đơn hàng nào được admin duyệt.
                    </div>
                </c:when>

                <c:otherwise>
                    <table>
                        <tr>
                            <th>Mã đơn</th>
                            <th>Ngày đặt</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                        </tr>

                        <c:forEach var="o" items="${orders}">
                            <tr>
                                <td>#${o.id}</td>
                                <td>
                                    <fmt:formatDate value="${o.ngayTao}" pattern="dd/MM/yyyy HH:mm"/>
                                </td>
                                <td>
                                    <fmt:formatNumber value="${o.tongTien}" groupingUsed="true"/> đ
                                </td>
                                <td>
                                    <span class="status">✅ Đã mua</span>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>

        </div>
    </div>

    <jsp:include page="/WEB-INF/pages/footer.jsp"/>

</div>

</body>
</html>
