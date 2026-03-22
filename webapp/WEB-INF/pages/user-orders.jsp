<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đơn hàng của bạn</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

  <style>
    .order-container {
      max-width: 1000px;
      margin: 40px auto;
      background: #ffffff;
      padding: 30px;
      border-radius: 14px;
      box-shadow: 0 6px 20px rgba(0,0,0,0.08);
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 14px;
      border-bottom: 1px solid #e5e7eb;
      text-align: center;
    }

    th {
      background-color: #f3f4f6;
      font-weight: 600;
    }

    tr:hover {
      background-color: #f9fafb;
    }

    .status-wait {
      color: #d97706;
      font-weight: 600;
    }

    .status-ok {
      color: #16a34a;
      font-weight: 600;
    }

    .empty-text {
      padding: 20px;
      font-style: italic;
      color: #6b7280;
    }
  </style>
</head>

<body>

<div class="page-wrapper">

  <!-- HEADER -->
  <jsp:include page="/WEB-INF/pages/Uheader.jsp"/>

  <!-- MAIN -->
  <div class="main-content">

    <div class="order-container">
      <h2>📦 Đơn hàng của bạn</h2>

      <table>
        <tr>
          <th>Mã đơn</th>
          <th>Tổng tiền</th>
          <th>Trạng thái</th>
        </tr>

        <c:forEach items="${orders}" var="o">
          <tr>
            <!-- Mã đơn -->
            <td>#${o.id}</td>

            <!-- Tổng tiền -->
            <td>
              <c:choose>
                <c:when test="${o.tongTien != null}">
                  <fmt:formatNumber value="${o.tongTien}"
                                    type="number"
                                    groupingUsed="true"/> đ
                </c:when>
                <c:otherwise>
                  0 đ
                </c:otherwise>
              </c:choose>
            </td>

            <!-- Trạng thái -->
            <td>
              <c:choose>
                <c:when test="${o.trangThai == 'Chờ xác nhận'}">
                  <span class="status-wait">⏳ Chờ xác nhận</span>
                </c:when>
                <c:otherwise>
                  <span class="status-ok">✅ Đã xác nhận</span>
                </c:otherwise>
              </c:choose>
            </td>
          </tr>
        </c:forEach>

        <c:if test="${empty orders}">
          <tr>
            <td colspan="3" class="empty-text">
              Bạn chưa có đơn hàng nào
            </td>
          </tr>
        </c:if>
      </table>
    </div>

  </div>

  <!-- FOOTER -->
  <jsp:include page="/WEB-INF/pages/footer.jsp"/>

</div>

</body>
</html>
