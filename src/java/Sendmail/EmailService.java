/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sendmail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author FPT
 */
public class EmailService {

    private final String username = "nguyentrungtien512003@gmail.com";
    private final String password = "litd zjrr nidm bvkj";

    public boolean sendVerificationEmail(String recipientEmail, String verificationLink) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Verify Your Email");
            message.setHeader("Content-Type", "text/html; charset=UTF-8");
            // Tạo nội dung email
            String emailContent = "<!DOCTYPE html>"
                    + "<html>"
                    + "<head>"
                    + "<meta charset='utf-8'>"
                    + "<title>Email Confirmation</title>"
                    + "</head>"
                    + "<body>"
                    + "<h1>Confirm Your Email Address</h1>"
                    + "<p>Tap the button below to confirm your email address.</p>"
                    + "<a href='" + verificationLink + "' style='background-color: #1a82e2; color: white; padding: 10px 20px; text-decoration: none;'>Xác Nhận Email</a>"
                    + "<p>If you didn't create an account, you can safely delete this email.</p>"
                    + "<p>Cheers,<br>Your Company</p>"
                    + "</body>"
                    + "</html>";

            message.setContent(emailContent, "text/html; charset=UTF-8");
            Transport.send(message);
            System.out.println("Email sent successfully!");
            return true; // Email sent successfully

        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Failed to send email: " + e.getMessage());
            return false; // Failed to send email
        }
    }

}
