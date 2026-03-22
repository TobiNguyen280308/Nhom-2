package dao;

import entity.OrderDetail;
import utils.JPAUtil;

import javax.persistence.EntityManager;

public class OrderDetailDAO {

    public void insert(OrderDetail detail) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        em.persist(detail);
        em.getTransaction().commit();
        em.close();
    }
}
