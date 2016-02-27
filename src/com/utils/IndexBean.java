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
        int count;
        int num= Paging.getAllRowCount(hql);
        if(num<=16) count=num;
        else count = 16;
        List list=Paging.queryByPage(hql,1,count);
        String[] path=new String[num];
        for(int i=0;i<count;i++){
            int n= (int)(Math.random()*4+1);
            path[i]="img/m"+n+".jpg";
        }

        indexBean.setAllList(list);
        indexBean.setPath(path);
        return indexBean;
    }
}
