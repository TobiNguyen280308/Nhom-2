<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Quản lý sản phẩm - STAFF</title>

  <!-- CSS dùng chung -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">

  <style>
    h2 {
      margin-bottom: 20px;
    }

    .toolbar {
      margin-bottom: 20px;
    }

    .btn {
      display: inline-block;
      padding: 10px 18px;
      border-radius: 6px;
      text-decoration: none;
      font-weight: 600;
      transition: all 0.25s ease;
    }

    .btn-add {
      background: #16a34a;
      color: white;
    }

    .btn-add:hover {
      background: #15803d;
    }

    table {
      border-collapse: collapse;
      width: 100%;
      background: white;
      box-shadow: 0 6px 18px rgba(0,0,0,0.08);
      border-radius: 10px;
      overflow: hidden;
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

    .btn-edit {
      padding: 6px 14px;
      background: #2563eb;
      color: white;
      border-radius: 5px;
      text-decoration: none;
      font-size: 14px;
    }

    .btn-edit:hover {
      background: #1e40af;
    }
  </style>
</head>

<body>

<div class="page-wrapper">

  <!-- HEADER STAFF -->
  <jsp:include page="/WEB-INF/pages/Sheader.jsp"/>

  <!-- MAIN CONTENT -->
  <div class="main-content">

    <h2>📦 Quản lý sản phẩm (STAFF)</h2>

    <div class="toolbar">
      <a href="?action=add" class="btn btn-add">➕ Thêm sản phẩm</a>
    </div>

    <table>
      <tr>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Số lượng</th>
        <th>Hành động</th>
      </tr>

      <c:forEach items="${list}" var="sp">
        <tr>
          <td>${sp.tenSanPham}</td>
          <td>${sp.gia}</td>
          <td>${sp.soLuong}</td>
          <td>
            <a href="?action=edit&id=${sp.idSanPham}"
               class="btn-edit">✏️ Sửa</a>
          </td>
        </tr>
      </c:forEach>
    </table>

  </div>

  <!-- FOOTER -->
  <jsp:include page="/WEB-INF/pages/footer.jsp"/>

</div>

</body>
</html>
