package com.models;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Collect {
    private int id;
    private int userid;
    private int houseid;
    @Id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getHouseid() {
        return houseid;
    }

    public void setHouseid(int houseid) {
        this.houseid = houseid;
    }
}
