package com.dao;

import com.models.Post;

import java.util.ArrayList;
import java.util.List;

public interface PostDao {
    void post(Post post);
    void update(Post p);
    void delete(int id);
    List<Post> find(String message);
    Post getPost(int id);
    void deletes(int[] id);
    List<Post> getAllPost(int id);
    List<Post> getCollectPost(List<Integer> houseid);
    List<Post> getAdminPost();
}
