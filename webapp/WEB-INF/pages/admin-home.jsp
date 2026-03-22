<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>

<%
    String ctx = request.getContextPath();
%>

<jsp:include page="/WEB-INF/pages/Aheader.jsp"/>
<link rel="stylesheet" href="<%= ctx %>/css/main.css">

<style>
    /* ===== HERO ===== */
    .hero {
        padding: 90px 20px;
        text-align: center;
        background: linear-gradient(135deg, #0b1120, #1e293b);
        color: #f9fafb;
    }

    .hero h1 {
        font-size: 42px;
        margin-bottom: 14px;
        letter-spacing: 2px;
        font-weight: 800;
    }

    .hero p {
        font-size: 18px;
        opacity: 0.85;
        letter-spacing: 0.5px;
    }

    /* ===== CARD GRID ===== */
    .cards {
        max-width: 1200px;
        margin: -70px auto 70px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
        gap: 30px;
        padding: 0 20px;
    }

    /* ===== CARD ===== */
    .card {
        background: #ffffff;
        padding: 34px 32px;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.12);
        transition: all 0.35s ease;
        border-top: 5px solid #d4af37;
        position: relative;
        overflow: hidden;
    }

    .card:hover {
        transform: translateY(-8px);
        box-shadow: 0 18px 42px rgba(0,0,0,0.22);
    }

    .card h3 {
        font-size: 22px;
        margin-bottom: 14px;
        color: #111827;
        font-weight: 700;
        letter-spacing: 0.6px;
    }

    .card p {
        font-size: 15px;
        color: #4b5563;
        line-height: 1.65;
        margin-bottom: 24px;
    }

    /* ===== BUTTON ===== */
    .card a {
        display: inline-block;
        padding: 11px 26px;
        background: linear-gradient(135deg, #2563eb, #1e40af);
        color: white;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 700;
        letter-spacing: 0.4px;
        transition: all 0.3s ease;
    }

    .card a:hover {
        background: linear-gradient(135deg, #1e40af, #1e3a8a);
        transform: translateY(-1px);
    }
</style>

<div class="hero">
    <h1>TRANG QUẢN TRỊ HỆ THỐNG</h1>
    <p>Kiểm soát toàn bộ vận hành – An toàn – Chính xác – Hiệu quả</p>
</div>

<div class="cards">

    <div class="card">
        <h3>QUẢN LÝ ĐƠN HÀNG</h3>
        <p>
            Theo dõi, duyệt và kiểm soát toàn bộ đơn hàng.
            Cập nhật trạng thái xử lý theo quy trình chuẩn.
        </p>
        <a href="<%= ctx %>/admin/orders">VÀO QUẢN LÝ</a>
    </div>

    <div class="card">
        <h3>QUẢN LÝ SẢN PHẨM</h3>
        <p>
            Thêm, sửa, xóa sản phẩm.
            Quản lý giá bán và số lượng tồn kho hiệu quả.
        </p>
        <a href="<%= ctx %>/admin/products">VÀO QUẢN LÝ</a>
    </div>

    <div class="card">
        <h3>QUẢN LÝ TÀI KHOẢN</h3>
        <p>
            Quản lý tài khoản người dùng và nhân viên.
            Phân quyền hệ thống rõ ràng, bảo mật cao.
        </p>
        <a href="<%= ctx %>/admin/users">VÀO QUẢN LÝ</a>
    </div>

    <div class="card">
        <h3>MÃ GIẢM GIÁ</h3>
        <p>
            Tạo và quản lý chương trình khuyến mãi.
            Gia tăng doanh thu và giữ chân khách hàng.
        </p>
        <a href="<%= ctx %>/admin/discounts">VÀO QUẢN LÝ</a>
    </div>

</div>

<jsp:include page="/WEB-INF/pages/footer.jsp"/>
