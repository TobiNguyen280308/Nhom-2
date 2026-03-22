package servlet;

import dao.SanPhamDAO;
import entity.SanPham;
import model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/user/cart")
public class UserCartServlet extends HttpServlet {

    SanPhamDAO dao = new SanPhamDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        int id = Integer.parseInt(req.getParameter("id"));
        int soLuong = Integer.parseInt(req.getParameter("soLuong"));

        CartItem item = cart.get(id);

        if (item == null) {
            SanPham sp = dao.findById(id);
            item = new CartItem(sp, soLuong);
            cart.put(id, item);
        } else {
            item.setSoLuong(item.getSoLuong() + soLuong);
        }

        session.setAttribute("cart", cart);
        resp.sendRedirect(req.getContextPath() + "/user/cart");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");

        req.setAttribute("cart", cart);

        req.getRequestDispatcher("/WEB-INF/pages/user-cart.jsp")
                .forward(req, resp);
    }
}
