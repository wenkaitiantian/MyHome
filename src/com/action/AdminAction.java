package com.action;

import com.dao.AdminDao;
import com.dao.HelpDao;
import com.dao.PostDao;
import com.dao.UserDao;
import com.dao.impl.AdminDaoImpl;
import com.dao.impl.HelpDaoImpl;
import com.dao.impl.PostDaoImpl;
import com.dao.impl.UserDaoImpl;
import com.models.Admin;
import com.models.Help;
import com.models.Post;
import com.models.User;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class AdminAction {
    private String name;
    private String password;
    private String delId;
    private String find;
    private String message;
    private AdminDao ad=new AdminDaoImpl();

    public String login(){
        Admin admin=ad.login(name,password);
        ActionContext.getContext().getSession().put("admin",admin);
        return "logsuccess";
    }

    public void checkLogin() throws Exception{
        HttpServletResponse response= ServletActionContext.getResponse();
        Admin admin=ad.login(name,password);
        if(admin!=null){
            response.getWriter().print(true);
        }else{
            response.getWriter().print(false);
        }
    }

    public String addAdmin() {
        Admin admin = new Admin();
        admin.setName(name);
        admin.setPassword(password);
        ad.add(admin);
        HttpServletRequest request=ServletActionContext.getRequest();
        List<Admin> list=ad.getAllAdmin();
        request.setAttribute("admins",list);
        return "addsuccess";
    }

    public String getAdminPost(){
        HttpServletRequest request=ServletActionContext.getRequest();
        PostDao pd=new PostDaoImpl();
        List<Post> list=pd.getAdminPost();
        request.setAttribute("posts",list);
        return "toAdmin_post";
    }

    public String getAdminHelp(){
        HttpServletRequest request=ServletActionContext.getRequest();
        HelpDao hd=new HelpDaoImpl();
        List<Help> list=hd.getAdminHelp();
        request.setAttribute("helps",list);
        return "toAdmin_help";
    }

    public String getSelectPost(){
        HttpServletRequest request=ServletActionContext.getRequest();
        PostDao pd=new PostDaoImpl();
        List<Post> list;
        if(!message.equals("")){
            list=pd.find(message);
            request.setAttribute("posts",list);
            request.setAttribute("message",message);
            return "toSelect_post";
        }else{
            list=pd.getAdminPost();
            request.setAttribute("helps",list);
            request.setAttribute("message",message);
            return "toAdmin_help";
        }
    }

    public String getSelectHelp(){
        HttpServletRequest request=ServletActionContext.getRequest();
        HelpDao hd=new HelpDaoImpl();
        List<Help> list;
        if(!message.equals("")){
            list=hd.find(message);
            request.setAttribute("helps",list);
            request.setAttribute("message",message);
            return "toSelect_help";
        }else{
            list=hd.getAdminHelp();
            request.setAttribute("helps",list);
            request.setAttribute("message",message);
            return "toAdmin_help";
        }
    }

    public void deletePost(){
        PostDao pd=new PostDaoImpl();
        pd.delete(Integer.parseInt(delId));
    }

    public void deleteHelp(){
        HelpDao hd=new HelpDaoImpl();
        hd.delete(Integer.parseInt(delId));
    }

    public String getAdminUser(){
        HttpServletRequest request=ServletActionContext.getRequest();
        UserDao ud=new UserDaoImpl();
        List<User> users=ud.getAllUser();
        request.setAttribute("users",users);
        return "toAdmin_user";
    }

    public String getSelectUser(){
        HttpServletRequest request=ServletActionContext.getRequest();
        UserDao ud=new UserDaoImpl();
        List<User> list;
        if(!message.equals("")){
            list=ud.find(message);
            request.setAttribute("users",list);
            request.setAttribute("message",message);
            return "toSelect_user";
        }else{
            list=ud.getAllUser();
            request.setAttribute("users",list);
            request.setAttribute("message",message);
            return "toAdmin_user";
        }
    }

    public void deleteUser(){
        UserDao ud=new UserDaoImpl();
        ud.delete(Integer.parseInt(delId));
    }

    public void deleteAdmin(){
        ad.delete(Integer.parseInt(delId));
    }

    public String getAdmin(){
        HttpServletRequest request=ServletActionContext.getRequest();
        List<Admin> list=ad.getAllAdmin();
        request.setAttribute("admins",list);
        return "toAdminmanage";
    }

    public String getSelectAdmin(){
        HttpServletRequest request=ServletActionContext.getRequest();
        List<Admin> list;
        if(!message.equals("")){
            list=ad.find(message);
            request.setAttribute("admins",list);
            request.setAttribute("message",message);
            return "toSelect_admin";
        }else{
            list=ad.getAllAdmin();
            request.setAttribute("admins",list);
            request.setAttribute("message",message);
            return "toAdminmanage";
        }
    }

    public String exit(){
        ActionContext.getContext().getSession().clear();
        return "exit";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFind() {
        return find;
    }

    public void setFind(String find) {
        this.find = find;
    }

    public String getDelId() {
        return delId;
    }

    public void setDelId(String delId) {
        this.delId = delId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
