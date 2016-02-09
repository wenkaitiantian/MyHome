package com.utils;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
    public static String sendMessage(String address) throws Exception {
        Properties prop = new Properties();
        prop.setProperty("mail.host", "smtp.sohu.com");
        prop.setProperty("mail.transport.protocol", "smtp");
        prop.setProperty("mail.smtp.auth", "true");
        //使用JavaMail发送邮件的5个步骤
        //1、创建session
        Session session = Session.getInstance(prop);
        //开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
        session.setDebug(true);
        //2、通过session得到transport对象
        Transport ts = session.getTransport();
        //3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
        ts.connect("smtp.sohu.com", "ppag110254e9e908", "yuanguangxin");
        //4、创建邮件
        int num = (int) (Math.random() * 1000000);
        String code = String.valueOf(num);
        if (code.length() < 6) {
            code = "0" + code;
        }
        //创建邮件对象
        MimeMessage message = new MimeMessage(session);
        //指明邮件的发件人
        message.setFrom(new InternetAddress("ppag110254e9e908@sohu.com"));
        //指明邮件的收件人
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(address));
        //邮件的标题
        message.setSubject("邮箱验证");
        //邮件的文本内容
        String content = "欢迎您注册二手房交易平台，本次注册的验证码为" +
                code + "." + "\n" + "请勿回复本邮件, 此邮箱未受监控, 您不会得到任何回复. " +
                "要获得帮助, 请登录网站。" + "\n" + "如非本人操作，请忽略此邮件。";
        message.setContent(content, "text/plain;charset=UTF-8");
        //5、发送邮件
        ts.sendMessage(message, message.getAllRecipients());
        ts.close();
        return code;
    }
}
