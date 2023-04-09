package com.tech.blog.entities;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class SendEmail 
{
    public String getRandom()
    {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        
        return String.format("%06d", number);
    }
    
    public boolean sendEmail(user user)
    {
        boolean test = false;
        String toEmail = user.getEmail();
        final String fromEmail ="mayank7895bisht@gmail.com";
        final String password ="qasnyxxccladcjrp";
        
        try
        {
            Properties pr = new Properties();
             pr.put("mail.smtp.auth", true);
             pr.put("mail.smtp.starttls.enable", true);
             pr.put("mail.smtp.port", "587");
             pr.put("mail.smtp.host", "smtp.gmail.com");
             pr.put("mail.smtp.auth", true);
             
//             get session
             Session session = Session.getInstance(pr, new Authenticator() 
             {
                 @Override
                 protected PasswordAuthentication getPasswordAuthentication()
                 {
                     return new PasswordAuthentication(fromEmail , password);
                 }
             });
             
             MimeMessage mess = new MimeMessage(session);
             
             mess.setFrom(new InternetAddress(fromEmail));
             mess.setRecipient(jakarta.mail.Message.RecipientType.TO, new InternetAddress(toEmail));
             mess.setSubject("User Verification");
             mess.setText("Regester Successful Please Veriy using this code : " + user.getCode());
             Transport.send(mess);
             
             test = true;
        }
        catch(Exception e)
        {
             e.printStackTrace();
        }
        
        return test;
    }
}
