package servlet;

import dao.SanPhamDAO;
import entity.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/user/products")
public class UserProductsServlet extends HttpServlet {

    SanPhamDAO dao = new SanPhamDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<SanPham> list = dao.findAll();
        req.setAttribute("list", list);

        req.getRequestDispatcher("/WEB-INF/pages/user-products.jsp")
                .forward(req, resp);
    }
}
