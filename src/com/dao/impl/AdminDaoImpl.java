package com.dao.impl;

import com.dao.AdminDao;
import com.models.Admin;
import com.utils.MySessionFactory;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

public class AdminDaoImpl implements AdminDao {
    public Admin login(String name, String password) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Admin where name=? and password=?").setString(0, name).setString(1, password);
        List<Admin> rs = (List<Admin>) query.list();
        session.getTransaction().commit();
        if (session.isOpen()) {
            session.close();
        }
        if (rs.size() != 0) {
            return rs.get(0);
        } else return null;
    }

    public void add(Admin admin) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(admin);
        session.getTransaction().commit();
        if (session.isOpen()) {
            session.close();
        }
    }

    public void delete(int id) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Admin admin = new Admin();
        admin = (Admin) session.load(Admin.class, id);
        session.delete(admin);
        session.getTransaction().commit();
        if (session.isOpen()) {
            session.close();
        }
    }

    public List<Admin> getAllAdmin(){
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query=session.createQuery("from Admin order by name");
        List<Admin> list=query.list();
        if (session.isOpen()) {
            session.close();
        }
        return list;
    }

    public List<Admin> find(String message) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query=session.createQuery("from Admin where name like ? order by name").setString(0,"%"+message+"%");
        List<Admin> list=query.list();
        if (session.isOpen()) {
            session.close();
        }
        return list;
    }
}
