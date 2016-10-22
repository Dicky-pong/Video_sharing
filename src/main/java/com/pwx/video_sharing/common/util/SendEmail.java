package com.pwx.video_sharing.common.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.SecureRandom;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class SendEmail {

    private MimeMessage message;
    private Session     session;
    private Transport   transport;

    private String      mailHost        = "";
    private String      sender_username = "";
    private String      sender_password = "";

    private Properties  properties      = new Properties();

    //初始化
    public SendEmail(boolean debug){
        //获取邮箱配置文件
        InputStream in = SendEmail.class.getResourceAsStream("/MailServer.properties");
        try {
            //加载配置文件
            properties.load(in);
            //获取smtp地址
            this.mailHost = properties.getProperty("mail.smtp.host");
            //用户名
            this.sender_username = properties.getProperty("mail.sender.username");
            //密码
            this.sender_password = properties.getProperty("mail.sender.password");
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        //根据邮箱配置文件创建Session对象
        session = Session.getInstance(properties);
        session.setDebug(debug);// 开启后有调试信息
        //创建邮箱对象
        message = new MimeMessage(session);
    }
    
    

    /**
     * 发送邮件
     * 
     * @param subject 邮件主题
     * @param sendHtml 邮件内容
     * @param receiveUser 收件人地址
     * @param attachment 附件
     * return 0:发送成功 1:发送失败
     */
    public String doSendHtmlEmail(String title, String sendHtml, String receiveUser, File attachment) {
        try {
            // 发件人
            InternetAddress from = new InternetAddress(sender_username);
            message.setFrom(from);

            // 收件人
            InternetAddress to = new InternetAddress(receiveUser);
            message.setRecipient(Message.RecipientType.TO, to);

            // 邮件主题
            message.setSubject(title);

            // 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
            Multipart multipart = new MimeMultipart();

            // 添加邮件正文
            BodyPart contentPart = new MimeBodyPart();
            contentPart.setContent(sendHtml, "text/html;charset=UTF-8");
            multipart.addBodyPart(contentPart);

            // 添加附件的内容
            if (attachment != null) {
                BodyPart attachmentBodyPart = new MimeBodyPart();
                DataSource source = new FileDataSource(attachment);
                attachmentBodyPart.setDataHandler(new DataHandler(source));

                // 网上流传的解决文件名乱码的方法，其实用MimeUtility.encodeWord就可以很方便的搞定
                // 这里很重要，通过下面的Base64编码的转换可以保证你的中文附件标题名在发送时不会变成乱码
                // sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
                // messageBodyPart.setFileName("=?GBK?B?" +
                // enc.encode(attachment.getName().getBytes()) + "?=");

                // MimeUtility.encodeWord可以避免文件名乱码
                attachmentBodyPart.setFileName(MimeUtility.encodeWord(attachment.getName()));
                multipart.addBodyPart(attachmentBodyPart);
            }

            // 将multipart对象放到message中
            message.setContent(multipart);
            // 保存邮件
            message.saveChanges();

            transport = session.getTransport("smtp");
            // smtp验证，就是你用来发邮件的邮箱用户名密码
            transport.connect(mailHost, sender_username, sender_password);
            // 发送
            transport.sendMessage(message, message.getAllRecipients());

            return "0";
        } catch (Exception e) {
            e.printStackTrace();
            return "1";
        } finally {
            if (transport != null) {
                try {
                    transport.close();
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    public static void main(String[] args) throws Exception {
        /*SendEmail sendEmail = new SendEmail(false);
        File affix = new File("D:\\rsa\\zhlt.pem");
        sendEmail.doSendHtmlEmail("测试发送邮件", "只为测试", "12386186@qq.com", affix);*/
        String str = "xxx@xx.xx";  
        String key = "12345678";  
        String encrytStr;  
        byte[] encrytByte;  
        byte[] byteRe = enCrypt(str,key);  
          
        //加密过的二进制数组转化成16进制的字符串  
        encrytStr = parseByte2HexStr(byteRe);         
          
        //加密过的16进制的字符串转化成二进制数组  
        encrytByte = parseHexStr2Byte(encrytStr);         
    }
    
    /** 
     * 加密函数 
     * @param content   加密的内容 
     * @param strKey    密钥 
     * @return          返回二进制字符数组 
     * @throws Exception 
     */  
    public static byte[] enCrypt(String content,String strKey) throws Exception{  
        KeyGenerator keygen;          
        SecretKey desKey;  
        Cipher c;         
        byte[] cByte;  
        String str = content;  
          
        
        
        SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
        secureRandom.setSeed(strKey.getBytes());
        
        
        keygen = KeyGenerator.getInstance("AES");  
        keygen.init(128, secureRandom);  
          
        desKey = keygen.generateKey();        
        c = Cipher.getInstance("AES");  
          
        c.init(Cipher.ENCRYPT_MODE, desKey);  
        
        
        
       /* keygen = KeyGenerator.getInstance("AES");  
        keygen.init(128, new SecureRandom(strKey.getBytes()));  
          
        desKey = keygen.generateKey();        
        c = Cipher.getInstance("AES");  
          
        c.init(Cipher.ENCRYPT_MODE, desKey);  */
          
        cByte = c.doFinal(str.getBytes("UTF-8"));         
          
        return cByte;  
    }  
      
    /** 解密函数 
     * @param src   加密过的二进制字符数组 
     * @param strKey  密钥 
     * @return 
     * @throws Exception 
     */  
    public static String deCrypt (byte[] src,String strKey) throws Exception{  
        KeyGenerator keygen;          
        SecretKey desKey;  
        Cipher c;         
        byte[] cByte;     
          
        
        SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
        secureRandom.setSeed(strKey.getBytes());
        
        
        keygen = KeyGenerator.getInstance("AES");  
        keygen.init(128, secureRandom);  
          
        desKey = keygen.generateKey();        
        c = Cipher.getInstance("AES");  
          
        c.init(Cipher.DECRYPT_MODE, desKey);  
        
        /*
        
        keygen = KeyGenerator.getInstance("AES");  
        keygen.init(128, new SecureRandom(strKey.getBytes()));  
          
        desKey = keygen.generateKey();  
        c = Cipher.getInstance("AES");  
          
        c.init(Cipher.DECRYPT_MODE, desKey);  */
          
          
        cByte = c.doFinal(src);   
          
        return new String(cByte,"UTF-8");  
    }  
      
      
    /**2进制转化成16进制 
     * @param buf 
     * @return 
     */  
    public static String parseByte2HexStr(byte buf[]) {  
        StringBuffer sb = new StringBuffer();  
        for (int i = 0; i < buf.length; i++) {  
            String hex = Integer.toHexString(buf[i] & 0xFF);  
            if (hex.length() == 1) {  
                hex = '0' + hex;  
                }  
            sb.append(hex.toUpperCase());  
            }  
        return sb.toString();  
        }  
      
      
    /**将16进制转换为二进制 
     * @param hexStr 
     * @return 
     */       
    public static byte[] parseHexStr2Byte(String hexStr) {   
            if (hexStr.length() < 1)   
                    return null;   
            byte[] result = new byte[hexStr.length()/2];   
            for (int i = 0;i< hexStr.length()/2; i++) {   
                    int high = Integer.parseInt(hexStr.substring(i*2, i*2+1), 16);   
                    int low = Integer.parseInt(hexStr.substring(i*2+1, i*2+2), 16);   
                    result[i] = (byte) (high * 16 + low);   
            }   
            return result;   
    }   
}
