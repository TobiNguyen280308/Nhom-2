package servlet;

import dao.OrderDAO;
import entity.Order;
import entity.TaiKhoan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/user/order-history")
public class UserOrderHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        TaiKhoan user = (TaiKhoan) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        OrderDAO dao = new OrderDAO();
        List<Order> orders = dao.findHistoryByUser(user.getId());

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/WEB-INF/pages/order-history.jsp")
                .forward(request, response);
    }
}
