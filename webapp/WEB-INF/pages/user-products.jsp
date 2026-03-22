<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Sản phẩm</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

  <style>
    .product-container {
      max-width: 1200px;
      margin: 40px auto;
      background: white;
      padding: 30px;
      border-radius: 14px;
      box-shadow: 0 6px 18px rgba(0,0,0,0.1);
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
    }

    table {
      border-collapse: collapse;
      width: 100%;
    }

    th, td {
      padding: 12px;
      border-bottom: 1px solid #e5e7eb;
      text-align: center;
    }

    th {
      background: #f3f4f6;
      font-weight: 600;
    }

    tr:hover {
      background: #f9fafb;
    }

    .price {
      font-weight: 600;
      color: #dc2626;
    }

    .add-form {
      display: flex;
      justify-content: center;
      gap: 8px;
    }

    .add-form input[type="number"] {
      width: 70px;
      padding: 6px;
      border-radius: 6px;
      border: 1px solid #d1d5db;
    }

    .btn-add {
      background: #2563eb;
      color: white;
      border: none;
      padding: 8px 14px;
      border-radius: 6px;
      cursor: pointer;
      font-weight: 600;
      transition: background 0.25s ease;
    }

    .btn-add:hover {
      background: #1e40af;
    }

    .empty {
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

  <!-- MAIN CONTENT -->
  <div class="main-content">

    <div class="product-container">
      <h2>🛒 Danh sách sản phẩm</h2>

      <table>
        <tr>
          <th>Tên sản phẩm</th>
          <th>Mô tả</th>
          <th>Giá</th>
          <th>Số lượng</th>
          <th>Hành động</th>
        </tr>

        <c:forEach var="sp" items="${list}">
          <tr>
            <td>${sp.tenSanPham}</td>
            <td>${sp.moTa}</td>
            <td class="price">
              <fmt:formatNumber value="${sp.gia}"
                                type="number"
                                groupingUsed="true"/> đ
            </td>
            <td>${sp.soLuong}</td>
            <td>
              <form class="add-form"
                    action="${pageContext.request.contextPath}/user/cart"
                    method="post">
                <input type="hidden" name="id" value="${sp.idSanPham}"/>
                <input type="number"
                       name="soLuong"
                       value="1"
                       min="1"
                       max="${sp.soLuong}">
                <button class="btn-add" type="submit">
                  ➕ Thêm
                </button>
              </form>
            </td>
          </tr>
        </c:forEach>

        <c:if test="${empty list}">
          <tr>
            <td colspan="5" class="empty">
              Không có sản phẩm nào
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
