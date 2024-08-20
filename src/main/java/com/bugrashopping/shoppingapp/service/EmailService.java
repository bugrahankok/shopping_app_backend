package com.bugrashopping.shoppingapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;
import jakarta.mail.MessagingException;
import java.util.Random;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public String sendVerificationCode(String toEmail) {
        String verificationCode = generateVerificationCode();

        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);

        try {
            helper.setSubject("Email Doğrulama Kodu");
            helper.setFrom("bugrashoppingapp@gmail.com");
            helper.setTo(toEmail);
            helper.setText("Doğrulama kodunuz: " + verificationCode);
            mailSender.send(mimeMessage);
        } catch (MessagingException e) {
            throw new RuntimeException("E-posta gönderilemedi.");
        }

        return verificationCode;
    }

    private String generateVerificationCode() {
        return String.valueOf(new Random().nextInt(999999));
    }
}
