package com.dao.impl;

import com.dao.UserDao;
import com.models.User;
import com.utils.MySessionFactory;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;


public class UserDaoImpl implements UserDao {
    public void register(User user) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
        if (session.isOpen()) {
            session.close();
        }
    }

    public boolean testUsername(String username) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from User where username=?").setString(0, username);
        List<User> rs = (List<User>) query.list();
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        if (rs.size() != 0) {
            return false;
        } else return true;
    }

    public boolean testEmail(String email) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from User where email=?").setString(0, email);
        List<User> rs = (List<User>) query.list();
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        if (rs.size() != 0) {
            return false;
        } else return true;
    }

    public User login(String username, String password) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from User where username=? and password=?").setString(0, username).setString(1, password);
        List<User> rs = (List<User>) query.list();
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        if (rs.size() != 0) {
            return rs.get(0);
        } else return null;
    }

    public void change(User user) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(user);
        session.getTransaction().commit();
        if (session.isOpen()) {
            session.close();
        }
    }

    public void delete(int id) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        User user = new User();
        user = (User) session.load(User.class, id);
        session.delete(user);
        session.getTransaction().commit();
        if (session.isOpen()) {
            session.close();
        }
    }

    public User getUser(int userid){
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        User user=(User)session.get(User.class,userid);
        if (session.isOpen()) {
            session.close();
        }
        return user;
    }

    public List<User> getAllUser(){
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query=session.createQuery("from User order by username");
        List<User> list=query.list();
        if (session.isOpen()) {
            session.close();
        }
        return list;
    }

    public List<User> find(String message){
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query=session.createQuery("from User where username like ? order by username").setString(0,"%"+message+"%");
        List<User> list=query.list();
        if (session.isOpen()) {
            session.close();
        }
        return list;
    }
}
