package servlet;

import dao.SanPhamDAO;
import dao.TaiKhoanDAO;
import entity.SanPham;
import entity.TaiKhoan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/admin/products")
public class AdminProductsServlet extends HttpServlet {

    SanPhamDAO dao = new SanPhamDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            Integer id = Integer.valueOf(req.getParameter("id"));
            SanPham sp = dao.findById(id);
            if (sp != null) {
                dao.delete(id);
            }
            resp.sendRedirect(req.getContextPath() + "/admin/products");
            return;
        }

        if ("edit".equals(action)) {
            Integer id = Integer.valueOf(req.getParameter("id"));
            SanPham sp = dao.findById(id);
            req.setAttribute("editProduct", sp);
        }

        List<SanPham> list = dao.findAll();
        req.setAttribute("list", list);

        req.getRequestDispatcher("/WEB-INF/pages/admin-products.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();

        // 🔥 LẤY USER ĐĂNG NHẬP
        TaiKhoan loginUser = (TaiKhoan) session.getAttribute("user");
        if (loginUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // 🔥 LẤY LẠI USER TỪ DB (TRÁNH TRANSIENT)
        TaiKhoanDAO tkDao = new TaiKhoanDAO();
        TaiKhoan admin = tkDao.findById(loginUser.getId());

        SanPham sp = new SanPham();
        sp.setTenSanPham(req.getParameter("tenSanPham"));
        sp.setMoTa(req.getParameter("moTa"));
        sp.setGia(new BigDecimal(req.getParameter("gia")));
        sp.setSoLuong(Integer.valueOf(req.getParameter("soLuong")));

        // 🔥 DÒNG QUYẾT ĐỊNH
        sp.setTaiKhoan(admin);

        String id = req.getParameter("id");
        if (id == null || id.isEmpty()) {
            dao.insert(sp);
        } else {
            sp.setIdSanPham(Integer.valueOf(id));
            dao.update(sp);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/products");
    }
}
