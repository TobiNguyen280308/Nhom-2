package dao;

import entity.Book;
import utils.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class BookDAO {

    public List<Book> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        List<Book> list = em.createQuery(
                "SELECT b FROM Book b ORDER BY b.id DESC", Book.class
        ).getResultList();
        em.close();
        return list;
    }

    public Book findById(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        Book b = em.find(Book.class, id);
        em.close();
        return b;
    }

    public List<Book> search(String keyword) {
        EntityManager em = JPAUtil.getEntityManager();
        List<Book> list = em.createQuery(
                        "SELECT b FROM Book b WHERE b.title LIKE :kw", Book.class
                ).setParameter("kw", "%" + keyword + "%")
                .getResultList();
        em.close();
        return list;
    }

    public void create(Book b) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        em.persist(b);
        em.getTransaction().commit();
        em.close();
    }

    public void update(Book b) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        em.merge(b);
        em.getTransaction().commit();
        em.close();
    }

    public void delete(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        Book b = em.find(Book.class, id);
        if (b != null) em.remove(b);
        em.getTransaction().commit();
        em.close();
    }
}