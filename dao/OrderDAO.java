package dao;

import entity.Order;
import entity.OrderDetail;
import entity.TaiKhoan;
import model.CartItem;
import utils.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class OrderDAO {

    public void insert(Order order) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(order);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void update(Order order) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(order);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Order> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery(
                    "SELECT o FROM Order o ORDER BY o.ngayTao DESC",
                    Order.class
            ).getResultList();
        } finally {
            em.close();
        }
    }

    public Order findById(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Order.class, id);
        } finally {
            em.close();
        }
    }

    public List<Order> findByUser(Integer userId) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery(
                            "SELECT o FROM Order o WHERE o.taiKhoan.id = :uid ORDER BY o.ngayTao DESC",
                            Order.class
                    )
                    .setParameter("uid", userId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public List<Order> findHistoryByUser(Integer taiKhoanId) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery(
                            "SELECT o FROM Order o " +
                                    "WHERE o.taiKhoan.id = :uid " +
                                    "AND o.trangThai <> :pending " +
                                    "ORDER BY o.ngayTao DESC",
                            Order.class
                    )
                    .setParameter("uid", taiKhoanId)
                    .setParameter("pending", "Chờ xử lý")
                    .getResultList();
        } finally {
            em.close();
        }
    }

    // ==================================================
    // ✅ TẠO ĐƠN HÀNG TỪ GIỎ HÀNG (CHUẨN ENTITY)
    // ==================================================
    public void createOrderFromCart(TaiKhoan user, Map<Integer, CartItem> cart) {

        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tran = em.getTransaction();

        try {
            tran.begin();

            Order order = new Order();
            order.setTaiKhoan(user);
            order.setNgayTao(new Date());
            order.setTrangThai("Chờ xác nhận"); // ❗ chưa duyệt
            order.setTongTien(BigDecimal.ZERO);

            BigDecimal tongTien = BigDecimal.ZERO;

            em.persist(order);
            em.flush();

            for (CartItem item : cart.values()) {
                OrderDetail detail = new OrderDetail();
                detail.setOrder(order);
                detail.setSanPham(item.getSanPham());
                detail.setSoLuong(item.getSoLuong());
                detail.setDonGia(item.getSanPham().getGia());

                BigDecimal thanhTien = item.getSanPham()
                        .getGia()
                        .multiply(BigDecimal.valueOf(item.getSoLuong()));

                tongTien = tongTien.add(thanhTien);

                em.persist(detail);
            }

            order.setTongTien(tongTien); // ✅ QUAN TRỌNG
            em.merge(order);

            tran.commit();
        } catch (Exception e) {
            tran.rollback();
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

}
