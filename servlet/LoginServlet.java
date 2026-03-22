package servlet;

import dao.TaiKhoanDAO;
import entity.TaiKhoan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role"); // lấy vai trò từ form

        TaiKhoanDAO dao = new TaiKhoanDAO();
        TaiKhoan user = dao.login(username, password);

        if (user == null) {
            req.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
            return;
        }

        if (!user.getVaiTro().equalsIgnoreCase(role)) {
            req.setAttribute("error", "Sai vai trò đăng nhập");
            req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession();
        session.setAttribute("user", user);

        // Điều hướng theo vai trò
        if ("ADMIN".equalsIgnoreCase(user.getVaiTro())) {
            req.getRequestDispatcher("/WEB-INF/pages/admin-home.jsp").forward(req, resp);
        } else if ("STAFF".equalsIgnoreCase(user.getVaiTro())) {
            req.getRequestDispatcher("/WEB-INF/pages/staff-home.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/WEB-INF/pages/user-home.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Nếu JSP của anh đang ở /pages/login.jsp thì dùng cái này
        req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);


    }
}
