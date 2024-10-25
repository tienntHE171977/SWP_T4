package Sendmail;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Users;

public class EmailSender {

    private static final String FORM = "nguyentrungtien512003@gmail.com";
    private static final String PASSWORD = "litd zjrr nidm bvkj";

    public static void sendEmail(String recipient, String code) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FORM, PASSWORD);
            }
        };

        // Tạo phiên làm việc với thông tin cấu hình và xác thực
        Session session = Session.getInstance(props, auth);

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FORM));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject("Verify OTP");

            message.setText("Your verification code is: " + code);

            Transport.send(message);
            System.out.println("Email đã được gửi thành công!");

        } catch (MessagingException e) {
            // Ghi lại lỗi sử dụng một hệ thống logging
            e.printStackTrace();
        }
    }

    public static void sendReplyEmail(String recipient, String subject, String replyMessage) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FORM, PASSWORD);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FORM));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject("Phản hồi từ Charifit Page: " + subject);
            message.setText(replyMessage);

            Transport.send(message);
            System.out.println("Reply email sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void sendEmailToUser(Users user, String code) {
        if (user != null && user.getEmail() != null) {
            sendEmail(user.getEmail(), code);
        } else {
            System.out.println("Người dùng hoặc email không hợp lệ.");
        }
    }

    public static void main(String[] args) {
        // Tạo một đối tượng người dùng với email
        Users user = new Users();
        user.setEmail("nguyentrungtien512003@gmail.com"); // Thay thế bằng email người nhận

        // Mã xác nhận để gửi
        String verificationCode = "123456";

        // Gửi email
        EmailSender.sendEmailToUser(user, verificationCode);
    }
}
