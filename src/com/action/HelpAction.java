package com.action;

import com.dao.HelpDao;
import com.dao.UserDao;
import com.dao.impl.HelpDaoImpl;
import com.dao.impl.UserDaoImpl;
import com.models.Help;
import com.models.User;
import com.opensymphony.xwork2.ActionContext;
import com.utils.Dates;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

public class HelpAction {
    private String district;
    private String helpmoney;
    private String lasttime;
    private String title;
    private String message;
    private String linkname;
    private String tel;
    private String delId;
    private String upId;
    private String find;

    private String detail;
    private HelpDao hd=new HelpDaoImpl();

    public String post() {
        Help help = new Help();
        User user = (User) ActionContext.getContext().getSession().get("user");
        int id = user.getId();
        help.setPostid(id);
        help.setDistrict(district);
        help.setMoney(helpmoney);
        help.setLatetime(lasttime);
        help.setTitle(title);
        help.setMessage(message);
        help.setLinkname(linkname);
        help.setTel(tel);
        help.setPosttime(Dates.getDate());
        hd.post(help);
        return "postsuccess";
    }

    public String update() {
        Help help = new Help();
        help=hd.getHelp(Integer.parseInt(upId));
        help.setDistrict(district);
        help.setMoney(helpmoney);
        help.setLatetime(lasttime);
        help.setTitle(title);
        help.setMessage(message);
        help.setLinkname(linkname);
        help.setTel(tel);
        help.setPosttime(Dates.getDate());
        hd.update(help);
        return "updatesuccess";
    }

    public void delete() {
        int id = Integer.parseInt(delId);
        hd.delete(id);
    }

    public String detail(){
        Help help=new Help();
        UserDao ud=new UserDaoImpl();
        help=hd.getHelp(Integer.parseInt(detail));
        User user=ud.getUser(help.getPostid());
        String iconPath=user.getIcon();
        HttpServletRequest request= ServletActionContext.getRequest();
        request.setAttribute("path",iconPath);
        request.setAttribute("detail",help);
        return "helpdetail";
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getHelpmoney() {
        return helpmoney;
    }

    public void setHelpmoney(String helpmoney) {
        this.helpmoney = helpmoney;
    }

    public String getLasttime() {
        return lasttime;
    }

    public void setLasttime(String lasttime) {
        this.lasttime = lasttime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getLinkname() {
        return linkname;
    }

    public void setLinkname(String linkname) {
        this.linkname = linkname;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getDelId() {
        return delId;
    }

    public void setDelId(String delId) {
        this.delId = delId;
    }

    public String getUpId() {
        return upId;
    }

    public void setUpId(String upId) {
        this.upId = upId;
    }

    public String getFind() {
        return find;
    }

    public void setFind(String find) {
        this.find = find;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
