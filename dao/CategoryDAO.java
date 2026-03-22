package dao;

import entity.Category;
import utils.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class CategoryDAO {

    public List<Category> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        List<Category> list = em.createQuery(
                "SELECT c FROM Category c ORDER BY c.name",
                Category.class
        ).getResultList();
        em.close();
        return list;
    }

    public Category findById(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        Category c = em.find(Category.class, id);
        em.close();
        return c;
    }

    public void create(Category c) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        em.persist(c);
        em.getTransaction().commit();
        em.close();
    }

    public void update(Category c) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        em.merge(c);
        em.getTransaction().commit();
        em.close();
    }

    public void delete(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        Category c = em.find(Category.class, id);
        if (c != null) {
            em.remove(c);
        }
        em.getTransaction().commit();
        em.close();
    }
}