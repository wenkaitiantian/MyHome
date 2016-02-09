package com.dao.impl;

import com.dao.CollectDao;
import com.models.Collect;
import com.utils.MySessionFactory;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

public class CollectDaoImpl implements CollectDao {
    public void collect(Collect collect) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(collect);
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    public void cancel(int id) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Collect collect = new Collect();
        collect = (Collect) session.load(Collect.class, id);
        session.delete(collect);
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    public Collect getCollect(int uid,int hid){
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Collect collect=new Collect();
        Query query=session.createQuery("from Collect where userid = ? and houseid = ?").setInteger(0,uid).setInteger(1,hid);
        List<Collect> list=query.list();
        if(list.size()==0){
            session.getTransaction().commit();
            if (session != null && session.isOpen()) {
                session.close();
            }
            return null;
        }else{
            collect=list.get(0);
            session.getTransaction().commit();
            if (session != null && session.isOpen()) {
                session.close();
            }
            return collect;
        }
    }

    public List<Integer> getMyCollect(int userid){
        Session session=MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query=session.createQuery("select houseid from Collect where userid = ?").setInteger(0,userid);
        List<Integer> list=query.list();
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        return list;
    }
}
