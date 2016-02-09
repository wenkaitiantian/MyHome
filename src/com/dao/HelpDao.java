package com.dao;

import com.models.Help;

import java.util.ArrayList;
import java.util.List;

public interface HelpDao {
    void post(Help help);
    void update(Help h);
    void delete(int id);
    List<Help> find(String message);
    Help getHelp(int id);
    void deletes(int id[]);
    List<Help> getAllHelp(int id);
    List<Help> getAdminHelp();
}
