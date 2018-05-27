/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author TGMaster
 */
public class Mail {

    public static void sendEmailRegistrationLink(int id, String email, String hash) throws AddressException, MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", Info.MAIL_SMTP_HOST);
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Info.MAIL_USERNAME, Info.MAIL_PASSWORD);
            }
        });

        String link = Info.VERIFY_SITE + "?action=" + Info.ACTIVATION + "&userId=" + id + "&key=" + hash;

        StringBuilder bodyText = new StringBuilder();
        bodyText.append("<div>")
                .append("  Dear User<br/><br/>")
                .append("  Thank you for registration. Your mail (" + email + ") is under verification<br/>")
                .append("  Please click <a href=\"" + link + "\">here</a> or open below link in browser<br/>")
                .append("  <a href=\"" + link + "\">" + link + "</a>")
                .append("  <br/><br/>")
                .append("  Thanks,<br/>")
                .append("  Doctor Strange")
                .append("</div>");
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(Info.MAIL_USERNAME));
        message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(email));
        message.setSubject("Email Registration");
        message.setContent(bodyText.toString(), "text/html; charset=utf-8");
        Transport.send(message);
    }

    public static void sendResetPasswordLink(int id, String email, String hash) throws AddressException, MessagingException {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", Info.MAIL_SMTP_HOST);
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Info.MAIL_USERNAME, Info.MAIL_PASSWORD);
            }
        });

        String link = Info.VERIFY_SITE + "?action=" + Info.RESET_PASSWORD + "&userId=" + id + "&key=" + hash;

        StringBuilder bodyText = new StringBuilder();
        bodyText.append("<div>")
                .append("  Dear User<br/><br/>")
                .append("  We got your reset password request, Find below link to reset password <br/>")
                .append("  Please click <a href=\"" + link + "\">here</a> or open below link in browser<br/>")
                .append("  <a href=\"" + link + "\">" + link + "</a>")
                .append("  <br/><br/>")
                .append("  Thanks,<br/>")
                .append("  SodhanaLibrary Team")
                .append("</div>");
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(Info.MAIL_USERNAME));
        message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(email));
        message.setSubject("Reset Password");
        message.setContent(bodyText.toString(), "text/html; charset=utf-8");
        Transport.send(message);
    }

}
