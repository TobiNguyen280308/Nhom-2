package servlet;

import dao.TaiKhoanDAO;
import entity.TaiKhoan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirm  = req.getParameter("confirm");

        TaiKhoanDAO dao = new TaiKhoanDAO();

        // 1. kiểm tra mật khẩu
        if (!password.equals(confirm)) {
            req.setAttribute("error", "Mật khẩu xác nhận không khớp");
            req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);
            return;
        }

        // 2. kiểm tra username tồn tại
        if (dao.existsByUsername(username)) {
            req.setAttribute("error", "Tên đăng nhập đã tồn tại");
            req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);
            return;
        }

        // 3. tạo USER mới
        TaiKhoan tk = new TaiKhoan();
        tk.setTenDangNhap(username);
        tk.setMatKhau(password); // sau này hash
        tk.setVaiTro("USER");     // ⚠️ CỐ ĐỊNH USER
        tk.setTrangThai(true);

        dao.insert(tk);

        // 4. quay về login
        resp.sendRedirect(req.getContextPath() + "/login");
    }
}
