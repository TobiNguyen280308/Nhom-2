package dao;

import entity.TaiKhoan;
import utils.JPAUtil;

import javax.persistence.*;
import java.util.List;

public class TaiKhoanDAO {

    // ===== LOGIN (GIỮ NGUYÊN) =====
    public TaiKhoan login(String user, String pass) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            String jpql = "SELECT t FROM TaiKhoan t WHERE t.tenDangNhap = :u AND t.matKhau = :p";
            return em.createQuery(jpql, TaiKhoan.class)
                    .setParameter("u", user)
                    .setParameter("p", pass)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    // ===== LẤY TẤT CẢ =====
    public List<TaiKhoan> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT t FROM TaiKhoan t", TaiKhoan.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    // ===== THÊM =====
    public void insert(TaiKhoan tk) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(tk);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    // ===== TÌM THEO ID =====
    public TaiKhoan findById(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(TaiKhoan.class, id);
        } finally {
            em.close();
        }
    }

    // ===== CẬP NHẬT =====
    public void update(TaiKhoan tk) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(tk);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            em.close();
        }
    }
    // ===== KIỂM TRA USERNAME TỒN TẠI =====
    public boolean existsByUsername(String username) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            String jpql = "SELECT COUNT(t) FROM TaiKhoan t WHERE t.tenDangNhap = :u";
            Long count = em.createQuery(jpql, Long.class)
                    .setParameter("u", username)
                    .getSingleResult();
            return count > 0;
        } finally {
            em.close();
        }
    }
    // ===== XÓA =====
    public void delete(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            TaiKhoan tk = em.find(TaiKhoan.class, id);
            if (tk != null) {
                em.remove(tk);
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            em.close();
        }
    }
}
