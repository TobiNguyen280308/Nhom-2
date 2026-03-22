package servlet;

import dao.SanPhamDAO;
import entity.SanPham;
import model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    SanPhamDAO spDao = new SanPhamDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            Integer id = Integer.valueOf(req.getParameter("id"));
            SanPham sp = spDao.findById(id);

            CartItem item = cart.get(id);
            if (item == null) {
                cart.put(id, new CartItem(sp, 1));
            } else {
                item.setSoLuong(item.getSoLuong() + 1);
            }
        }

        resp.sendRedirect("cart-view");
    }
}

