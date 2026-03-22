<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>

<%
  String ctx = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">

  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Arial, sans-serif;
      background: #f4f6f9;
    }

    /* ===== USER HEADER ===== */
    .menu {
      padding: 17px 36px;
      display: flex;
      align-items: center;

      background: linear-gradient(135deg, #0f172a, #1f2933);
      box-shadow: 0 4px 16px rgba(0,0,0,0.35);
      border-bottom: 1px solid #d4af37;
    }

    .menu .brand {
      font-size: 17px;
      font-weight: 800;
      letter-spacing: 1px;
      color: #f5d76e;
      margin-right: 50px;
    }

    .menu a {
      color: #e5e7eb;
      margin-right: 28px;
      text-decoration: none;
      font-weight: 600;
      font-size: 15px;
      letter-spacing: 0.4px;
      position: relative;
      transition: all 0.25s ease;
    }

    .menu a::after {
      content: "";
      position: absolute;
      left: 0;
      bottom: -6px;
      width: 0;
      height: 2px;
      background: linear-gradient(90deg, #d4af37, #f5d76e);
      transition: width 0.25s ease;
    }

    .menu a:hover {
      color: #ffffff;
    }

    .menu a:hover::after {
      width: 100%;
    }

    .menu .logout {
      margin-left: auto;
      padding: 7px 18px;
      border-radius: 8px;
      background: linear-gradient(135deg, #d4af37, #b8962e);
      color: #111827 !important;
      font-weight: 700;
    }

    .menu .logout:hover {
      background: linear-gradient(135deg, #b8962e, #a07c1f);
      color: #ffffff !important;
    }
  </style>
</head>

<body>

<div class="menu">
  <div class="brand"> APPLE CON STORE</div>

  <a href="<%= ctx %>/user/home">TRANG CHỦ</a>
  <a href="<%= ctx %>/user/products">SẢN PHẨM</a>
  <a href="<%= ctx %>/user/cart">GIỎ HÀNG</a>
  <a href="<%= ctx %>/user/orders">ĐƠN HÀNG</a>
  <a href="<%= ctx %>/user/order-history">LỊCH SỬ MUA HÀNG</a>

  <a class="logout" href="<%= ctx %>/logout">ĐĂNG XUẤT</a>
</div>
