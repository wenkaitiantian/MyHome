package com.action;

import com.dao.PostDao;
import com.dao.UserDao;
import com.dao.impl.PostDaoImpl;
import com.dao.impl.UserDaoImpl;
import com.models.Post;
import com.models.User;
import com.opensymphony.xwork2.ActionContext;
import com.utils.Dates;
import com.utils.IndexBean;
import com.utils.PageBean;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletRequest;


public class PostAction {
    private String types;
    private String way;
    private String plotname;
    private String housetype;
    private String floor;
    private String postmoney;
    private String title;
    private String message;
    private String linkname;
    private String qq;
    private String tel;
    private String delId;
    private String upId;
    private String find;
    private String location;
    private String tab;
    private int page;
    private String sizes;
    private String rooms;

    private String loc;
    private String price;
    private String area;
    private String house;

    private String cast;
    private String detail;

    private PostDao pd = new PostDaoImpl();

    public String post() {
        Post post = new Post();
        User user = (User) ActionContext.getContext().getSession().get("user");
        int id = user.getId();
        post.setPostid(id);
        if (types.equals("rent")) {
            post.setTypes(0);
        } else {
            post.setTypes(1);
        }
        if (way.equals("all")) {
            post.setWay(0);
        } else {
            post.setWay(1);
        }
        post.setPlotname(plotname);
        post.setHousetype(housetype);
        post.setFloor(floor);
        post.setMoney(postmoney);
        post.setMessage(message);
        post.setLinkname(linkname);
        post.setQq(qq);
        post.setTel(tel);
        post.setTitle(title);
        post.setPosttime(Dates.getDate());
        post.setLocation(location);
        post.setSizes(sizes);
        post.setRooms(rooms);
        pd.post(post);
        return "postsuccess";
    }

    public String update() {
        Post post = new Post();
        post = pd.getPost(Integer.parseInt(upId));
        post.setTypes(Integer.parseInt(types));
        post.setWay(Integer.parseInt(way));
        post.setPlotname(plotname);
        post.setHousetype(housetype);
        post.setFloor(floor);
        post.setMoney(postmoney);
        post.setMessage(message);
        post.setLinkname(linkname);
        post.setQq(qq);
        post.setTel(tel);
        post.setPosttime(Dates.getDate());
        post.setLocation(location);
        post.setSizes(sizes);
        post.setRooms(rooms);
        pd.post(post);
        return "updatesuccess";
    }

    public void delete() {
        int id = Integer.parseInt(delId);
        pd.delete(id);
    }

    public String query() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String hql1 = "from Post where types=0 order by posttime desc";
        String hql2 = "from Post where types=1 order by posttime desc";
        String hql3 = "from Help";
        PageBean pageBean1 = PageBean.getPageBean(8, page, hql1);
        PageBean pageBean2 = PageBean.getPageBean(8, page, hql2);
        PageBean pageBean3 = PageBean.getPageBean(8, page, hql3);
        request.setAttribute("pageBean1", pageBean1);
        request.setAttribute("pageBean2", pageBean2);
        request.setAttribute("pageBean3", pageBean3);
        if (tab.equals("1")) {
            return "success_rent";
        } else if (tab.equals("2")) {
            return "success_sale";
        } else {
            return "success_needrent";
        }
    }

    public String getIndexQuery() {
        String hql = "from Post order by posttime desc";
        IndexBean indexBean = IndexBean.getIndexBean(hql);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("indexBean", indexBean);
        return "success_index";
    }

    public String getSelectQuery() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String[] p;
        String[] a;
        String[] h;
        p = price.split(",");
        a = area.split(",");
        h = house.split(",");
        String hql2;
        String hql2_2;
        if (price.equals("0,9999")) {
            if (loc.equals("")) {
                hql2 = "from Post where types=1 and mo" +
                        "ney between " + p[0] + " and " + p[1] + " and sizes between " + a[0] + " and "
                        + a[1] + " and rooms between " + h[0] + " and " + h[1] + " order by posttime desc";

                hql2_2 = "from Post where types=1 and mo" +
                        "ney between " + p[0] + " and " + p[1] + " and sizes between " + a[0] + " and "
                        + a[1] + " and rooms between " + h[0] + " and " + h[1] + " order by money";
            } else {
                hql2 = "from Post where types=1 and location ='" + loc + "' and mo" +
                        "ney between " + p[0] + " and " + p[1] + " and sizes between " + a[0] + " and "
                        + a[1] + " and rooms between " + h[0] + " and " + h[1] + " order by posttime desc";

                hql2_2 = "from Post where types=1 and location ='" + loc + "' and mo" +
                        "ney between " + p[0] + " and " + p[1] + " and sizes between " + a[0] + " and "
                        + a[1] + " and rooms between " + h[0] + " and " + h[1] + " order by money";
            }
        } else {
            if (loc.equals("")) {
                hql2 = "from Post where types=1 and mo" +
                        "ney between " + p[0] + " and " + p[1] + " and sizes between " + a[0] + " and "
                        + a[1] + " and rooms between " + h[0] + " and " + h[1] + " order by posttime desc";
                hql2_2 = "from Post where types=1 and mo" +
                        "ney between " + p[0] + " and " + p[1] + " and sizes between " + a[0] + " and "
                        + a[1] + " and rooms between " + h[0] + " and " + h[1] + " order by money";
            } else {
                hql2 = "from Post where types=1 and location ='" + loc + "' and mo" +
                        "ney between " + p[0] + " and " + p[1] + " and sizes between " + a[0] + " and "
                        + a[1] + " and rooms between " + h[0] + " and " + h[1] + " order by posttime desc";

                hql2_2 = "from Post where types=1 and location ='" + loc + "' and mo" +
                        "ney between " + p[0] + " and " + p[1] + " and sizes between " + a[0] + " and "
                        + a[1] + " and rooms between " + h[0] + " and " + h[1] + " order by money";
            }
        }

        PageBean pageBean2 = PageBean.getPageBean(8, page, hql2);
        PageBean pageBean2_2 = PageBean.getPageBean(8, page, hql2_2);

        request.setAttribute("pageBean2", pageBean2);
        request.setAttribute("pageBean2_2", pageBean2_2);
        return "selsuccess_sale";
    }

    public String getCastQuery() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String hql1, hql2, hql3, hql1_2, hql2_2, hql3_2;
        ActionContext.getContext().getSession().put("cast", cast);
        if (cast.equals("")) {
            hql1 = "from Post where types = 0" + " order by posttime desc";
            hql2 = "from Post where types = 1" + " order by posttime desc";
            hql3 = "from Help" + " order by posttime desc";

            hql1_2 = "from Post where types = 0 order by money";
            hql2_2 = "from Post where types = 1 order by money";
            hql3_2 = "from Help order by money";
        } else {
            hql1 = "from Post where types = 0 and title like '%" + cast + "%'" + " order by posttime desc";
            hql2 = "from Post where types = 1 and title like '%" + cast + "%'" + " order by posttime desc";
            hql3 = "from Help where title like '%" + cast + "%'";

            hql1_2 = "from Post where types = 0 and title like '%" + cast + "%'" + " order by money";
            hql2_2 = "from Post where types = 1 and title like '%" + cast + "%'" + " order by money";
            hql3_2 = "from Help where title like '%" + cast + "%'" + " order by money";
        }
        PageBean pageBean1 = PageBean.getPageBean(8, page, hql1);
        PageBean pageBean2 = PageBean.getPageBean(8, page, hql2);
        PageBean pageBean3 = PageBean.getPageBean(8, page, hql3);

        PageBean pageBean1_2 = PageBean.getPageBean(8, page, hql1_2);
        PageBean pageBean2_2 = PageBean.getPageBean(8, page, hql2_2);
        PageBean pageBean3_2 = PageBean.getPageBean(8, page, hql3_2);

        request.setAttribute("pageBean1", pageBean1);
        request.setAttribute("pageBean2", pageBean2);
        request.setAttribute("pageBean3", pageBean3);

        request.setAttribute("pageBean1_2", pageBean1_2);
        request.setAttribute("pageBean2_2", pageBean2_2);
        request.setAttribute("pageBean3_2", pageBean3_2);
        if (tab.equals("1")) {
            return "castsuccess_rent";
        } else if (tab.equals("2")) {
            return "castsuccess_sale";
        } else {
            return "castsuccess_needrent";
        }
    }

    public String detail() {
        Post p = new Post();
        UserDao ud = new UserDaoImpl();
        p = pd.getPost(Integer.parseInt(detail));
        String iconPath = new String();
        iconPath = ud.getUser(p.getPostid()).getIcon();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("detail", p);
        request.setAttribute("path", iconPath);
        if (p.getTypes() == 0) {
            return "detail_rent";
        } else {
            return "detail_sale";
        }
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public String getPlotname() {
        return plotname;
    }

    public void setPlotname(String plotname) {
        this.plotname = plotname;
    }

    public String getHousetype() {
        return housetype;
    }

    public void setHousetype(String housetype) {
        this.housetype = housetype;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getPostmoney() {
        return postmoney;
    }

    public void setPostmoney(String postmoney) {
        this.postmoney = postmoney;
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

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
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

    public String getFind() {
        return find;
    }

    public void setFind(String find) {
        this.find = find;
    }

    public String getUpId() {
        return upId;
    }

    public void setUpId(String upId) {
        this.upId = upId;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTab() {
        return tab;
    }

    public void setTab(String tab) {
        this.tab = tab;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

    public String getSizes() {
        return sizes;
    }

    public void setSizes(String sizes) {
        this.sizes = sizes;
    }

    public String getRooms() {
        return rooms;
    }

    public void setRooms(String rooms) {
        this.rooms = rooms;
    }

    public String getCast() {
        return cast;
    }

    public void setCast(String cast) {
        this.cast = cast;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
