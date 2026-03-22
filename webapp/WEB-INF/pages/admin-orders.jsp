<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Quản lý đơn hàng</title>

  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">

  <style>
    .admin-container {
      max-width: 1200px;
      margin: 40px auto;
      background: #ffffff;
      padding: 35px;
      border-radius: 14px;
      box-shadow: 0 10px 28px rgba(0,0,0,0.12);
    }

    .admin-container h2 {
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
      font-weight: 600;
    }

    .status.pending {
      color: #d97706;
    }

    .status.approved {
      color: #16a34a;
    }

    .approve-btn {
      padding: 8px 14px;
      background: linear-gradient(135deg, #2563eb, #1d4ed8);
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-weight: 600;
      transition: all 0.25s;
    }

    .approve-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 16px rgba(37,99,235,0.45);
    }
  </style>
</head>

<body>

<div class="page-wrapper">

  <jsp:include page="/WEB-INF/pages/Aheader.jsp"/>

  <div class="main-content">

    <div class="admin-container">

      <h2>📋 QUẢN LÝ ĐƠN HÀNG</h2>

      <table>
        <tr>
          <th>ID</th>
          <th>Khách hàng</th>
          <th>Ngày đặt</th>
          <th>Tổng tiền</th>
          <th>Trạng thái</th>
          <th>Hành động</th>
        </tr>

        <c:forEach items="${orders}" var="o">
          <tr>
            <td>${o.id}</td>
            <td>${o.taiKhoan.tenDangNhap}</td>
            <td>${o.ngayTao}</td>
            <td>${o.tongTien}</td>

            <td>
              <c:choose>
                <c:when test="${o.trangThai eq 'Chờ xác nhận'}">
                  <span class="status pending">⏳ Chờ xác nhận</span>
                </c:when>
                <c:otherwise>
                  <span class="status approved">✅ Đã duyệt</span>
                </c:otherwise>
              </c:choose>
            </td>

            <td>
              <c:if test="${o.trangThai eq 'Chờ xác nhận'}">
                <form method="post"
                      action="<%=request.getContextPath()%>/admin/orders"
                      style="margin:0">
                  <input type="hidden" name="id" value="${o.id}">
                  <input type="hidden" name="action" value="approve">
                  <button class="approve-btn">
                    ✔ Duyệt đơn
                  </button>
                </form>
              </c:if>
            </td>
          </tr>
        </c:forEach>

      </table>

    </div>

  </div>

  <jsp:include page="/WEB-INF/pages/footer.jsp"/>

</div>

</body>
</html>
