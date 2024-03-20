
package com.nikhil.backend;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendConfirmationMail {
    public static void senConfirmationMail(String to_mail){
        final String from_email = "pallnikhil2000@gmail.com";
        final String password = "48642850A1B668B058002699325790C27E18";
        // 1. Create a instance of properties class
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.elasticemail.com");
        props.put("mail.smtp.port", "2525");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        props.setProperty("mail.smtp.user", "pallnikhil2000@gmail.com");
        props.setProperty("mail.smtp.password", "Nikhil@123");
        
        Session session = Session.getInstance(props, new Authenticator(){
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from_email,password);
            }
        });
        
        try{
            MimeMessage mimemsg = new MimeMessage(session);
            mimemsg.setFrom(new InternetAddress(from_email));
            mimemsg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_mail));
            mimemsg.setSubject("Thank You fro reaching us!");
            mimemsg.setText("We received you message. Thank you for reaching us, we solve your query as soon as posible.\n If You want to unsuscribe click below : ");
            Transport.send(mimemsg);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
