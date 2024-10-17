/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sendmail;

import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataHandler;
import javax.activation.DataSource;

/**
 *
 * @author FPT
 */
public class Email {
    //yplj gfrn yypw aegx
    
    public String getRamdom(){
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
    //
    public static void sendResetEmail(String recipientEmail, String token) {
        final String senderEmail = "nguyentrungtien512003@gmail.com";
        final String senderPassword = "yplj gfrn yypw aegx";
        final String host = "smtp.gamil.com";

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Password Reset Request");
            message.setText("To reset your password, click the link below:\n" +
                    "http://yourdomain.com/reset-password?token=" + token);

            Transport.send(message);
            System.out.println("Reset email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
//    public static void main(String[] args) {
//        final String form = "nguyentrungtien512003@gmail.com";
//        final String password = "yplj gfrn yypw aegx";
//        
//        
//        //kai báo thuộc tính
//        Properties props = new Properties();
//        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP HOST
//        props.put("mail.smtp.port", "587"); //TLS 587 SSL 465
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        
//        //tạo xác thực
//        Authenticator auth = new Authenticator() {
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(form,password); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
//            }
//            
//        };
//        //phiên làm việc
//        Session session = Session.getInstance(props, auth);
//        
//        //thực hiện hành động(gửi email)
//        final String to = "tiennthe171977@fpt.edu.vn";
//        MimeMessage mgs = new MimeMessage(session);
//        try {
//            //Kiểu nội dung
//            mgs.addHeader("Content-type", "text/HTML; charset=UTF-8");
//            //Người gửi
//            mgs.setFrom(form);
//            //Người nhận
//            mgs.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to,false));
//            //Tiêu đề email
//            mgs.setSubject("thử nghiệm");
//            //ngày gửi
//            mgs.setSentDate(new Date());
//            //quydinh em mail nhận phản hồi
//            //mgs.setReplyTo(InternetAddress.parse(form,false));
//            //nội dung
//            mgs.setText("Ngơ luôn", "UTF-8");
//            //gửi email
//            Transport.send(mgs);
//            
//            
//        } catch (MessagingException ex) {
//            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
