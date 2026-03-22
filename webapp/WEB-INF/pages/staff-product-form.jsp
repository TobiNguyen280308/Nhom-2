<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>
    <c:choose>
      <c:when test="${empty sp}">Thêm sản phẩm</c:when>
      <c:otherwise>Sửa sản phẩm</c:otherwise>
    </c:choose>
  </title>

  <!-- CSS chung -->
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/main.css">

  <style>
    .form-box {
      max-width: 520px;
      margin: 40px auto;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 6px 18px rgba(0,0,0,0.12);
    }

    .form-box h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    .form-box label {
      font-weight: 600;
      display: block;
      margin-top: 12px;
    }

    .form-box input,
    .form-box textarea {
      width: 100%;
      padding: 9px;
      margin-top: 6px;
      border-radius: 6px;
      border: 1px solid #ccc;
      font-size: 14px;
    }

    .form-box textarea {
      min-height: 80px;
    }

    .form-actions {
      margin-top: 20px;
      display: flex;
      gap: 12px;
    }

    .form-actions button {
      flex: 1;
      padding: 10px;
      border: none;
      background: #2563eb;
      color: white;
      border-radius: 6px;
      font-weight: 600;
      cursor: pointer;
    }

    .form-actions button:hover {
      background: #1e40af;
    }

    .form-actions a {
      flex: 1;
      text-align: center;
      padding: 10px;
      background: #6b7280;
      color: white;
      border-radius: 6px;
      text-decoration: none;
      font-weight: 600;
    }

    .form-actions a:hover {
      background: #4b5563;
    }
  </style>
</head>

<body>

<div class="page-wrapper">

  <!-- STAFF HEADER -->
  <jsp:include page="/WEB-INF/pages/Sheader.jsp"/>

  <div class="main-content">

    <div class="form-box">

      <h2>
        <c:choose>
          <c:when test="${empty sp}">➕ Thêm sản phẩm</c:when>
          <c:otherwise>✏️ Sửa sản phẩm</c:otherwise>
        </c:choose>
      </h2>

      <form method="post">

        <c:if test="${not empty sp}">
          <input type="hidden" name="id" value="${sp.idSanPham}">
        </c:if>

        <label>Tên sản phẩm</label>
        <input name="tenSanPham"
               value="${sp.tenSanPham}"
               required>

        <label>Giá</label>
        <input name="gia"
               type="number"
               step="0.01"
               value="${sp.gia}"
               required>

        <label>Số lượng</label>
        <input name="soLuong"
               type="number"
               value="${sp.soLuong}"
               required>

        <label>Mô tả</label>
        <textarea name="moTa">${sp.moTa}</textarea>

        <div class="form-actions">
          <button type="submit">💾 Lưu</button>
          <a href="${pageContext.request.contextPath}/staff/products">
            ⬅ Quay lại
          </a>
        </div>

      </form>

    </div>

  </div>

  <jsp:include page="/WEB-INF/pages/footer.jsp"/>

</div>

</body>
</html>
