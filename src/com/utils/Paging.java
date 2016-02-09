package com.utils;

import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

public class Paging {
    public static int getAllRowCount(String hql) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        int allRows = 0;
        Query query = session.createQuery(hql);
        allRows = query.list().size();
        if (session != null && session.isOpen()) {
            session.close();
        }
        return allRows;
    }

    public static List queryByPage(String hql, int offset, int pageSize){
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        List list = null;
        Query query = session.createQuery(hql).setFirstResult(offset).setMaxResults(pageSize);
        list = query.list();
        if (session != null && session.isOpen()) {
            session.close();
        }
        return list;
    }

    public static List getAllList(String hql){
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        List list = null;
        Query query = session.createQuery(hql);
        list = query.list();
        if (session != null && session.isOpen()) {
            session.close();
        }
        return list;
    }
}
