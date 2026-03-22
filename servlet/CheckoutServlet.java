package servlet;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import entity.*;
import model.CartItem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        TaiKhoan user = (TaiKhoan) session.getAttribute("user");

        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");

        if (user == null || cart == null || cart.isEmpty()) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        // ===== TẠO ORDER =====
        Order order = new Order();
        order.setNgayTao(new Date());
        order.setTrangThai("CHO_XAC_NHAN");
        order.setTaiKhoan(user); // GÁN USER

        BigDecimal tongTien = BigDecimal.ZERO;

        for (CartItem item : cart.values()) {
            BigDecimal gia = item.getSanPham().getGia(); // BigDecimal
            BigDecimal soLuong = BigDecimal.valueOf(item.getSoLuong());
            tongTien = tongTien.add(gia.multiply(soLuong));
        }

        // ✅ ĐÚNG KIỂU – KHÔNG ÉP DOUBLE
        order.setTongTien(tongTien);

        OrderDAO orderDAO = new OrderDAO();
        orderDAO.insert(order);

        // ===== LƯU CHI TIẾT =====
        OrderDetailDAO detailDAO = new OrderDetailDAO();

        for (CartItem item : cart.values()) {
            OrderDetail d = new OrderDetail();
            d.setOrder(order);
            d.setSanPham(item.getSanPham());
            d.setSoLuong(item.getSoLuong());
            d.setDonGia(item.getSanPham().getGia()); // BigDecimal
            detailDAO.insert(d);
        }

        session.removeAttribute("cart");

        // redirect đúng servlet user-order
        resp.sendRedirect("user-order");
    }
}
