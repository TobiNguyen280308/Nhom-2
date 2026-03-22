package servlet;

import dao.SanPhamDAO;
import entity.SanPham;
import entity.TaiKhoan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/staff/products")
public class StaffProductServlet extends HttpServlet {

    SanPhamDAO dao = new SanPhamDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            req.getRequestDispatcher("/WEB-INF/pages/staff-product-form.jsp")
                    .forward(req, resp);
            return;
        }

        if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            SanPham sp = dao.findById(id);
            req.setAttribute("sp", sp);

            req.getRequestDispatcher("/WEB-INF/pages/staff-product-form.jsp")
                    .forward(req, resp);
            return;
        }

        List<SanPham> list = dao.findAll();
        req.setAttribute("list", list);

        req.getRequestDispatcher("/WEB-INF/pages/staff-products.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        TaiKhoan staff = (TaiKhoan) session.getAttribute("user");

        if (staff == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String id = req.getParameter("id");

        SanPham sp = new SanPham();
        sp.setTenSanPham(req.getParameter("tenSanPham"));
        sp.setGia(new BigDecimal(req.getParameter("gia")));
        sp.setSoLuong(Integer.parseInt(req.getParameter("soLuong")));
        sp.setMoTa(req.getParameter("moTa"));
        sp.setTaiKhoan(staff); // 🔥 GÁN NHÂN VIÊN

        if (id == null || id.isEmpty()) {
            dao.insert(sp);
        } else {
            sp.setIdSanPham(Integer.parseInt(id)); // ✅ ĐÚNG
            dao.update(sp);
        }

        resp.sendRedirect(req.getContextPath() + "/staff/products");
    }
}
