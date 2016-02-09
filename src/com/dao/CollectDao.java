package com.dao;

import com.models.Collect;

import java.util.List;

public interface CollectDao {
    void collect(Collect collect);
    void cancel(int id);
    Collect getCollect(int uid,int hid);
    List<Integer> getMyCollect(int userid);
}
