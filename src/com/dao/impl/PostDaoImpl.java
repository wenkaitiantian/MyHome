package com.dao.impl;

import com.dao.PostDao;
import com.models.Post;
import com.utils.MySessionFactory;
import javafx.geometry.Pos;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

public class PostDaoImpl implements PostDao {
    public void post(Post post) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(post);
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    public void update(Post p) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(p);
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    public void delete(int id) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Post post = new Post();
        post = (Post) session.load(Post.class, id);
        session.delete(post);
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    public List<Post> find(String message) {
        List<Post> posts;
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Post where title like ? order by posttime desc").setString(0, "%" + message + "%");
        posts = query.list();
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        return posts;
    }

    public Post getPost(int id) {
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Post post = new Post();
        post = (Post) session.get(Post.class, id);
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        return post;
    }

    public void deletes(int[] id){
        Session session = MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        for (int i = 0; i < id.length; i++) {
            Post post = new Post();
            post = (Post) session.load(Post.class, id[i]);
            session.delete(post);
        }
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    public List<Post> getAllPost(int id){
        Session session=MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query=session.createQuery("from Post where postid = ? order by posttime desc ").setInteger(0,id);
        List<Post> list=query.list();
        session.getTransaction().commit();
        if (session != null && session.isOpen()) {
            session.close();
        }
        return list;
    }

    public List<Post> getCollectPost(List<Integer> houseid){
        Session session=MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        List<Post> posts=new ArrayList<>();
        for(int i=0;i<houseid.size();i++){
            Post p=new Post();
            p=(Post)session.get(Post.class,houseid.get(i));
            posts.add(p);
        }
        session.getTransaction().commit();
        if (session.isOpen()) {
            session.close();
        }
        return posts;
    }

    public List<Post> getAdminPost(){
        Session session=MySessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        Query query=session.createQuery("from Post order by posttime desc");
        List<Post> list=query.list();
        session.getTransaction().commit();
        if (session.isOpen()) {
            session.close();
        }
        return list;
    }
}
