package com.dao;

import com.models.User;

import java.util.List;

public interface UserDao {
    void register(User user);
    boolean testUsername(String username);
    boolean testEmail(String email);
    User login(String username, String password);
    void change(User user);
    void delete(int id);
    User getUser(int userid);
    List<User> getAllUser();
    List<User> find(String message);
}
