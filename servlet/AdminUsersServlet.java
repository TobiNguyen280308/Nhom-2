package servlet;

import dao.TaiKhoanDAO;
import entity.TaiKhoan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/users")
public class AdminUsersServlet extends HttpServlet {

    TaiKhoanDAO dao = new TaiKhoanDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        // 👉 XÓA
        if ("delete".equals(action)) {
            Integer id = Integer.valueOf(req.getParameter("id"));
            dao.delete(id);
            resp.sendRedirect(req.getContextPath() + "/admin/users");
            return;
        }

        // 👉 MỞ FORM SỬA
        if ("edit".equals(action)) {
            Integer id = Integer.valueOf(req.getParameter("id"));
            TaiKhoan tk = dao.findById(id);
            req.setAttribute("editUser", tk);
        }

        // 👉 LOAD DANH SÁCH
        List<TaiKhoan> list = dao.findAll();
        req.setAttribute("list", list);

        req.getRequestDispatcher("/WEB-INF/pages/admin-users.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");

        TaiKhoan tk = new TaiKhoan();
        tk.setTenDangNhap(req.getParameter("tenDangNhap"));
        tk.setMatKhau(req.getParameter("matKhau"));
        tk.setVaiTro(req.getParameter("vaiTro"));
        tk.setTrangThai(true);

        // 👉 THÊM
        if (id == null || id.isEmpty()) {
            dao.insert(tk);
        }
        // 👉 SỬA
        else {
            tk.setId(Integer.valueOf(id));
            dao.update(tk);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }
}

