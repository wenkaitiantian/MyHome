package com.dao;

import com.models.Admin;

import java.util.List;

public interface AdminDao {
    Admin login(String name, String password);
    void add(Admin admin);
    void delete(int id);
    List<Admin> getAllAdmin();
    List<Admin> find(String message);
}
