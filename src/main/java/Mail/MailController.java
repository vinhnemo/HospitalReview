/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mail;

/**
 *
 * @author TGMaster
 */

import java.util.*;
import java.util.logging.*;
import javax.mail.*;
import javax.mail.internet.*;

public class MailController {

    public boolean sendMail(Mail email) {

        Properties props = new Properties();
        // -- Attaching to default Session, or we could start a new one --
        props.put("mail.smtp.auth", "true");
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.host", email.smtpServ);

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("service.gamelord@gmail.com", "gamelord123");
            }
        });

        try {
            // -- Create a new message --
            Message msg = new MimeMessage(session);
            // -- Set the FROM and TO fields --
            msg.setFrom(new InternetAddress(email.from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email.to, false));
            msg.setSubject(email.subject);
            msg.setContent(email.message, "text/html; charset=utf-8");
            // -- Set some other header information --
            msg.setHeader("[CONTACT] ", "Gamelord Company");
            msg.setSentDate(new Date());
            // -- Send the message --
            Transport.send(msg);

            return true;

        } catch (MessagingException ex) {
            Logger.getLogger(MailController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}