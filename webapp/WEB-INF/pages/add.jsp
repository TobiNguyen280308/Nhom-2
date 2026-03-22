<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Thêm sách</title>
</head>

<body>

<h2>THÊM SÁCH</h2>

<form action="<%= request.getContextPath() %>/book" method="post">

  <input type="hidden" name="action" value="create"/>

  Tiêu đề:<br>
  <input type="text" name="title" required/>
  <br><br>

  Tác giả:<br>
  <input type="text" name="author" required/>
  <br><br>

  Giá:<br>
  <input type="number" name="price" step="0.01" required/>
  <br><br>

  Danh mục:<br>
  <select name="category_id">
    <c:forEach items="${categories}" var="c">
      <option value="${c.id}">
          ${c.name}
      </option>
    </c:forEach>
  </select>

  <br><br>

  <button type="submit">Lưu</button>

</form>

<br>
<a href="<%= request.getContextPath() %>/book">
  Quay lại
</a>

</body>
</html>