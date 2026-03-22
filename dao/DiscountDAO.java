package dao;

import entity.Discount;
import utils.JPAUtil;

import javax.persistence.*;
import java.util.List;

public class DiscountDAO {

    public List<Discount> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT d FROM Discount d", Discount.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public Discount findById(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Discount.class, id);
        } finally {
            em.close();
        }
    }

    public void insert(Discount d) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(d);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public void update(Discount d) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(d);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public void delete(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Discount d = em.find(Discount.class, id);
            if (d != null) {
                em.remove(d);
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }
}
