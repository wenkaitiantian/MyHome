package com.action;


import com.dao.HelpDao;
import com.dao.PostDao;
import com.dao.UserDao;
import com.dao.impl.HelpDaoImpl;
import com.dao.impl.PostDaoImpl;
import com.dao.impl.UserDaoImpl;
import com.models.Help;
import com.models.Post;
import com.models.User;
import com.opensymphony.xwork2.ActionContext;
import com.utils.Dates;
import com.utils.FileSave;
import com.utils.IndexBean;
import com.utils.SendEmail;
import org.apache.struts2.ServletActionContext;

import javax.mail.Session;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;
import java.util.regex.*;

public class UserAction {
    private String username;
    private String password;
    private String reusepassword;
    private String tel;
    private String email;
    private String realname;
    private String area;
    private String code;
    private File icon;
    private String iconFileName;
    private String iconContentType;


    public void checkLogin() throws Exception{
        HttpServletResponse response=ServletActionContext.getResponse();
        UserDao ud=new UserDaoImpl();
        if(ud.login(username,password)==null){
            response.getWriter().print("wrong");
            return;
        }
        response.getWriter().print("yes");
    }

    public String login(){
        UserDao ud=new UserDaoImpl();
        User user=new User();
        user=ud.login(username,password);
        ActionContext.getContext().getSession().put("user",user);
        String hql = "from Post";
        IndexBean indexBean = IndexBean.getIndexBean(hql);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("indexBean", indexBean);
        return "logsuccess";
    }

    public void checkEmail() throws Exception{
        HttpServletResponse response=ServletActionContext.getResponse();
        UserDao ud=new UserDaoImpl();
        Pattern p = Pattern.compile("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\\.([a-zA-Z0-9_-])+)+$");
        Matcher m = p.matcher(email);
        if(!m.matches()){
            response.getWriter().print("errorformat");
            return;
        }
        if(!ud.testEmail(email)){
            response.getWriter().print("already");
            return;
        }else{
            String codes=SendEmail.sendMessage(email);
            System.out.println("code："+codes);
            ActionContext.getContext().getSession().put("codes",codes);
            response.getWriter().print("yes");
        }
    }

    public void checkRegister() throws Exception{
        HttpServletResponse response=ServletActionContext.getResponse();
        UserDao ud=new UserDaoImpl();
        if(ActionContext.getContext().getSession().get("codes")==null){
            response.getWriter().print("emptycode");
            return;
        }
        String s=ActionContext.getContext().getSession().get("codes").toString();
        if(!ud.testUsername(username)){
            response.getWriter().print("sameuser");
            return;
        }
        if(!password.equals(reusepassword)){
            response.getWriter().print("notsame");
            return;
        }
        if(!s.equals(code)){
            response.getWriter().print("wrongcode");
            return;
        }
        response.getWriter().print("yes");
    }

    public String register() throws Exception{
        UserDao ud=new UserDaoImpl();
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setTel(tel);
        user.setEmail(email);
        user.setRealname(realname);
        user.setArea(area);
        if(icon!=null){
            String iconpath= FileSave.saveFile(getIconFileName(),icon);
            user.setIcon(iconpath);
        }
        ud.register(user);
        return "regsuccess";
    }

    public String change() throws Exception{
        UserDao ud=new UserDaoImpl();
        User user=new User();
        user=(User)ActionContext.getContext().getSession().get("user");
        user.setPassword(password);
        user.setTel(tel);
        user.setRealname(realname);
        user.setArea(area);
        if(icon!=null){
            String iconpath= FileSave.saveFile(getIconFileName(),icon);
            user.setIcon(iconpath);
        }
        ud.change(user);
        return "changesuccess";
    }

    public String logout(){
        ActionContext.getContext().getSession().clear();
        return "logout";
    }

    public String getPersonal(){
        HttpServletRequest request = ServletActionContext.getRequest();
        User user=(User)ActionContext.getContext().getSession().get("user");
        int id=user.getId();
        PostDao pd=new PostDaoImpl();
        HelpDao hd=new HelpDaoImpl();
        List<Post> posts=pd.getAllPost(id);
        List<Help> helps=hd.getAllHelp(id);
        request.setAttribute("posts",posts);
        request.setAttribute("helps",helps);
        return "toPersonalPage";
    }

    public File getIcon() {
        return icon;
    }

    public void setIcon(File icon) {
        this.icon = icon;
    }

    public String getIconFileName() {
        return iconFileName;
    }

    public void setIconFileName(String iconFileName) {
        this.iconFileName = iconFileName;
    }

    public String getIconContentType() {
        return iconContentType;
    }

    public void setIconContentType(String iconContentType) {
        this.iconContentType = iconContentType;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getReusepassword() {
        return reusepassword;
    }

    public void setReusepassword(String reusepassword) {
        this.reusepassword = reusepassword;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
