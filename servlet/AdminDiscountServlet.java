package servlet;

import dao.DiscountDAO;
import entity.Discount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/admin/discounts")
public class AdminDiscountServlet extends HttpServlet {

    DiscountDAO dao = new DiscountDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        // ===== DELETE =====
        if ("delete".equals(action)) {
            Integer id = Integer.valueOf(req.getParameter("id"));
            dao.delete(id);
            resp.sendRedirect(req.getContextPath() + "/admin/discounts");
            return;
        }

        // ===== EDIT =====
        if ("edit".equals(action)) {
            Integer id = Integer.valueOf(req.getParameter("id"));
            Discount d = dao.findById(id);
            req.setAttribute("editDiscount", d);
        }

        // ===== LIST =====
        List<Discount> list = dao.findAll();
        req.setAttribute("list", list);

        req.getRequestDispatcher("/WEB-INF/pages/admin-discounts.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        Discount d = new Discount();
        d.setCode(req.getParameter("code"));
        d.setValue(new BigDecimal(req.getParameter("value")));
        d.setActive(true);

        String id = req.getParameter("id");

        if (id == null || id.isEmpty()) {
            dao.insert(d);
        } else {
            d.setId(Integer.valueOf(id));
            dao.update(d);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/discounts");
    }
}
