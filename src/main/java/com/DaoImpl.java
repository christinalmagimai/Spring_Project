package com;

import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DaoImpl implements Dao {
     
     
     @PersistenceContext
     private EntityManager entityManager;

     public void createUser(User user) {
          entityManager.persist(user);
          //factory.getCurrentSession().save(user);
     }

     @Override
     public List<User> listUser(User user) {
          return entityManager.createQuery("from User").getResultList();
          /*List<User> ls = this.factory.getCurrentSession().createQuery("from User").list();
          return ls;*/
     }

     @Override
     public int deleteById(int id) {
          return entityManager.createNativeQuery("delete from employee where id = ?")
                   .setParameter(1, id).executeUpdate();
          /*Session session = this.factory.getCurrentSession();
          return session.createSQLQuery("delete from employee where id = ?").addEntity(User.class)
                   .setParameter(0, id).executeUpdate();*/
     }

     @Override
     public List<User> allUser() {
     
          return entityManager.createQuery("from User").getResultList();
     }

     @Override
     public User editById(int id) {
          
          List<User> ls =  entityManager.createQuery("from User where id=?").setParameter(1, id).getResultList();
          User customer = null;
          Iterator itr = ls.iterator();
          while (itr.hasNext()) {
              customer = (User) itr.next();
          }
          return customer;
     }

     @Override
     public User updateById( User user) {
          //System.out.println("Id DAO " + id);
          Query query=entityManager.createQuery("update User set userName=?,city=?,phoneNo=? where id=?");
        query.setParameter(1,user.getUserName());
        query.setParameter(2,user.getCity());
        query.setParameter(3,user.getPhoneNo());
        
        query.setParameter(4,user.getId());
        
        query.executeUpdate();

          return null;
     }
}

