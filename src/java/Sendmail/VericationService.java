///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package Sendmail;
//
//import DAL.VerificationTokenDAO;
//import java.util.UUID;
//
///**
// *
// * @author FPT
// */
//public class VericationService {
//    private VerificationTokenDAO verificationTokenDAO;
//    private EmailService emailService;
//
//    public VericationService(VerificationTokenDAO verificationTokenDAO, EmailService emailService) {
//        this.verificationTokenDAO = verificationTokenDAO;
//        this.emailService = emailService;
//    }
//
//    
//
//    // Phương thức gửi email xác thực
//    public void sendVerificationEmail(int userId, String userEmail) {
//        String verificationToken = UUID.randomUUID().toString();
//        String verificationLink = "http://localhost:8080/swp391/verify?token=" + verificationToken;
//        
//
//        // Gửi email xác thực
//        emailService.sendVerificationEmail(userEmail, verificationLink);
//
//        // Lưu mã xác thực vào cơ sở dữ liệu
//        verificationTokenDAO.saveVerificationToken(userId, verificationToken);
//    }
//
//    // Phương thức kiểm tra mã xác thực
//    public boolean verifyToken(String token) {
//    Integer userId = verificationTokenDAO.getUserIdByToken(token);
//    if (userId != null) {
//        // Kích hoạt tài khoản người dùng
//        verificationTokenDAO.activateUserAccount(userId);
//        return true; // Xác thực thành công
//    }
//    return false; // Xác thực thất bại
//}
//   
//}
