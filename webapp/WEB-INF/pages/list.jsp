<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Quản lý sách</title>

  <style>
    table {
      border-collapse: collapse;
      width: 900px;
    }
    th, td {
      border: 1px solid black;
      padding: 8px;
      text-align: center;
    }
  </style>
</head>

<body>

<h2>QUẢN LÝ SÁCH</h2>

<!-- Form tìm kiếm -->
<form action="<%= request.getContextPath() %>/book" method="get">
  <input type="hidden" name="action" value="search"/>
  <input type="text" name="keyword" placeholder="Nhập tên sách"/>
  <button type="submit">Tìm</button>
</form>

<br>

<a href="<%= request.getContextPath() %>/book?action=add">
  Thêm sách
</a>

<br><br>

<table>
  <tr>
    <th>ID</th>
    <th>Tiêu đề</th>
    <th>Tác giả</th>
    <th>Giá</th>
    <th>Danh mục</th>
    <th>Hành động</th>
  </tr>

  <c:forEach items="${list}" var="b">
    <tr>
      <td>${b.id}</td>
      <td>${b.title}</td>
      <td>${b.author}</td>
      <td>${b.price}</td>
      <td>${b.category.name}</td>
      <td>
        <a href="<%= request.getContextPath() %>/book?action=edit&id=${b.id}">
          Sửa
        </a>
        |
        <a href="<%= request.getContextPath() %>/book?action=delete&id=${b.id}"
           onclick="return confirm('Xóa sách này?')">
          Xóa
        </a>
      </td>
    </tr>
  </c:forEach>

</table>

</body>
</html>