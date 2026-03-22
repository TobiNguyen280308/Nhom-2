package dao;

import entity.SanPham;
import utils.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class SanPhamDAO {

    public List<SanPham> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        List<SanPham> list = em.createQuery("SELECT s FROM SanPham s", SanPham.class)
                .getResultList();
        em.close();
        return list;
    }

    public SanPham findById(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        SanPham sp = em.find(SanPham.class, id);
        em.close();
        return sp;
    }
    public void delete(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        SanPham sp = em.find(SanPham.class, id);
        if (sp != null) {
            em.remove(sp);
        }
        em.getTransaction().commit();
        em.close();
    }
    public void insert(SanPham sp) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        em.persist(sp);
        em.getTransaction().commit();
        em.close();
    }

    public void update(SanPham sp) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        em.merge(sp);
        em.getTransaction().commit();
        em.close();
    }
}
