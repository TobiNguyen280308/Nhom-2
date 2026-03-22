package servlet;

import dao.SanPhamDAO;
import entity.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/user/home")
public class UserHomeServlet extends HttpServlet {

    SanPhamDAO dao = new SanPhamDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<SanPham> list = dao.findAll();   // 🔥 DÒNG QUAN TRỌNG
        req.setAttribute("list", list);       // 🔥 JSP CẦN DÒNG NÀY

        req.getRequestDispatcher("/WEB-INF/pages/user-home.jsp")
                .forward(req, resp);
    }
}
