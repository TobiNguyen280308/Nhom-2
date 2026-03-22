package servlet;

import dao.OrderDAO;
import entity.Order;
import entity.TaiKhoan;
import model.CartItem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/user/orders")
public class UserOrderServlet extends HttpServlet {

    // ======================
    // XEM ĐƠN HÀNG
    // ======================
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        TaiKhoan user = (TaiKhoan) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        OrderDAO dao = new OrderDAO();
        List<Order> orders = dao.findByUser(user.getId());

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("/WEB-INF/pages/user-orders.jsp")
                .forward(req, resp);
    }

    // ======================
    // ĐẶT HÀNG TỪ GIỎ
    // ======================
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        TaiKhoan user = (TaiKhoan) session.getAttribute("user");
        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cart-view");
            return;
        }

        OrderDAO dao = new OrderDAO();
        dao.createOrderFromCart(user, cart);

        session.removeAttribute("cart");

        resp.sendRedirect(req.getContextPath() + "/user/orders");
    }
}