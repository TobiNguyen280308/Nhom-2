<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Giỏ hàng</title>

  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">

  <style>
    .cart-container {
      max-width: 1100px;
      margin: 40px auto;
      background: white;
      padding: 30px;
      border-radius: 14px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.12);
    }

    h2 {
      margin-bottom: 25px;
      font-size: 26px;
      color: #111827;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 14px 16px;
      text-align: left;
    }

    th {
      background: #111827;
      color: white;
      font-weight: 600;
    }

    tr:nth-child(even) {
      background: #f9fafb;
    }

    tr:hover {
      background: #eef2ff;
    }

    .empty {
      text-align: center;
      padding: 30px;
      color: #6b7280;
      font-size: 16px;
    }

    .total {
      margin-top: 25px;
      font-size: 20px;
      font-weight: 700;
      text-align: right;
    }

    .checkout {
      margin-top: 30px;
      text-align: right;
    }

    .checkout button {
      padding: 12px 30px;
      background: linear-gradient(135deg, #2563eb, #1e40af);
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      font-weight: 700;
      cursor: pointer;
      transition: 0.3s;
    }

    .checkout button:hover {
      background: linear-gradient(135deg, #1e40af, #1e3a8a);
    }
  </style>
</head>

<body>

<jsp:include page="/WEB-INF/pages/Uheader.jsp"/>

<div class="cart-container">

  <h2>🛒 Giỏ hàng của bạn</h2>

  <table>
    <tr>
      <th>Tên sản phẩm</th>
      <th>Giá</th>
      <th>Số lượng</th>
      <th>Thành tiền</th>
    </tr>

    <c:set var="tongTien" value="0"/>

    <c:forEach items="${cart}" var="item">
      <tr>
        <td>${item.value.sanPham.tenSanPham}</td>

        <td>
          <fmt:formatNumber value="${item.value.sanPham.gia}"
                            type="number" groupingUsed="true"/> đ
        </td>

        <td>${item.value.soLuong}</td>

        <td>
          <fmt:formatNumber value="${item.value.thanhTien}"
                            type="number" groupingUsed="true"/> đ
        </td>
      </tr>

      <c:set var="tongTien"
             value="${tongTien + item.value.thanhTien}"/>
    </c:forEach>

    <c:if test="${empty cart}">
      <tr>
        <td colspan="4" class="empty">Giỏ hàng trống</td>
      </tr>
    </c:if>
  </table>

  <div class="total">
    Tổng tiền:
    <fmt:formatNumber value="${tongTien}"
                      type="number" groupingUsed="true"/> đ
  </div>

  <!-- ✅ GIỮ NGUYÊN LOGIC POST -->
  <div class="checkout">
    <form action="${pageContext.request.contextPath}/user/orders"
          method="post">
      <button type="submit">💳 Thanh toán</button>
    </form>
  </div>

</div>

<jsp:include page="/WEB-INF/pages/footer.jsp"/>

</body>
</html>
