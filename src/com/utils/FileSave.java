package com.utils;

import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class FileSave {
    public static String saveFile(String filename, File file) throws Exception {
        String url = ServletActionContext.getServletContext().getRealPath("/uploadFiles")
                + "\\" + (Dates.getFileDate());
        File f = new File(url);
        if (!f.exists()) {
            f.mkdirs();
        }
        String path = f + "\\" + filename;
        FileOutputStream fos = new FileOutputStream(path);
        FileInputStream fis = new FileInputStream(file);
        byte[] buffer = new byte[1024];
        int len = 0;
        while ((len = fis.read(buffer)) > 0) {
            fos.write(buffer, 0, len);
        }
        fis.close();
        fos.close();
        String[] p=path.split("House_war_exploded\\\\");
        System.out.println(p[1]);
        return p[1];
    }
}
