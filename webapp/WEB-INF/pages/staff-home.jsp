<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>

<jsp:include page="/WEB-INF/pages/Sheader.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

<style>
    body {
        background: #f4f6f9;
    }

    /* ================= HERO ================= */
    .hero {
        padding: 90px 20px;
        text-align: center;
        background: linear-gradient(135deg, #0f172a, #1e293b);
        color: #f9fafb;
    }

    .hero h1 {
        font-size: 40px;
        margin-bottom: 14px;
        letter-spacing: 1px;
        font-weight: 700;
    }

    .hero p {
        font-size: 17px;
        color: #e5e7eb;
    }

    /* ================= CARDS ================= */
    .cards {
        max-width: 1000px;
        margin: -70px auto 70px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 28px;
        padding: 0 20px;
    }

    .card {
        background: #ffffff;
        padding: 30px;
        border-radius: 16px;
        box-shadow: 0 10px 28px rgba(0,0,0,0.12);
        transition: all 0.35s ease;
        position: relative;
        overflow: hidden;
    }

    .card::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        height: 4px;
        width: 100%;
        background: linear-gradient(90deg, #d4af37, #f5d76e);
    }

    .card:hover {
        transform: translateY(-8px);
        box-shadow: 0 18px 40px rgba(0,0,0,0.18);
    }

    .card h3 {
        font-size: 22px;
        margin-bottom: 12px;
        color: #0f172a;
        font-weight: 700;
    }

    .card p {
        font-size: 15px;
        color: #475569;
        margin-bottom: 22px;
        line-height: 1.6;
    }

    .card a {
        display: inline-block;
        padding: 11px 24px;
        background: linear-gradient(135deg, #d4af37, #b8962e);
        color: #111827;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 700;
        letter-spacing: 0.5px;
        transition: all 0.25s ease;
    }

    .card a:hover {
        background: linear-gradient(135deg, #b8962e, #a07c1f);
        color: white;
    }
</style>

<div class="hero">
    <h1>TRANG NHÂN VIÊN</h1>
    <p>Xử lý đơn hàng & hỗ trợ khách hàng</p>
</div>

<div class="cards">

    <div class="card">
        <h3>SẢN PHẨM</h3>
        <p>Xem và cập nhật thông tin sản phẩm trong hệ thống</p>
        <a href="${pageContext.request.contextPath}/staff/products">
            XEM SẢN PHẨM
        </a>
    </div>

</div>

<jsp:include page="/WEB-INF/pages/footer.jsp"/>
