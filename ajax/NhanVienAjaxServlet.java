package ajax;

import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/ajax/nv")
public class NhanVienAjaxServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // Tạo dữ liệu JSON
        Map<String, Object> nv = new HashMap<>();
        nv.put("manv", "KhoiNguyenNV");
        nv.put("hoTen", "Nguyễn khôi Nguyen");
        nv.put("gioiTinh", true);
        nv.put("luong", 999950.5);

        // Convert sang JSON
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(nv);

        resp.getWriter().write(json);
    }
}