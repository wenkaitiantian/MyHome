package com.test;

import com.models.Admin;
import com.models.Post;
import com.utils.MySessionFactory;
import org.hibernate.*;

import java.util.List;
import java.util.Objects;


public class Test {
    public static void main(String[] args) {
        Session session=MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query=session.createQuery("select houseid from Collect where userid = ?").setInteger(0,1);
        List<Integer> list=query.list();
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        System.out.println(list.get(1));
    }
}
