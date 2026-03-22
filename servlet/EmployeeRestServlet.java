package servlet;

import model.Employee;
import utils.RestIO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/employees/*")
public class EmployeeRestServlet extends HttpServlet {

    private Map<String, Employee> map = new HashMap<>();

    @Override
    public void init() throws ServletException {
        map.put("NV01", new Employee("NV01", "Nhân viên 01", true, 500.0));
        map.put("NV02", new Employee("NV02", "Nhân viên 02", false, 1500.0));
        map.put("NV03", new Employee("NV03", "Nhân viên 03", true, 5000.0));
        map.put("NV04", new Employee("NV04", "Nhân viên 04", false, 2500.0));
        map.put("NV05", new Employee("NV05", "Nhân viên 05", true, 3500.0));
    }

    // GET
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String info = req.getPathInfo();

        if(info == null || info.length() == 0){
            RestIO.writeObject(resp, map.values());
        } else {
            String id = info.substring(1).trim();
            RestIO.writeObject(resp, map.get(id));
        }
    }

    // POST
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Employee emp = RestIO.readObject(req, Employee.class);
        map.put(emp.getId(), emp);
        RestIO.writeObject(resp, emp);
    }

    // PUT
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getPathInfo().substring(1).trim();
        Employee emp = RestIO.readObject(req, Employee.class);
        map.put(id, emp);
        RestIO.writeEmptyObject(resp);
    }

    // DELETE
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getPathInfo().substring(1).trim();
        map.remove(id);
        RestIO.writeEmptyObject(resp);
    }
}