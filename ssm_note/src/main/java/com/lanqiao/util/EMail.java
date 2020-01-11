package com.lanqiao.util;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
 
/**
 * 发送邮件的测试程序(适用qq邮箱)
 * 通过本人的qq邮箱: xxx@qq.com 发送邮件
 * @author HAOWL
 * 
 */
public class EMail {
 
	//发送的邮箱 内部代码只适用qq邮箱
	private static final String USER = "1146784017@qq.com";
	//授权密码 通过QQ邮箱设置->账户->开启POP3/SMTP服务获取授权码
	private static final String PWD = "lpnlbtmjhaxnheae";
	private String[] to;
	private String subject;//主题
	private String content;//内容，可以用html语言写
	
	public void sendMessage() throws MessagingException, UnsupportedEncodingException {
        // 配置发送邮件的环境属性
        final Properties props = new Properties();
        //下面两段代码是设置ssl和端口，不设置发送不出去。
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        
        // 表示SMTP发送邮件，设置传输协议
        props.setProperty("mail.transport.protocol", "smtp");
        //身份验证
        props.put("mail.smtp.auth", "true");
        //QQ邮箱的服务器 如果是企业邮箱或者其他邮箱得更换该服务器地址
        props.put("mail.smtp.host", "smtp.qq.com");
        
        // 发件人的账号
        props.put("mail.user", USER);
        // 访问SMTP服务时需要提供的密码 
        props.put("mail.password", PWD);
      
        // 构建授权信息，用于进行SMTP身份验证
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
        
        // 使用环境属性和授权信息，创建邮件会话
        Session mailSession = Session.getInstance(props, authenticator);
        
        // 创建邮件消息
        MimeMessage message = new MimeMessage(mailSession);
        
        // 设置发件人
        InternetAddress form = new InternetAddress(props.getProperty("mail.user"));
        message.setFrom(form);
        
        //发送
        if (to != null) { 
        	String toList = getMailList(to); 
        	InternetAddress[] iaToList = new InternetAddress().parse(toList); 
        	message.setRecipients(RecipientType.TO, iaToList); // 收件人 
        } 
       
        message.setSentDate(new Date()); // 发送日期 该日期可以随意写,你可以写上昨天的日期（效果很特别,亲测,有兴趣可以试试）,或者抽象出来形成一个参数。
        message.setSubject(subject); // 主题 
        message.setText(content); // 内容 
        //显示以html格式的文本内容 
        BodyPart messageBodyPart = new MimeBodyPart(); 
        Multipart multipart = new MimeMultipart(); 
        messageBodyPart.setContent(content,"text/html;charset=utf-8"); 
        multipart.addBodyPart(messageBodyPart); 
       
        message.setContent(multipart); 
        // 发送邮件
        Transport.send(message);
    }
 
	public void setTo(String[] to) {
		this.to = to;
	}
 
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	
	private String getMailList(String[] mailArray) { 
		StringBuffer toList = new StringBuffer(); 
		int length = mailArray.length; 
		if (mailArray != null && length < 2) { 
			toList.append(mailArray[0]); 
		} else { 
			for (int i = 0; i < length; i++) { 
				toList.append(mailArray[i]); 
				if (i != (length - 1)) { 
					toList.append(","); 
				} 
			} 
		} 
		return toList.toString(); 
	} 
	
	
	
	//以下是演示demo
	public static void main(String args[]) {
		EMail mail = new EMail();
		mail.setSubject("这个是标题");
		String str = "点击如下的链接，激活账号<br> <a href='http://localhost:8086/user/active?username='>点击</a>";
		mail.setContent(str);
		//收件人 可以发给其他邮箱(163等) 下同
		mail.setTo(new String[] {"639735331@qq.com"});
		
		//发送邮件
		try {
			mail.sendMessage();
			System.out.println("发送邮件成功！");
		} catch (Exception e) {
			System.out.println("发送邮件失败！");
			e.printStackTrace();
		}
	}
}