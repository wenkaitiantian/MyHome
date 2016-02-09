package com.utils;

import java.util.List;

public class IndexBean {
    private List allList;
    private String[] path;
    private IndexBean(){

    }

    public List getAllList() {
        return allList;
    }

    public void setAllList(List allList) {
        this.allList = allList;
    }

    public String[] getPath() {
        return path;
    }

    public void setPath(String[] path) {
        this.path = path;
    }

    public static IndexBean getIndexBean(String hql){
        IndexBean indexBean=new IndexBean();
        int num= Paging.getAllRowCount(hql);
        List list=Paging.getAllList(hql);
        String[] path=new String[num];
        for(int i=0;i<num;i++){
            int n= (int)(Math.random()*4+1);
            path[i]="img/m"+n+".jpg";
        }

        indexBean.setAllList(list);
        indexBean.setPath(path);
        return indexBean;
    }
}
