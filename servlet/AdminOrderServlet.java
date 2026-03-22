package servlet;

import dao.OrderDAO;
import entity.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        OrderDAO dao = new OrderDAO();
        List<Order> orders = dao.findAll();

        req.setAttribute("orders", orders);

        // ✅ FORWARD ĐÚNG JSP
        req.getRequestDispatcher("/WEB-INF/pages/admin-orders.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Integer id = Integer.parseInt(req.getParameter("id"));
        String action = req.getParameter("action");

        OrderDAO dao = new OrderDAO();
        Order o = dao.findById(id);

        if ("approve".equals(action)) {
            o.setTrangThai("DA_XAC_NHAN");
            dao.update(o);
        }

        // ✅ REDIRECT CHUẨN
        resp.sendRedirect(req.getContextPath() + "/admin/orders");
    }
}
