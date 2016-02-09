package com.dao.impl;

import com.dao.HelpDao;
import com.models.Help;
import com.utils.MySessionFactory;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

public class HelpDaoImpl implements HelpDao {
    public void post(Help help) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(help);
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    public void update(Help h) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(h);
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    public void delete(int id) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Help help = new Help();
        help = (Help) session.load(Help.class, id);
        session.delete(help);
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    public List<Help> find(String message) {
        List<Help> helps;
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from He" +
                "lp where title like ? order by posttime desc").setString(0, "%" + message + "%");
        helps = query.list();
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        return helps;
    }

    public Help getHelp(int id) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Help help = new Help();
        help = (Help) session.get(Help.class, id);
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        return help;
    }

    public void deletes(int id[]){
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        for (int i = 0; i < id.length; i++) {
            Help help = new Help();
            help = (Help) session.load(Help.class, id[i]);
            session.delete(help);
        }
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    public List<Help> getAllHelp(int id){
        Session session=MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query=session.createQuery("from Help where postid = ? order by posttime desc ").setInteger(0,id);
        List list= query.list();
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        return list;
    }

    public List<Help> getAdminHelp(){
        Session session=MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query=session.createQuery("from Help order by posttime desc ");
        List list= query.list();
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        return list;
    }
}
