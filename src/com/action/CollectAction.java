package com.action;

import com.dao.CollectDao;
import com.dao.PostDao;
import com.dao.impl.CollectDaoImpl;
import com.dao.impl.PostDaoImpl;
import com.models.Collect;
import com.models.Post;
import com.models.User;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.spi.http.HttpContext;
import java.util.List;

public class CollectAction {
    private String hid;

    public String getHid() {
        return hid;
    }

    public void setHid(String hid) {
        this.hid = hid;
    }

    public void collect() throws Exception{
        HttpServletResponse response=ServletActionContext.getResponse();
        CollectDao cd=new CollectDaoImpl();
        User user= (User)ActionContext.getContext().getSession().get("user");
        int id=user.getId();
        PostDao pd=new PostDaoImpl();
        int postid=pd.getPost(Integer.parseInt(hid)).getPostid();
        if(id==postid){
            response.getWriter().print("self");
            return;
        }
        Collect collect=new Collect();
        collect.setUserid(id);
        collect.setHouseid(Integer.parseInt(hid));
        cd.collect(collect);
    }

    public void cancel(){
        CollectDao cd=new CollectDaoImpl();
        User user= (User)ActionContext.getContext().getSession().get("user");
        int uid=user.getId();
        Collect collect=cd.getCollect(uid,Integer.parseInt(hid));
        cd.cancel(collect.getId());
    }

    public void test() throws Exception{
        CollectDao cd=new CollectDaoImpl();
        User user= (User)ActionContext.getContext().getSession().get("user");
        int uid=user.getId();
        Collect collect=cd.getCollect(uid,Integer.parseInt(hid));
        HttpServletResponse response= ServletActionContext.getResponse();
        if(collect!=null){
            response.getWriter().print("yes");
        }else{
            response.getWriter().print("no");
        }
    }

    public String getCollectMessage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        User user=(User)ActionContext.getContext().getSession().get("user");
        int id=user.getId();
        CollectDao cd=new CollectDaoImpl();
        PostDao pd=new PostDaoImpl();
        List list=cd.getMyCollect(id);
        List<Post> posts=pd.getCollectPost(list);
        request.setAttribute("posts",posts);
        return "toCollection";
    }
}
