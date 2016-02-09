package com.utils;

import java.util.List;

public class PageBean {
    private List list; //通过hql从数据库分页查询出来的list集合
    private int allRows; //总记录数
    private int totalPage; //总页数
    private int currentPage; //当前页

    private PageBean() {

    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getAllRows() {
        return allRows;
    }

    public void setAllRows(int allRows) {
        this.allRows = allRows;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalPages(int pageSize, int allRows) {
        int totalPage = (allRows % pageSize == 0) ? (allRows / pageSize) : (allRows / pageSize) + 1;
        return totalPage;
    }

    public int getCurrentPageOffset(int pageSize, int currentPage) {
        int offset = pageSize * (currentPage - 1);
        return offset;
    }

    public int getCurPage(int page) {
        int currentPage = (page == 0) ? 1 : page;
        return currentPage;
    }

    public static PageBean getPageBean(int pageSize, int page, String hql) {
        PageBean pageBean = new PageBean();
        int allRows = Paging.getAllRowCount(hql);
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        int currentPage = pageBean.getCurPage(page);
        int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
        List list = Paging.queryByPage(hql, offset, pageSize);
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }
}
