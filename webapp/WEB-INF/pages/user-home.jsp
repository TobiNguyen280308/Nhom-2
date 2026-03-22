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
    <title>Trang chủ</title>

    <link rel="stylesheet" href="<%= ctx %>/css/main.css">

    <style>
        .hero {
            padding: 90px 20px;
            text-align: center;
            background: linear-gradient(135deg, #0f172a, #1e293b);
            color: #f9fafb;
        }

        .hero h1 {
            font-size: 42px;
            margin-bottom: 14px;
            letter-spacing: 1.5px;
            font-weight: 800;
        }

        .hero p {
            font-size: 18px;
            opacity: 0.85;
            letter-spacing: 0.4px;
        }

        .cards {
            max-width: 1150px;
            margin: -70px auto 70px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            padding: 0 20px;
        }

        .card {
            background: #ffffff;
            padding: 32px;
            border-radius: 16px;
            box-shadow: 0 10px 28px rgba(0,0,0,0.12);
            transition: all 0.35s ease;
            border-top: 5px solid #2563eb;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 18px 42px rgba(0,0,0,0.22);
        }

        .card h3 {
            font-size: 22px;
            margin-bottom: 12px;
            color: #111827;
            font-weight: 700;
        }

        .card p {
            font-size: 15px;
            color: #4b5563;
            line-height: 1.65;
            margin-bottom: 22px;
        }

        .card a {
            display: inline-block;
            padding: 11px 26px;
            background: linear-gradient(135deg, #2563eb, #1e40af);
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 700;
            transition: 0.3s;
        }

        .card a:hover {
            background: linear-gradient(135deg, #1e40af, #1e3a8a);
        }
    </style>
</head>

<body>

<jsp:include page="/WEB-INF/pages/Uheader.jsp"/>

<div class="hero">
    <h1>CHÀO MỪNG KHÁCH HÀNG</h1>
    <p>Mua sắm dễ dàng – Nhanh chóng – An toàn</p>
</div>

<div class="cards">

    <div class="card">
        <h3>SẢN PHẨM</h3>
        <p>
            Khám phá các sản phẩm chất lượng cao
            được chọn lọc dành riêng cho bạn.
        </p>
        <a href="<%= ctx %>/user/products">XEM SẢN PHẨM</a>
    </div>

    <div class="card">
        <h3>ĐƠN HÀNG</h3>
        <p>
            Theo dõi lịch sử mua hàng
            và trạng thái xử lý đơn hàng.
        </p>
        <a href="<%= ctx %>/user/orders">XEM ĐƠN HÀNG</a>
    </div>

    <div class="card">
        <h3>GIỎ HÀNG</h3>
        <p>
            Kiểm tra các sản phẩm đã chọn
            trước khi tiến hành thanh toán.
        </p>
        <a href="<%= ctx %>/user/cart">XEM GIỎ HÀNG</a>
    </div>

</div>

<jsp:include page="/WEB-INF/pages/footer.jsp"/>

</body>
</html>
