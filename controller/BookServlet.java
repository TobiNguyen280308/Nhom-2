package controller;

import dao.BookDAO;
import dao.CategoryDAO;
import entity.Book;
import entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/book")
public class BookServlet extends HttpServlet {

    private BookDAO bookDAO = new BookDAO();
    private CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if (action == null) {
            req.setAttribute("list", bookDAO.findAll());
            req.getRequestDispatcher("/WEB-INF/pages/list.jsp")
                    .forward(req, resp);

        } else if (action.equals("add")) {
            req.setAttribute("categories", categoryDAO.findAll());
            req.getRequestDispatcher("/WEB-INF/pages/add.jsp")
                    .forward(req, resp);

        } else if (action.equals("edit")) {
            Integer id = Integer.parseInt(req.getParameter("id"));
            req.setAttribute("book", bookDAO.findById(id));
            req.setAttribute("categories", categoryDAO.findAll());
            req.getRequestDispatcher("/WEB-INF/pages/edit.jsp")
                    .forward(req, resp);

        } else if (action.equals("delete")) {
            Integer id = Integer.parseInt(req.getParameter("id"));
            bookDAO.delete(id);
            resp.sendRedirect("book");

        } else if (action.equals("search")) {
            String keyword = req.getParameter("keyword");
            req.setAttribute("list", bookDAO.search(keyword));
            req.getRequestDispatcher("/WEB-INF/pages/list.jsp")
                    .forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        String title = req.getParameter("title");
        String author = req.getParameter("author");
        Double price = Double.parseDouble(req.getParameter("price"));
        Integer categoryId = Integer.parseInt(req.getParameter("category_id"));

        Category category = categoryDAO.findById(categoryId);

        if (action.equals("create")) {
            Book b = new Book(title, author, price, category);
            bookDAO.create(b);

        } else if (action.equals("update")) {
            Integer id = Integer.parseInt(req.getParameter("id"));
            Book b = new Book(title, author, price, category);
            b.setId(id);
            bookDAO.update(b);
        }

        resp.sendRedirect("book");
    }
}